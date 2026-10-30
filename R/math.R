#' @export
#' @method vec_arith npi
vec_arith.npi <- function(op, x, y, ...) {
  UseMethod("vec_arith.npi", y)
}

#' @export
#' @method vec_arith.npi npi
vec_arith.npi.npi <- function(op, x, y, ...) {
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
    cummin = ,
    cummax = ,
    log = ,
    log10 = ,
    vctrs::vec_math_base(.fn, .x, ...)
  )
}

#' @importFrom stats median
#' @export
#' @method median npi
median.npi <- function(x, na.rm = FALSE, ...) {
  stats::median(vctrs::vec_data(x), na.rm = na.rm, ...)
}

#' @importFrom stats quantile
#' @export
#' @method quantile npi
quantile.npi <- function(x, ...) {
  stats::quantile(vctrs::vec_data(x), ...)
}

#' @export
#' @method summary npi
summary.npi <- function(object, ...) {
  summary(vctrs::vec_data(object), ...)
}
