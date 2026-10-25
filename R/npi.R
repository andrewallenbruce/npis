methods::setOldClass(c("npi", "vctrs_vctr"))

#' `npi` vector
#'
#' Creates an integer vector that represents National Provider Identifiers
#'
#' @param x
#'  * For `npi()`: A numeric vector
#'  * For `is_npi()`: An object to test.
#' @returns An S3 vector of class `npi`
#' @examples
#' x <- example_()
#' length(x)
#' is_npi(x)
#'
#' x <- npi(x)
#' head(x)
#' is_npi(x)
#'
#' data.frame(x) |> head()
#'
#' tibble::tibble(x)
#' @export
npi <- function(x = integer()) {
  x <- vctrs::vec_cast(x, integer())

  if (!all_10_digits(x)) {
    x[which_not_10(x)] <- NA_integer_
  }

  new_npi(x)
}

#' @export
#' @rdname npi
is_npi <- function(x) {
  inherits(x, "npi")
}

#' Low-level Constructor
#' @param x An integer vector
#' @inheritParams rlang::args_error_context
#' @export
#' @keywords internal
new_npi <- function(x = integer(), call = rlang::current_env()) {
  if (!is.integer(x)) {
    cli::cli_abort(
      "{.arg x} must be a list, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
  vctrs::new_vctr(x, class = "npi")
}

#' @export
vec_ptype_abbr.npi <- function(x, ...) "npi"

#' @export
vec_ptype_full.npi <- function(x, ...) "npi"

#' @export
format.npi <- function(x, ...) {
  out <- formatC(vctrs::vec_data(x), format = "d")
  out[collapse::whichNA(x)] <- NA
  out
}

#' @export
vec_ptype2.npi.npi <- function(x, y, ...) {
  new_npi()
}

#' @export
vec_ptype2.integer.npi <- function(x, y, ...) {
  integer()
}

#' @export
vec_cast.npi.npi <- function(x, to, ...) {
  x
}

#' @export
vec_cast.npi.integer <- function(x, to, ...) {
  npi(x)
}

#' @export
vec_cast.integer.npi <- function(x, to, ...) {
  vctrs::vec_data(x)
}
