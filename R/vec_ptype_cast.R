#' Internal vctrs methods
#'
#' These are internal vctrs methods.
#'
#' @keywords internal
#'
#' @name vctrs-methods
NULL

#' @method format npi
#' @rdname vctrs-methods
#' @export
format.npi <- function(x, ...) {
  out <- formatC(vec_data(x))
  out[is.na(x)] <- NA_integer_
  out
}

#' @rdname vctrs-methods
#' @export
vec_ptype_abbr.npi <- function(x, ...) {
  "npi"
}

#' @rdname vctrs-methods
#' @export
vec_ptype_full.npi <- function(x, ...) {
  "npi"
}

#' @method vec_ptype2 npi
#' @rdname vctrs-methods
#' @export
vec_ptype2.npi <- function(x, y, ...) {
  UseMethod("vec_ptype2.npi", y)
}

#' @rdname vctrs-methods
#' @export
vec_ptype2.npi.npi <- function(x, y, ...) {
  new_npi()
}
#' @rdname vctrs-methods
#' @export
vec_ptype2.integer.npi <- function(x, y, ...) {
  integer()
}
#' @rdname vctrs-methods
#' @export
vec_ptype2.npi.integer <- function(x, y, ...) {
  integer()
}

#' @method vec_cast npi
#' @rdname vctrs-methods
#' @export
vec_cast.npi <- function(x, to, ...) {
  UseMethod("vec_cast.npi")
}

#' @rdname vctrs-methods
#' @export
vec_cast.npi.npi <- function(x, to, ...) {
  x
}

#' @rdname vctrs-methods
#' @export
vec_cast.npi.integer <- function(x, to, ...) {
  npi(x)
}

#' @rdname vctrs-methods
#' @export
vec_cast.integer.npi <- function(x, to, ...) {
  vec_data(x)
}
