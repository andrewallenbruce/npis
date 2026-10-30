VALID_NPI_RANGE <- ivs::iv(1000000004L, 1999999993L)

#' @noRd
in_range <- function(x) {
  ivs::iv_between(x, VALID_NPI_RANGE)
}

#' @noRd
all_in_range <- function(x) {
  collapse::allv(in_range(x), TRUE)
}

#' Luhn Check
#' @param x an integer vector
#' @returns An integer vector
#' @examples
#' x <- generate(valid = TRUE)
#' x %% 10L
#' check_digit(x)
#' luhn_check(x)
#' @export
luhn_check <- function(x) {
  compared <- vctrs::vec_compare(
    last_digit(x),
    check_digit(x),
    na_equal = TRUE
  )

  if (!collapse::allv(compared, 0L)) {
    x <- cheapr::replace_(
      x,
      compared %!=% 0L,
      NA_integer_
    )
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

#' @noRd
minus_nine <- function(x) {
  cheapr::if_else_(x > 9L, x - 9L, x)
}

mINDEX <- c(1L, 3L, 5L, 7L, 9L)

#' @inheritParams rlang::args_error_context
#' @export
#' @rdname luhn_check
check_digit <- function(x, call = rlang::current_env()) {
  if (!all_in_range(x)) {
    cli::cli_abort(
      "All input must be 10 digits",
      call = call
    )
  }

  x <- matrix(
    explode(x %/% 10L),
    nrow = vctrs::vec_size(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, mINDEX] <- minus_nine(x[, mINDEX] * 2L)
  x <- matrixStats::rowSums2(x) + 24L
  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)
}
