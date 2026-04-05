library(collapse)
library(cheapr)
library(npis)
library(ggplot2)

which_valid <- function(x, check_digit = FALSE) {
  if (check_digit) {
    collapse::ss(x, last_digit(x) %==% check_digit(x)) %% 1000000000L
  } else {
    collapse::ss(x, last_digit(x) %==% check_digit(x))
  }
}

x <- 1000000000:1000010000
# max(x) - min(x)
# x <- x + 10000L

length(which_valid(x)) / length(x)

df <- fastplyr::new_tbl(
  i = seq_along(x),
  k = which_valid(x, TRUE),
  d = diff(k),
  g = cheapr::rep_len_(1:10, length(x))
  # l = diff(d)
)

ggplot2::ggplot(df) +
  # (df[1:500, ]) +
  # ggplot2::geom_bar(ggplot2::aes(y = d)) +
  ggplot2::geom_point(
    ggplot2::aes(x = i, y = d, fill = g),
    shape = 21,
    size = 2.5,
    stroke = 0.15,
    colour = "white"
  ) +
  # ggplot2::geom_step(ggplot2::aes(l, d), alpha = 0.5) +
  # ggplot2::geom_count(ggplot2::aes(l, d), shape = 21, fill = "orange", alpha = 0.5, colour = "black", stroke = 0.75) +
  hrbrthemes::theme_modern_rc(plot_margin = ggplot2::margin_auto(5, "cm")) +
  ggplot2::facet_wrap(~g, ncol = 1)
