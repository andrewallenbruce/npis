#' Luhn Check
#'
#' Helpers to construct the Luhn algorithm check
#'
#' @param x a vector
#' @inheritParams rlang::args_error_context
#' @returns An integer vector
#' @examples
#' x <- examples()
#' check_luhn(x)
#' head(x, 20)
#'
#' id <- last_digit(x)
#' head(id, 20)
#'
#' x <- check_digit(x)
#' head(x, 20)
#'
#' all(head(id, 20) == head(x, 20))
#' @export
check_luhn <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  lst <- last_digit(x)
  chk <- check_digit(x)
  if (!collapse::all_identical(lst, chk)) {
    i <- collapse::whichv(lst, chk, invert = TRUE)
    cli::cli_abort(
      c(
        "An {.cls npi} must pass the Luhn check.",
        "i" = "Invalid locations: {.val {i}}."
      ),
      arg = arg,
      call = call
    )
  }
}

#' @export
#' @rdname check_luhn
check_digit <- function(x) {
  IDX <- c(1L, 3L, 5L, 7L, 9L)

  x <- matrix(
    explode(payload(x)),
    nrow = cheapr::vector_length(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, IDX] <- x[, IDX] * 2L
  x[, IDX] <- cheapr::if_else_(x[, IDX] > 9L, x[, IDX] - 9L, x[, IDX])

  x <- rowSums(x) + 24L

  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)
}

#' @export
#' @rdname check_luhn
first_digit <- function(x) {
  as.integer(substring(unclass(x), 1L, 1L))
}

#' @export
#' @rdname check_luhn
last_digit <- function(x) {
  x %% 10L
}

#' @noRd
payload <- function(x) {
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

#' @export
#' @rdname check_luhn
examples <- function() {
  get_pin("examples")
}
