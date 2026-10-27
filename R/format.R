#' @export
vec_ptype_abbr.npi <- function(x, ...) "npi"

#' @export
vec_ptype_full.npi <- function(x, ...) "npi"

#' @export
format.npi <- function(x, ...) {
  if (length(x) == 0) {
    return(integer())
  }
  out <- formatC(vctrs::vec_data(x), format = "d")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
obj_print_data.npi <- function(x, max = 54L, width = 70L, ...) {
  if (length(x) == 0) {
    return()
  }
  print(format(x), quote = FALSE, max = max, width = width, ...)
  invisible(x)
}
