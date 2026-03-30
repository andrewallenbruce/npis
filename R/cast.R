#' Casting
#'
#' Double dispatch methods to support [vctrs::vec_cast()].
#'
#' @inheritParams vctrs::vec_cast
#' @keywords internal
#' @method vec_cast npi
#' @export
#' @export vec_cast.npi
vec_cast.npi <- function(x, to, ...) {
  UseMethod("vec_cast.npi")
}

#' @method vec_cast.npi default
#' @export
vec_cast.npi.default <- function(x, to, ...) {
  vec_default_cast(x, to, ...)
}

#' @method vec_cast.npi npi
#' @export
vec_cast.npi.npi <- function(x, to, ...) {
  x
}

#' @method vec_cast.npi integer
#' @export
vec_cast.npi.integer <- function(x, to, ...) {
  npi(x)
}

#' @method vec_cast.integer npi
#' @export
vec_cast.integer.npi <- function(x, to, ...) {
  vec_data(x)
}
