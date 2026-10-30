x <- glue::glue("valid_npi_text_files/valid_npi_{1:10}.txt") |>
  purrr::map(\(x) {
    archive::archive_read(
      archive = fs::path_wd("data-raw", "valid_npi_text_files", ext = "tar.xz"),
      file = x,
      format = "tar",
      filter = "xz"
    ) |>
      readLines()
  }) |>
  purrr::list_c()

library(collapse)
library(cheapr)

LOWER = 1000000000L
UPPER = 2000000000L
GROUP = cheapr::seq_(
  from = LOWER,
  to = UPPER,
  by = LOWER %/% 1000L
)
GROUP[31:length(GROUP)] |> length() # 971 left

file <- fs::path_wd("data-raw", "files", "valid", ext = "rdz")
options(rdz.compress = 9, rdz.threads = 4)
rdz::write_rdz(v, file)
v <- rdz::read_rdz(file)
rdz::rdz_info(file)
rdz::rdz_schema(file)

write_npi_parquet <- function(i) {
  seq.int(GROUP[i], GROUP[i + 3L]) |>
    npi(na.rm = TRUE) |>
    vctrs::vec_data() |>
    tibble::as_tibble() |>
    rlang::set_names("npi") |>
    nanoparquet::write_parquet(file3)
}

append_npi_parquet <- function(i) {
  seq.int(GROUP[i], GROUP[i + 3L]) |>
    npi(na.rm = TRUE) |>
    vctrs::vec_data() |>
    tibble::as_tibble() |>
    rlang::set_names("npi") |>
    nanoparquet::append_parquet(file3)
}

index_LEFT <- c(cheapr::seq_(34, 971, 3), 971L)
purrr::walk(index_LEFT[51:53], append_npi_parquet, .progress = TRUE)
