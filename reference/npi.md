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
x <- generate(10, 0.2)
x
#>  [1] 1141270894 1937499387 1453066273 1030620980 1731918606 1493897644
#>  [7] 1805243995         NA         NA  163622827
is_npi(x)
#> [1] FALSE

x <- npi(x)
x
#> <npi[10]>
#>  [1] 1141270894 1937499387 1453066273 1030620980 1731918606 1493897644
#>  [7] 1805243995 <NA>       <NA>       163622827 
is_npi(x)
#> [1] TRUE

data.frame(x)
#>             x
#> 1  1141270894
#> 2  1937499387
#> 3  1453066273
#> 4  1030620980
#> 5  1731918606
#> 6  1493897644
#> 7  1805243995
#> 8        <NA>
#> 9        <NA>
#> 10  163622827

tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1141270894
#>  2 1937499387
#>  3 1453066273
#>  4 1030620980
#>  5 1731918606
#>  6 1493897644
#>  7 1805243995
#>  8         NA
#>  9         NA
#> 10  163622827

as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#> <npi[4]>
#> [1] 1234567891 1234567891 1234567891 <NA>      
```
