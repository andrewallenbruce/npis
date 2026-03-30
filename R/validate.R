#' @noRd
n_digits <- function(x) {
  ceiling(log10(x))
}

#' @noRd
n_digits_ <- function(x) {
  cheapr::set_ceiling(cheapr::set_log(as.double(x), base = 10))
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
