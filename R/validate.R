#' @noRd
in_range <- function(x) {
  ivs::iv_between(x, ivs::iv(1000000004L, 1999999993L))
}

#' @noRd
all_in_range <- function(x) {
  collapse::allv(in_range(x), TRUE)
}

#' Luhn Check
#' @param x an integer vector
#' @returns An integer vector
#' @examples
#' x <- generate(valid = TRUE)
#' check_digit(x)
#' luhn_check(x)
#' @export
luhn_check <- function(x) {
  compared <- vctrs::vec_compare(
    last_digit(x),
    check_digit(x),
    na_equal = TRUE
  )

  if (!collapse::allv(compared, 0L)) {
    x <- cheapr::replace_(
      x,
      compared %!=% 0L,
      NA_integer_
    )
  }
  return(x)
}

# all but last digit
#' @noRd
payload <- function(x) {
  x %/% 10L
}

#' @noRd
last_digit <- function(x) {
  x %% 10L
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

NINE_ <- c(1L, 3L, 5L, 7L, 9L)

#' @inheritParams rlang::args_error_context
#' @export
#' @rdname luhn_check
check_digit <- function(x, call = rlang::current_env()) {
  if (!all_in_range(x)) {
    cli::cli_abort(
      "All input must be 10 digits",
      call = call
    )
  }

  x <- matrix(
    explode(payload(x)),
    nrow = vctrs::vec_size(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, NINE_] <- x[, NINE_] * 2L

  x[, NINE_] <- cheapr::if_else_(
    x[, NINE_] > 9L,
    x[, NINE_] - 9L,
    x[, NINE_]
  )

  x <- matrixStats::rowSums2(x) + 24L
  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)
}

#' @noRd
which_valid_npi <- function(x) {
  x <- collapse::ss(
    x,
    last_digit(x) %==% check_digit(x),
    check = FALSE
  )
  collapse::funique(sort.int(x))
}

#' @noRd
which_valid <- function(x, check = FALSE) {
  x <- collapse::funique(sort.int(x))
  x <- which_valid_npi(x)
  if (!check) {
    return(x)
  }
  last_digit(x)
}
