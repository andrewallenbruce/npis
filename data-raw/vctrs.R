library(vctrs)
library(npis)

new_npi()
npi()
is_npi(npi())

x <- npi(generate(10))
data.frame(x)
tibble::tibble(x)

vec_ptype_show(npi(), integer(), npi())

vec_cast(50L, npi())
vec_cast(npi(50L), integer())

vec_c(npi(50L), 1L)
vec_c(NA, npi(50L))
# but
vec_c(TRUE, npi(50L))
vec_c(npi(50L), TRUE)

x <- npi(generate(3))
x[1:2] <- generate(2)
x[[3]] <- 1060001869L
x

# Correct
c(npi(generate(1)), 1L)
c(npi(generate(1)), factor(1))

# Incorrect
c(factor(1), npi(generate(1)))


npis:::n_digits(generate(100))


x <- as_npi(npis:::npi_examples())
x
