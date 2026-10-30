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
    "*" = ,
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
    "*" = ,
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
  x <- unclass(
    cheapr::overview(
      vctrs::vec_data(object)
    )
  )

  i <- x$numeric

  out <- list(
    base = i$class,
    length = x$obs,
    unique = i$n_unique,
    missing = i$n_missing,
    complete = i$p_complete,
    mean = trunc(i$mean),
    min = i$p0,
    p25 = i$p25,
    median = i$p50,
    p75 = i$p75,
    max = i$p100,
    range = i$p100 - i$p0,
    iqr = i$iqr,
    sd = trunc(i$sd),
    hist = i$hist
  )

  cli::boxx(
    label = cli::ansi_columns(
      c(
        paste("Valid  ", out$length),
        paste("Unique ", out$unique),
        paste("Missing ", out$missing),
        paste("       "),
        paste("Min ", out$min),
        paste("Med ", out$median),
        paste("Avg ", out$mean),
        paste("Max ", out$max),
        paste("       "),
        paste("RNG  ", out$range),
        paste("IQR  ", out$iqr),
        paste("SD   ", out$sd)
      ),
      width = 20,
      fill = "rows",
      max_cols = 2,
      align = "left",
      sep = "  "
    ),
    align = c("left"),
    header = "Summary",
    border_style = "round",
    padding = 1,
    width = cli::console_width() - 20
  )
}
