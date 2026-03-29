#' @noRd
n_digits <- function(x) {
  ceiling(log10(x))
}

#' @noRd
is_ten_digits <- function(x) {
  n_digits(x) == 10L
}

#' @noRd
all_ten_digits <- function(x) {
  collapse::allv(is_ten_digits(x), TRUE)
}

#' @noRd
all_not_ten_digits <- function(x) {
  collapse::allv(is_ten_digits(x), FALSE)
}

#' @noRd
tenth <- function(x) {
  x %% 10L
}

#' @noRd
one_nine <- function(x) {
  x %/% 10L
}

#' @noRd
seq_n_digits <- function(x) {
  seq_len(n_digits(x))
}

#' @noRd
sum_digits <- function(x) {
  sum(floor(x / 10L^(seq_n_digits(x) - 1L)) %% 10L)
}

#' @noRd
explode_number <- function(x) {
  as.integer(x) |>
    as.character() |>
    strsplit("") |>
    _[[1]] |>
    as.numeric()
}
