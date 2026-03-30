#' Convert a vector to an `npi` object
#'
#' Converts a character or numeric vector of unvalidated NPIs into a validated `<npi>` vector.
#'
#' @param x vector
#' @param ... These dots must be empty
#' @returns An S3 vector of class `<npi>`
#' @examples
#' as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#' @export
as_npi <- function(x, ...) {
  UseMethod("as_npi")
}

#' @export
as_npi.default <- function(x, ...) {
  vec_cast(x, new_npi())
}

#' @export
as_npi.character <- function(x, ...) {
  new_npi(as.integer(x))
}

#' @export
as_npi.double <- function(x, ...) {
  new_npi(as.integer(x))
}
