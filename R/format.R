#' @method format npi
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
