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
#>  [1] 1506436951 1578228714 1127089493 1749938745 1306627303 1062098073
#>  [7] 1191860649 1389764480 1524399543 1540412194
is_npi(x)
#> [1] FALSE

x <- npi(x)
x
#> <npi[10]>
#>  [1] 1506436951 1578228714 1127089493 1749938745 1306627303 1062098073
#>  [7] 1191860649 1389764480 1524399543 1540412194
is_npi(x)
#> [1] TRUE

data.frame(x)
#>             x
#> 1  1506436951
#> 2  1578228714
#> 3  1127089493
#> 4  1749938745
#> 5  1306627303
#> 6  1062098073
#> 7  1191860649
#> 8  1389764480
#> 9  1524399543
#> 10 1540412194

tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1506436951
#>  2 1578228714
#>  3 1127089493
#>  4 1749938745
#>  5 1306627303
#>  6 1062098073
#>  7 1191860649
#>  8 1389764480
#>  9 1524399543
#> 10 1540412194

as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#> <npi[4]>
#> [1] 1234567891 1234567891 1234567891 <NA>      
```
