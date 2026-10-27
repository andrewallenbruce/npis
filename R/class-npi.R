methods::setOldClass(c("npi", "vctrs_vctr"))

#' `npi` vector
#'
#' Creates an integer vector that represents National Provider Identifiers
#'
#' @param x
#'  * For `npi()`: A numeric vector
#'  * For `is_npi()`: An object to test.
#' @returns An S3 vector of class `npi`
#' @examples
#' x <- npi(c(123456789, npis::examples, generate(1000L)))
#' head(sort.int(x), 30L)
#' is_npi(x)
#' n_invalid(x)
#' tibble::tibble(x = sort.int(x))
#' @export
npi <- function(x = integer()) {
  x <- vctrs::vec_cast(x, integer())

  if (!all_10_digits(x)) {
    x[which_not_10(x)] <- 1000000000L
  }

  x <- luhn_check(x)

  new_npi(x)
}

#' Low-level Constructor
#' @param x An integer vector
#' @inheritParams rlang::args_error_context
#' @export
#' @keywords internal
new_npi <- function(x = integer(), call = rlang::current_env()) {
  if (!is.integer(x)) {
    cli::cli_abort(
      "{.arg x} must be an integer, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
  vctrs::new_vctr(x, class = "npi")
}

#' @export
#' @rdname npi
is_npi <- function(x) {
  inherits(x, "npi")
}

#' @export
#' @rdname npi
n_invalid <- function(x) {
  if (inherits(x, "npi") && anyNA(x)) {
    length(collapse::whichNA(x))
  } else {
    0L
  }
}


