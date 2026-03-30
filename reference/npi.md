# Construct an `npi` object

- `new_npi()` is a low-level constructor that takes a vector.

- `npi()` constructs an npi object from a vector.

- `as_npi()` and `is_npi()` forward to
  [`vctrs::vec_cast()`](https://vctrs.r-lib.org/reference/vec_cast.html)
  and [`inherits()`](https://rdrr.io/r/base/class.html), respectively.

## Usage

``` r
npi(x = integer())

new_npi(x = integer())

validate_npi(x)

is_npi(x)

as_npi(x, ...)

# Default S3 method
as_npi(x, ...)

# S3 method for class 'character'
as_npi(x, ...)

# S3 method for class 'double'
as_npi(x, ...)
```

## Arguments

- x:

  a vector

- ...:

  Passed on to methods.

## Value

An S3 vector of class `<npi>`

## Examples

``` r
# x <- generate(10, 0.2)
x <- examples()[1:10]
x
#>  [1] 1285698357 1083602320 1023129947 1821010307 1770531733 1962441766
#>  [7] 1699718056 1659338564 1831170372 1962465971
is_npi(x)
#> [1] FALSE

x <- npi(x)
x
#> <npi[10]>
#>  [1] 1285698357 1083602320 1023129947 1821010307 1770531733 1962441766
#>  [7] 1699718056 1659338564 1831170372 1962465971
is_npi(x)
#> [1] TRUE

data.frame(x)
#>             x
#> 1  1285698357
#> 2  1083602320
#> 3  1023129947
#> 4  1821010307
#> 5  1770531733
#> 6  1962441766
#> 7  1699718056
#> 8  1659338564
#> 9  1831170372
#> 10 1962465971

tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1285698357
#>  2 1083602320
#>  3 1023129947
#>  4 1821010307
#>  5 1770531733
#>  6 1962441766
#>  7 1699718056
#>  8 1659338564
#>  9 1831170372
#> 10 1962465971

as_npi(c("1234567893", 1234567893, 1234567893L, NA_character_))
#> <npi[4]>
#> [1] 1234567893 1234567893 1234567893 <NA>      
```
