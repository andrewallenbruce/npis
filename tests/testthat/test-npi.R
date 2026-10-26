test_that("Both constructors with no arguments return 0-length vectors", {
  expect_all_equal(length(c(new_npi(), npi())), 0L)
})

test_that("Both constructors return `npi` class", {
  expect_s3_class(npi(1234567893L), c("npi", "vctrs_vctr"), exact = TRUE)
  expect_s3_class(new_npi(1234567893L), c("npi", "vctrs_vctr"), exact = TRUE)
  expect_true(is_npi(npi(1234567893)))
})

test_that("Method symmetry for vec_c() is achieved", {
  x = npi(1234567893)
  y = 1234567893L
  expect_equal(vctrs::vec_c(x, y), vctrs::vec_c(y, x))
})

# https://vctrs.r-lib.org/articles/s3-vector.html#implementing-a-vctrs-s3-class-in-a-package

# Missing Values
# vctrs::vec_c(1234567981L, npi(NA))
# vctrs::vec_c(1234567981L, npi(1L))
# vctrs::vec_c(npi(NA), 1234567981L)
# vctrs::vec_c(npi(1L), 1234567981L)
#
# vctrs::vec_c(npi(1234567983), NA)
# vctrs::vec_c(npi(1234567981), npi(1L))
# vctrs::vec_c(npi(NA), npi(1234567981))
# vctrs::vec_c(npi(1L), npi(1234567981))
