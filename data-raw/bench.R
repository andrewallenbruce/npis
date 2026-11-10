library(npis)
library(bench)
library(ggplot2)

x1 <- generate(1000L)
x2 <- generate(10000L)
x3 <- generate(100000L)
x <- mark(
  x1000 = check_digit(x1),
  x10000 = check_digit(x2),
  x100000 = check_digit(x3),
  check = FALSE
)
x[, 1:9]
autoplot(x)


explode(x1[1] %/% 10L)

x = x1[1] %/% 10L
x = unlist_(
  strsplit(
    as.character(x),
    split = "",
    fixed = TRUE
  )
)
as.integer(x)
Rfast::as_integer(x, result.sort = FALSE, init = 1, parallel = TRUE)
