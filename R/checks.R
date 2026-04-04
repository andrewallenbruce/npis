#' @noRd
n_digits <- function(x) {
  as.integer(cheapr::ceiling_(cheapr::log10_(x)))
}

#' @noRd
first_digit <- function(x) {
  as.integer(x / (cheapr::pow_(10L, cheapr::log10_(x))))
}

#' @noRd
all_10_digits <- function(x) {
  collapse::allv(n_digits(x), 10L)
}

#' @noRd
which_not_10 <- function(x) {
  collapse::whichv(n_digits(x), 10L, invert = TRUE)
}

#' @inheritParams rlang::args_error_context
#' @noRd
check_ndigits <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  if (!all_10_digits(x)) {
    i <- which_not_10(x)

    cli::cli_abort(
      c(
        "An {.cls npi} must be {.val {10L}} digits.",
        "i" = "Invalid locations: {.val {i}}."
      ),
      arg = arg,
      call = call
    )
  }
}
