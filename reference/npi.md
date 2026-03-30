# Construct an `npi` object

- `new_npi()` is a low-level constructor that takes a vector.

- `npi()` constructs an npi object from a vector.

- `as_npi()` and `is_npi()` simply forward to
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
x <- generate(10, 0.2)
x
#>  [1] 1515782287 1141270894 1937499387         NA 1030620980 1731918606
#>  [7]         NA 1805243995 1435404121 1946059061
is_npi(x)
#> [1] FALSE

x <- npi(x)
x
#> <npi[10]>
#>  [1] 1515782287 1141270894 1937499387 <NA>       1030620980 1731918606
#>  [7] <NA>       1805243995 1435404121 1946059061
is_npi(x)
#> [1] TRUE

data.frame(x)
#>             x
#> 1  1515782287
#> 2  1141270894
#> 3  1937499387
#> 4        <NA>
#> 5  1030620980
#> 6  1731918606
#> 7        <NA>
#> 8  1805243995
#> 9  1435404121
#> 10 1946059061

tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1515782287
#>  2 1141270894
#>  3 1937499387
#>  4         NA
#>  5 1030620980
#>  6 1731918606
#>  7         NA
#>  8 1805243995
#>  9 1435404121
#> 10 1946059061

as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#> <npi[4]>
#> [1] 1234567891 1234567891 1234567891 <NA>      
```
