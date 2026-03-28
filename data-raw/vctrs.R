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

x <- npi(generate(3))
x[1:2] <- 2:1
x[[3]] <- 0.5
x

# Correct
c(npi(generate(1)), 1L)
c(npi(generate(1)), factor(1))

# Incorrect
c(factor(1), npi(generate(1)))


x <- generate(10)

n_digits(x)
