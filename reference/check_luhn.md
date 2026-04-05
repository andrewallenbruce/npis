# Luhn Check

Helpers to construct the Luhn algorithm check

## Usage

``` r
check_luhn(x, arg = rlang::caller_arg(x), call = rlang::caller_env())

check_digit(x)

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
try(check_luhn(generate(100)))
#> Error in eval(expr, envir) : 
#>   An <npi> must pass the Luhn check.
#> ✖ 90 Invalid locations.
#> • 1645358447
#> • 1164415312
#> • 1856458594
#> • 1103750512
#> • 1081470292
#> and more...
```
