#' Cast to other types
#'
#' @param x a scalar or vector to convert to the npi class
#' @param ... passed to methods
#' @inheritParams npi
#' @returns An S3 vector of class `npi`
#' @examples
#' as_npi(
#'   c("1234567893L", 1234567893.00, 1234567893L, "1234567893", NA),
#'   sort = TRUE,
#'   na.rm = TRUE
#' )
#' @export
as_npi <- function(x, sort = FALSE, na.rm = FALSE, ...) {
  UseMethod("as_npi")
}

#' @export
#' @rdname as_npi
as_npi.integer <- function(x, sort = FALSE, na.rm = FALSE, ...) {
  npi(x, sort = sort, na.rm = na.rm)
}

#' @export
#' @rdname as_npi
as_npi.double <- function(x, sort = FALSE, na.rm = FALSE, ...) {
  x <- as.integer(x)
  npi(x, sort = sort, na.rm = na.rm)
}

#' @export
#' @rdname as_npi
as_npi.character <- function(x, sort = FALSE, na.rm = FALSE, ...) {
  if (collapse::anyv(has_letter(x), TRUE)) {
    x[has_letter(x)] <- NA_character_
  }
  x <- as.integer(x)
  npi(x, sort = sort, na.rm = na.rm)
}
