library(collapse)
library(cheapr)
library(npis)
library(ggplot2)

# Lower Bound = 1000000004
# Upper Bound = 1999999992
# Possible NPIs: 999,999,988

LOWER = 1000000000L
UPPER = 2000000000L
GROUP = cheapr::seq_(
  from = LOWER,
  to = UPPER,
  by = LOWER %/% 1000L
)
diff(GROUP)
# x <- npi(seq.int(GROUP[10], GROUP[13]), na.rm = TRUE)
brio::write_lines(
  as.character(
    npi(
      seq.int(
        GROUP[31],
        GROUP[34]
      ),
      na.rm = TRUE
    )
  ),
  fs::path(
    here::here(),
    "valid_npi",
    ext = "txt"
  )
)

seg <- cheapr::seq_(1e9L, 1e9L * 2L, by = 1e5L)
segs <- cheapr::sequence_(1e5L, seg[1:5], as_list = TRUE)
x <- which_valid(.subset2(segs, 1L))

open_rdzs <- function(files) {
  x <- glue::glue("data-raw/files/valid_{old}")
  x <- fs::path_wd(x, ext = "rdz")
  x <- purrr::map(x, rdz::read_rdz, .progress = TRUE)
  purrr::list_c(x)
}

six = open_rdz(6)
spec = nanoarrow::nanoarrow_extension_spec("arrow.npi", "arrow_npi_spec")
arrow_str <- nanoarrow::as_nanoarrow_array(
  six,
  schema = nanoarrow::na_vctrs(new_npi())
)
nanoarrow::infer_nanoarrow_ptype_extension(
  nanoarrow::nanoarrow_extension_spec("arrow.npi", "arrow_npi_spec"),
  x = arrow_str
)
file <- fs::path_abs(glue::glue("data-raw/files/valid.arrow"))
nanoarrow::write_nanoarrow(vctrs::vec_data(six), file)

# Points where the check digit == 4
x <- tibble::tibble(
  chk = last_digit(x),
  four = cumsum(chk == 4L)
)

vctrs::vec_unrep(x$four)$times |> cheapr::table_()

x2 <- vctrs::vec_unrep(x$four) |>
  tibble::tibble() |>
  dplyr::mutate(group = cumsum(times == 19L))

vctrs::vec_unrep(x2$group) |>
  tibble::tibble()

# This takes the whole non-zero integer at the end
x <- tibble::tibble(
  x = as.integer(substr(as.character(x), 2L, 10L)),
)

x$d <- c(NA_integer_, diff(x$x))

unique(x$d)

x |> print(n = 100)

ggplot(x[1:1000, ], aes(x, d)) +
  geom_point(
    shape = 21,
    # size = 2.5,
    # stroke = 0.15,
    colour = "red",
    na.rm = TRUE
  ) +
  ggplot2::theme_minimal()

vctrs::vec_count(x$chk)$key

x |> print(n = 50)

fours = vctrs::vec_split(x$chk, x$four)$val
cheapr::lengths_(fours) |> boxplot(horizontal = TRUE)

chk <- which_valid(x, check = TRUE)
four <- cheapr::which_val(chk, 4L)

ex <- cheapr::new_df(x = seq(chk), y = cheapr::factor_(chk))
ex |> ggauto::ggauto(x, y)

diff.default(four) |> cheapr::as_factor() |> plot()


vctrs::vec_split(chk, vctrs::vec_rep_each(four, 10000L / 1000L))
length(four)
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
