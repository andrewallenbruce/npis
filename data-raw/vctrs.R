library(vctrs)
library(npis)

new_npi()
npi()
is_npi(new_npi())
is_npi(npi())
is_npi(integer())


x <- generate(10)
x <- npi(x)

data.frame(x)
tibble::tibble(x)
data.table::data.table(x)

vec_chop(x)

vec_cast(1000000050L, npi())
vec_cast(npi(1000000050L), integer())

vec_c(npi(1000000050L), 1000000051L)
vec_c(npi(1000000050L), npi(1000000051L))
vec_c(NA, npi(1000000050L), npi(1000000051L))
# but
vec_c(TRUE, npi(1000000050L))
vec_c(npi(1000000051L), TRUE)

x <- npi(generate(3))
x[1:2] <- generate(2)
x[[3]] <- 1060001869L
x

# Correct
c(npi(generate(1)), generate(1))
c(npi(generate(1)), factor(generate(1)))

# Incorrect
c(factor(generate(1)), npi(generate(1)))


n_digits(generate(100))


x <- as_npi(npis:::examples())
x

as_npi(generate(100, syntactic = FALSE))
