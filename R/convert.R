#' Cast to other types
#'
#' @param x a scalar or vector to convert to the npi class
#' @param ... passed on to `npi()`
#' @returns An S3 vector of class `npi`
#' @examples
#' as_npi(
#'   c(
#'     1053404947,
#'     1000000004L,
#'     1000000004.00,
#'     "1000000004L",
#'     "1000000004"
#'   ),
#'   sort = TRUE,
#'   na.rm = TRUE
#' )
#' @export
as_npi <- function(x, ...) {
  UseMethod("as_npi")
}

#' @export
#' @rdname as_npi
as_npi.default <- function(x, ...) {
  cli::cli_abort("No method found for class {.cls {class(x)}}")
}

#' @export
#' @rdname as_npi
as_npi.npi <- function(x, ...) x

#' @export
#' @rdname as_npi
as_npi.integer <- function(x, ...) {
  npi(x, ...)
}

#' @export
#' @rdname as_npi
as_npi.double <- function(x, ...) {
  x <- as.integer(x)
  npi(x, ...)
}

#' @export
#' @rdname as_npi
as_npi.character <- function(x, ...) {
  if (any_(has_letter(x))) {
    vctrs::vec_slice(x, has_letter(x)) <- NA_character_
  }
  x <- as.integer(x)
  npi(x, ...)
}
