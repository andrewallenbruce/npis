# brio::write_lines(x$npi, fs::path_abs("data-raw/npis.txt"))

ex <- brio::read_lines(fs::path_abs("data-raw/npis.txt")) |>
  as.integer()

pin_update(
  ex,
  "examples",
  "Valid NPIs",
  "26,915 Valid NPIs"
)
