methods::setOldClass(c("npi", "vctrs_vctr"))

#' Construct an `npi` object
#'
#'    - `new_npi()` is a low-level constructor that takes a vector.
#'    - `npi()` constructs an npi object from a vector.
#'    - `as_npi()` and `is_npi()` forward to [vctrs::vec_cast()] and [inherits()], respectively.
#'
#' @param x a vector
#' @param ... Passed on to methods.
#' @returns An S3 vector of class `<npi>`
#' @examples
#' x <- generate(10, 0.2)
#' x
#' is_npi(x)
#'
#' x <- npi(x)
#' x
#' is_npi(x)
#'
#' data.frame(x)
#'
#' tibble::tibble(x)
#'
#' as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#' @export
npi <- function(x = integer()) {
  x <- vec_cast(x, integer())
  vec_assert(x, integer())
  validate_npi(x)
  new_npi(x)
}

#' @export
#' @rdname npi
new_npi <- function(x = integer()) {
  new_vctr(x, class = "npi")
}

#' @export
#' @rdname npi
validate_npi <- function(x) {
  x <- collapse::na_rm(x)
  check_ndigits(x)
  # check_first(x)
  # check_luhn(x)
  invisible(x)
}

#' @export
#' @rdname npi
is_npi <- function(x) {
  inherits(x, "npi")
}

#' @export
#' @rdname npi
as_npi <- function(x, ...) {
  UseMethod("as_npi")
}

#' @export
#' @rdname npi
as_npi.default <- function(x, ...) {
  vec_cast(x, new_npi())
}

#' @export
#' @rdname npi
as_npi.character <- function(x, ...) {
  x <- as.integer(x)
  npi(x)
}

#' @export
#' @rdname npi
as_npi.double <- function(x, ...) {
  x <- as.integer(x)
  npi(x)
}
