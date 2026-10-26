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
#'  x <- npi(c(123456789, example_(), generate(1000L)))
#'  head(sort.int(x), 30L)
#'  is_npi(x)
#'  n_invalid(x)
#'  x <- tibble::tibble(x = sort.int(x))
#'  x
#'  cheapr::counts(x$x, TRUE) |>
#'    collapse::roworderv("count", decreasing = TRUE) |>
#'    collapse::qTBL() |>
#'    # collapse::sbt(count > 4L) |>
#'    _$count |>
#'    stem(scale = 0.7, width = 40)
#' @export
npi <- function(x = integer()) {
  x <- vctrs::vec_cast(x, integer())

  if (!all_10_digits(x)) {
    x[which_not_10(x)] <- 1000000000L
  }

  x <- luhn_check(x)

  new_npi(x)
}

#' @export
#' @rdname npi
is_npi <- function(x) {
  inherits(x, "npi")
}

#' @export
#' @rdname npi
n_invalid <- function(x) {
  if (inherits(x, "npi") && anyNA(x)) {
    length(collapse::whichNA(x))
  } else {
    0L
  }
}

#' Low-level Constructor
#' @param x An integer vector
#' @inheritParams rlang::args_error_context
#' @export
#' @keywords internal
new_npi <- function(x = integer(), call = rlang::current_env()) {
  if (!is.integer(x)) {
    cli::cli_abort(
      "{.arg x} must be an integer, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
  vctrs::new_vctr(x, class = "npi")
}

# === vec_ptype_abbr
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

# === vec_ptype2
#' @export
vec_ptype2.npi.npi <- function(x, y, ...) new_npi()

#' @export
vec_ptype2.integer.npi <- function(x, y, ...) new_npi()

#' @export
vec_ptype2.npi.integer <- function(x, y, ...) new_npi()

# === vec_cast
#' @export
vec_cast.npi.npi <- function(x, to, ...) x

#' @export
vec_cast.npi.integer <- function(x, to, ...) npi(x)

#' @export
vec_cast.integer.npi <- function(x, to, ...) {
  vctrs::vec_data(x)
}
