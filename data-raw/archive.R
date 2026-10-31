LOWER = 1000000000L
UPPER = 2000000000L
GROUP = cheapr::seq_(LOWER, UPPER, LOWER %/% 1000L)
INDEX = c(cheapr::seq_(34L, 971, 3L), 971L)
options(rdz.compress = 9L, rdz.threads = 4L)

create_npi_seq <- function(i) {
  seq.int(GROUP[i], GROUP[i + 3L]) |>
    npi(na.rm = TRUE) |>
    vctrs::vec_data()
}

file <- fs::path_wd(
  "data-raw",
  "files",
  "valid_03",
  ext = "rdz"
)

new <- purrr::map(
  INDEX[121:130],
  create_npi_seq,
  .progress = TRUE
) |>
  purrr::list_c() |>
  collapse::funique()

new <- vctrs::vec_unique(vctrs::vec_c(v, new))

rdz::write_rdz(new, file)
v <- rdz::read_rdz(file)

rdz::rdz_info(file)
rdz::rdz_schema(file)
