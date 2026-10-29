#' Cast to other types
#'
#' @param x a scalar or vector to convert to the npi class
#' @param ... passed on to `npi()`
#' @returns An S3 vector of class `npi`
#' @examples
#' as_npi(
#'   c(
#'     1000000004,
#'     npi(1000000012),
#'     1000025001L,
#'     1000050009.00,
#'     "1000050041L",
#'     "1000050058"
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
  vctrs::vec_cast(x, new_npi())
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
    x <- cheapr::replace_(
      x,
      has_letter(x),
      NA_character_
    )
  }
  x <- as.integer(x)
  npi(x, ...)
}
