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
  original <- last_digit(x)
  expected <- check_digit(x)

  i <- vctrs::vec_compare(original, expected, na_equal = TRUE)
  if (!collapse::allv(i, 0L)) {
    x[i %!=% 0L] <- NA_integer_
  }
  return(x)
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
}

#' @noRd
which_valid_npi <- function(x) {
  x <- collapse::ss(x, last_digit(x) %==% check_digit(x), check = FALSE)
  collapse::funique(sort.int(x))
}

#' @noRd
which_valid <- function(x, check = FALSE) {
  x <- collapse::funique(sort.int(x))
  x <- which_valid_npi(x)
  if (!check) {
    return(x)
  }
  last_digit(x)
}
