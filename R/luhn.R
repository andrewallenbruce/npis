#' Luhn Check
#'
#' Helpers to construct the Luhn algorithm check
#'
#' @param x a vector
#' @inheritParams rlang::args_error_context
#' @returns An integer vector
#' @examples
#' try(check_luhn(generate(100)))
#' @export
check_luhn <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  raw <- last_digit(x)
  act <- check_digit(x)
  if (!collapse::all_identical(raw, act)) {
    i <- raw %!=% act
    len <- prettyNum(length(i), big.mark = ',')
    cli::cli_abort(
      c(
        "An {.cls npi} must pass the Luhn check.",
        "x" = "{.field {len}} Invalid locations.",
        cli::format_bullets_raw(c(
          paste(cli::symbol$bullet, x[i[1:5]]), # TODO Fix hardcoded length
          "and more..."
        ))
      ),
      arg = arg,
      call = call
    )
  }
}

#' @noRd
ndigits_check <- function(x) {
  if (all_10_digits(x)) x else which_not_10(x)
}
#' @noRd
payload <- function(x) {
  # all but last digit
  x %/% 10L
}

#' @noRd
explode <- function(x) {
  as.integer(
    unlist_(
      strsplit(
        as.character(x),
        split = "",
        fixed = TRUE
      )
    )
  )
}

nine_ <- c(1L, 3L, 5L, 7L, 9L)

#' @export
#' @rdname check_luhn
check_digit <- function(x) {
  # all input should be 10 digits
  # x <- example_()[1:5]
  # x <- collapse::na_rm(x)

  x <- matrix(
    explode(payload(x)),
    nrow = vctrs::vec_size(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, nine_] <- x[, nine_] * 2L

  x[, nine_] <- cheapr::if_else_(
    x[, nine_] > 9L,
    x[, nine_] - 9L,
    x[, nine_]
  )

  x <- matrixStats::rowSums2(x) + 24L
  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)

  # cheapr::subtract_(cheapr::multiply_(cheapr::ceiling_(cheapr::divide_(x, 10L)), 10L), x)
  # as.integer(cheapr::ceiling_(x %/=% 10L) %*=% 10L %-=% x)
}

#' @export
#' @rdname check_luhn
last_digit <- function(x) {
  x %% 10L
}

#' @export
#' @rdname check_luhn
luhn_check <- function(x) {
  i <- vctrs::vec_compare(last_digit(x), check_digit(x), na_equal = TRUE)
  if (collapse::allv(i, 0L)) {
    return(x)
  } else {
    x[i %!=% 0L] <- NA_integer_
    x
    # collapse::setv(x, collapse::whichv(i, 0L, TRUE), NA_integer_)
  }
}

#' @export
#' @rdname check_luhn
example_ <- function() {
  get_pin("examples")
}
