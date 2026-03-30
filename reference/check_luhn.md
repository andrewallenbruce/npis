# Luhn Check

Helpers to construct the Luhn algorithm check

## Usage

``` r
check_luhn(x, arg = rlang::caller_arg(x), call = rlang::caller_env())

check_digit(x)

first_digit(x)

last_digit(x)

examples()
```

## Arguments

- x:

  a vector

- arg:

  An argument name as a string. This argument will be mentioned in error
  messages as the input that is at the origin of a problem.

- call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.

## Value

An integer vector

## Examples

``` r
x <- examples()
check_luhn(x)
head(x, 20)
#>  [1] 1285698357 1083602320 1023129947 1821010307 1770531733 1962441766
#>  [7] 1699718056 1659338564 1831170372 1962465971 1386616498 1831193515
#> [13] 1790742849 1801877675 1396831053 1255333480 1255449393 1215959697
#> [19] 1124138805 1396743886

id <- last_digit(x)
head(id, 20)
#>  [1] 7 0 7 7 3 6 6 4 2 1 8 5 9 5 3 0 3 7 5 6

x <- check_digit(x)
head(x, 20)
#>  [1] 7 0 7 7 3 6 6 4 2 1 8 5 9 5 3 0 3 7 5 6

all(head(id, 20) == head(x, 20))
#> [1] TRUE
```
