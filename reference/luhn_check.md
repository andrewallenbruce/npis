# Luhn Check

Luhn Check

## Usage

``` r
luhn_check(x)

check_digit(x, call = rlang::current_env())
```

## Arguments

- x:

  an integer vector

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
x <- generate(valid = TRUE)
check_digit(x)
#>  [1] 0 2 6 8 1 7 3 3 2 6
luhn_check(x)
#>  [1] 1750393690 1407888092 1720259476 1679516728 1093861601 1699755967
#>  [7] 1063461523 1306395173 1275518532 1730499336
```
