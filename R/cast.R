#' @export
vec_cast.npi.npi <- function(x, to, ...) x

#' @export
vec_cast.npi.integer <- function(x, to, ...) npi(x)

#' @export
vec_cast.npi.double <- function(x, to, ...) npi(trunc(x))

#' @export
vec_cast.npi.character <- function(x, to, ...) {
  if (any_(has_letter(x))) {
    x <- cheapr::replace_(
      x,
      has_letter(x),
      NA_character_
    )
  }
  suppressWarnings(npi(as.integer(x)))
}

#' @export
vec_cast.integer.npi <- function(x, to, ...) vctrs::vec_data(x)

#' @export
vec_cast.double.npi <- function(x, to, ...) vctrs::vec_data(x)

#' @export
vec_cast.character.npi <- function(x, to, ...) vctrs::vec_data(x)
