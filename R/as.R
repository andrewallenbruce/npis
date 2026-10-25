#' Cast to other types
#'
#' @param x description
#' @param ... description
#' @returns description
#' @examples
#' npi(1234567893 + 1L)
#' as_npi(c("1234567893", 1234567893.00, 1234567893, 1234567893L, NA))
#' @export
as_npi <- function(x, ...) {
  UseMethod("as_npi")
}

#' @export
#' @rdname as_npi
as_npi.character <- function(x, ...) {
  x <- as.integer(x)
  npi(x)
}

#' @export
#' @rdname as_npi
as_npi.double <- function(x, ...) {
  x <- as.integer(x)
  npi(x)
}
