#' @export
vec_cast.npi.npi <- function(x, to, ...) x

#' @export
vec_cast.npi.integer <- function(x, to, ...) npi(x)

#' @export
vec_cast.integer.npi <- function(x, to, ...) {
  vctrs::vec_data(x)
}
