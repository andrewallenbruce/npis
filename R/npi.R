#' National Provider Identifier
#'
#' @description
#' A National Provider Identifier (NPI) is...
#'
#' @param x integer vector
#'
#' @returns An S3 vctr of class `npi`
#' @examples
#' new_npi()
#' npi()
#' is_npi(npi())
#'
#' x <- generate_npi(10)
#' npi(x)
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
vec_ptype_abbr.npi <- function(x, ...) {
  "npi"
}

#' @export
vec_ptype_full.npi <- function(x, ...) {
  "npi"
}

#' @export
vec_ptype2.npi.npi <- function(x, y, ...) new_npi()

#' @export
vec_cast.npi.npi <- function(x, to, ...) x
