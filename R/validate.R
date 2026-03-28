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
  seq_len(ceiling(log10(x)))
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

#' @noRd
check_ten_digits <- function(x) {
  if (all_not_ten_digits(x)) {
    cli::cli_abort("All input to {.arg x} must have 10 digits")
  }
}

#' @noRd
check_luhn <- function(x) {
  gtn <- function(x) cheapr::which_(x > 9L)

  index <- c(TRUE, FALSE)

  chk <- tenth(x)

  x <- cheapr::cheapr_rev(
    as.integer(
      unlist_(
        strsplit(
          as.character(
            one_nine(x)
          ),
          ""
        )
      )
    )
  )

  x[index] <- x[index] * 2L

  x[gtn(x)] <- x[gtn(x)] - 9L

  # x

  x <- z <- collapse::fsum(x, g = cheapr::rep_each_(seq_along(chk), 9)) + 24

  x <- ceiling(x / 10L) * 10L - z

  x == chk
}
