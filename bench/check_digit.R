library(npis)
library(bench)
library(ggplot2)

x1 <- npis::generate(1000L)
x2 <- npis::generate(10000L)
x3 <- npis::generate(100000L)
x4 <- npis::generate(1000000L)

x <- bench::mark(
  `1K` = check_digit(x1),
  `10K` = check_digit(x2),
  `100K` = check_digit(x3),
  `1M` = check_digit(x4),
  check = FALSE
)

x[, 1:9]

ggplot2::autoplot(x, type = "jitter") +
  ggthemes::theme_wsj()
