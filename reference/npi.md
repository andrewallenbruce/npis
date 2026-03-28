# `npi` vector

This creates an integer vector of valid NPIs.

## Usage

``` r
npi(x = integer())

new_npi(x = integer())

is_npi(x)
```

## Arguments

- x:

  - For `npi()`: An integer vector.

  - For `is_npi()`: An object to test.

## Value

An S3 vector of class `npi`

## Examples

``` r
new_npi()
#> <npi[0]>
npi()
#> <npi[0]>
is_npi(npi())
#> [1] TRUE

x <- npi(generate(10))
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
```
