#' @method format npi
#' @export
format.npi <- function(x, ...) {
  out <- formatC(vec_data(x), format = "d", width = "10")
  out[collapse::whichNA(x)] <- NA
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
