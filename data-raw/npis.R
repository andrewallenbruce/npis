## code to prepare `npis` dataset goes here
# brio::write_lines(x$npi, fs::path_abs("data-raw/npis.txt"))
brio::read_lines(fs::path_abs("data-raw/npis.txt"))
usethis::use_data(npis, overwrite = TRUE)
