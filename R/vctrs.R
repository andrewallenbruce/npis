#' @export
vec_ptype2.npi.npi <- function(x, y, ...) new_npi()

#' @export
vec_ptype2.integer.npi <- function(x, y, ...) new_npi()

#' @export
vec_ptype2.npi.integer <- function(x, y, ...) new_npi()

#' @export
vec_cast.npi.npi <- function(x, to, ...) x

#' @export
vec_cast.npi.integer <- function(x, to, ...) npi(x)

#' @export
vec_cast.integer.npi <- function(x, to, ...) vctrs::vec_data(x)

#' @export
vec_ptype_abbr.npi <- function(x, ...) "npi"

#' @export
vec_ptype_full.npi <- function(x, ...) "npi"

#' @export
format.npi <- function(x, ...) {
  if (length(x) == 0L) {
    return(integer())
  }
  out <- formatC(vctrs::vec_data(x), format = "d")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
obj_print_data.npi <- function(x, max = 54L, width = 70L, ...) {
  if (length(x) == 0L) {
    return()
  }
  print(format(x), quote = FALSE, max = max, width = width, ...)
  invisible(x)
}
