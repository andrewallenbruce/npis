GROUP = cheapr::seq_(1000000000L, 2000000000L, 1000000000L %/% 1000L)
INDEX = c(cheapr::seq_(34L, 971, 3L), 971L)
options(rdz.compress = 9L, rdz.threads = 4L)

npi_seq <- function(i, g) {
  x <- cheapr::seq_(g[i], g[i + 3L])
  vctrs::vec_data(npi(x, na.rm = TRUE))
}

map_seq <- function(idx, index, grp, old) {
  new <- purrr::map(index[idx], \(x) npi_seq(i = x, g = grp), .progress = TRUE)
  new <- purrr::list_c(new)
  old <- glue::glue("data-raw/files/valid_{old}")
  old <- fs::path_wd(old, ext = "rdz")

  if (!fs::file_exists(old)) {
    fs::file_create(old)
  } else {
    new <- list(rdz::read_rdz(old), new)
    new <- cheapr::unique_(cheapr::c_(.args = new))
  }

  rdz::write_rdz(new, old)
}

new <- map_seq(201:210, INDEX, GROUP, "05")
rdz::read_rdz(new)
rdz::rdz_info(new)
rdz::rdz_schema(new)
