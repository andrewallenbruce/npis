#' `npi` vector
#'
#' This creates an integer vector of valid NPIs.
#'
#' @param x
#'  * For `npi()`: An integer vector.
#'  * For `is_npi()`: An object to test.
#' @returns An S3 vector of class `npi`
#' @examples
#' new_npi()
#' npi()
#' is_npi(npi())
#'
#' x <- npi(generate_npi(10))
#' data.frame(x)
#' tibble::tibble(x)
#' @export
npi <- function(x = integer()) {
  x <- vec_cast(x, integer())
  new_npi(x)
}

#' @rdname npi
#' @export
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

#' @export
format.npi <- function(x, ...) {
  out <- formatC(vec_data(x))
  out[is.na(x)] <- NA_integer_
  out
}

#' @export
vec_ptype_abbr.npi <- function(x, ...) "npi"
#' @export
vec_ptype_full.npi <- function(x, ...) "npi"

#' @export
vec_ptype2.npi.npi <- function(x, y, ...) new_npi()
#' @export
vec_ptype2.integer.npi <- function(x, y, ...) integer()
#' @export
vec_ptype2.npi.integer <- function(x, y, ...) integer()

#' @export
vec_cast.npi.npi <- function(x, to, ...) x
#' @export
vec_cast.npi.integer <- function(x, to, ...) npi(x)
#' @export
vec_cast.integer.npi <- function(x, to, ...) vec_data(x)

#' Convert to an `npi` vector
#'
#' This creates an integer vector of valid NPIs.
#'
#' @param x vector
#' @param ... empty dots
#' @returns An S3 vector of class `npi`
#' @examples
#' as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#' @export
as_npi <- function(x, ...) UseMethod("as_npi")

#' @export
as_npi.default <- function(x, ...) vec_cast(x, new_npi())

#' @export
as_npi.character <- function(x, ...) new_npi(as.integer(x))

#' @export
as_npi.double <- function(x, ...) new_npi(as.integer(x))
