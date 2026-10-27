#' @noRd
n_digits <- function(x) {
  as.integer(cheapr::ceiling_(cheapr::log10_(x)))
}

#' @noRd
first_digit <- function(x) {
  as.integer(x / (cheapr::pow_(10L, cheapr::log10_(x))))
}

#' @noRd
all_10_digits <- function(x) {
  collapse::allv(n_digits(x), 10L)
}

#' @noRd
which_not_10 <- function(x) {
  collapse::whichv(n_digits(x), 10L, invert = TRUE)
}

#' @noRd
ndigits_check <- function(x) {
  if (all_10_digits(x)) x else which_not_10(x)
}

nine_ <- c(1L, 3L, 5L, 7L, 9L)

#' Luhn Check
#' @param x an integer vector
#' @returns An integer vector
#' @examples
#' luhn_check(generate())
#' @export
luhn_check <- function(x) {
  i <- vctrs::vec_compare(last_digit(x), check_digit(x), na_equal = TRUE)
  if (collapse::allv(i, 0L)) {
    return(x)
  } else {
    x[i %!=% 0L] <- NA_integer_
    x
    # collapse::setv(x, collapse::whichv(i, 0L, TRUE), NA_integer_)
  }
}

# all but last digit
#' @noRd
payload <- function(x) {
  x %/% 10L
}

#' @noRd
last_digit <- function(x) {
  x %% 10L
}

#' @noRd
explode <- function(x) {
  as.integer(
    unlist_(
      strsplit(
        as.character(x),
        split = "",
        fixed = TRUE
      )
    )
  )
}

# all input should be 10 digits
#' @export
#' @rdname luhn_check
check_digit <- function(x) {
  # x <- example_()[1:5]
  # x <- collapse::na_rm(x)

  x <- matrix(
    explode(payload(x)),
    nrow = vctrs::vec_size(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, nine_] <- x[, nine_] * 2L

  x[, nine_] <- cheapr::if_else_(
    x[, nine_] > 9L,
    x[, nine_] - 9L,
    x[, nine_]
  )

  x <- matrixStats::rowSums2(x) + 24L
  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)

  # cheapr::subtract_(
  # cheapr::multiply_(
  # cheapr::ceiling_(
  # cheapr::divide_(x, 10L)
  # ), 10L), x)
  #
  # as.integer(
  # cheapr::ceiling_(x %/=% 10L) %*=% 10L %-=% x)
}
