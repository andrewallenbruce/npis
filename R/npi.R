#' Create an `npi` vector
#'
#' This creates an integer vector of valid NPIs.
#'
#' @param x
#'  * For `npi()`: An integer vector.
#'  * For `is_npi()`: An object to test.
#'
#' @returns An S3 vector of class `npi`
#'
#' @examples
#' x <- generate(10)
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
#' @export
npi <- function(x = integer()) {
  x <- vec_cast(x, integer())
  new_npi(x)
}

new_npi <- function(x = integer()) {
  if (!is_integer(x)) {
    abort("`x` must be an integer vector.")
  }
  new_vctr(x, class = "npi")
}

#' @rdname npi
#' @export
is_npi <- function(x) {
  inherits(x, "npi")
}
