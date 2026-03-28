#' @export
format.npi <- function(x, ...) {
  out <- formatC(vec_data(x))
  out[is.na(x)] <- NA_integer_
  out
}

#' @export
#' @exportS3Method vctrs::vec_ptype_abbr
vec_ptype_abbr.npi <- function(x, ...) "npi"
#' @export
#' @exportS3Method vctrs::vec_ptype_full
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
