library(quickr)

x <- generate()
x <- unlist_(
  strsplit(
    as.character(x %/% 10L),
    split = "",
    fixed = TRUE
  )
) |>
  as.double()
# x <- explode(x %/% 10L)

calculate_check_digit <- function(x) {
  declare(type(x = double(x)))
  x <- matrix(x, nrow = 9, ncol = length(x) / 9)
  i <- c(1, 3, 5, 7, 9)
  x[i, ] <- x[i, ] * 2
  x[i, ] <- ifelse(x[i, ] > 9, x[i, ] - 9, x[i, ])
  x <- apply(x, 2, sum)
  # x <- colSums(x)
  x <- x + 24
  x <- ceiling(x / 10) * 10 - x
  x
}

calculate_check_digit(x)

quick_check_digit <- quickr::quick(calculate_check_digit)
