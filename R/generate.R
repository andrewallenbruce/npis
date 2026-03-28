#' @rdname npi
#' @export
generate_npi <- function(x) {
  as.integer(replicate(
    n = x,
    expr = paste0(c(1, sample(0:9, 9, replace = TRUE)), collapse = "")
  ))
}


# paste0(c(1, replicate(
#   n = 10,
#   expr = sample(0:9, 9, replace = TRUE)
# )), collapse = "")




