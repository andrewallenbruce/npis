test_that("Luhn Check is correct", {
  x <- generate(100, valid = TRUE)
  last <- last_digit(x)
  check <- check_digit(x)
  expect_equal(last, check)
})
