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
luhn_check(generate())
#>  [1]         NA         NA         NA         NA         NA         NA
#>  [7] 1909961280         NA         NA 1381074289
```
