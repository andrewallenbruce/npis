#' Coercion
#'
#' Double dispatch methods to support [vctrs::vec_ptype2()].
#'
#' @inheritParams vctrs::vec_ptype2
#'
#' @method vec_ptype2 npi
#' @export
#' @export vec_ptype2.npi
vec_ptype2.npi <- function(x, y, ..., x_arg = "", y_arg = "") {
  UseMethod("vec_ptype2.npi", y)
}

#' @method vec_ptype2.npi default
#' @export
vec_ptype2.npi.default <- function(x, y, ..., x_arg = "", y_arg = "") {
  vec_default_ptype2(x, y, x_arg = x_arg, y_arg = y_arg)
}

#' @method vec_ptype2.npi npi
#' @export
vec_ptype2.npi.npi <- function(x, y, ...) {
  new_npi()
}

#' @method vec_ptype2.integer npi
#' @export
vec_ptype2.integer.npi <- function(x, y, ...) {
  integer()
}

#' @method vec_ptype2.npi integer
#' @export
vec_ptype2.npi.integer <- function(x, y, ...) {
  integer()
}
