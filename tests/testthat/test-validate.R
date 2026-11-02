test_that("Luhn Check is correct", {
  x <- generate(1000, valid = TRUE)
  expect_equal(last_digit(x), check_digit(x))
})
