#' @export
#' @method vec_arith npi
vec_arith.npi <- function(op, x, y, ...) {
  UseMethod("vec_arith.npi", y)
}

#' @export
#' @method vec_arith.npi numeric
vec_arith.npi.numeric <- function(op, x, y, ...) {
  switch(
    op,
    "+" = ,
    "-" = ,
    "/" = ,
    "%%" = ,
    "%/%" = vctrs::vec_arith_base(op, x, y),
    vctrs::stop_incompatible_op(op, x, y)
  )
}

#' @export
#' @method vec_arith.numeric npi
vec_arith.numeric.npi <- function(op, x, y, ...) {
  switch(
    op,
    "+" = ,
    "-" = ,
    "/" = ,
    "%%" = ,
    "%/%" = vctrs::vec_arith_base(op, x, y),
    vctrs::stop_incompatible_op(op, x, y)
  )
}

#' @export
#' @method vec_math npi
vec_math.npi <- function(.fn, .x, ...) {
  switch(
    .fn,
    sum = ,
    mean = ,
    cumsum = ,
    vctrs::vec_math_base(.fn, .x, ...)
  )
}

#' @importFrom stats median
#' @export
#' @method median npi
median.npi <- function(x, na.rm = FALSE, ...) {
  median(vctrs::vec_data(x), na.rm = na.rm, ...)
}
