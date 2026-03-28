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
#> 1  1164415312
#> 2  1164415312
#> 3  1164415312
#> 4  1164415312
#> 5  1164415312
#> 6  1164415312
#> 7  1164415312
#> 8  1164415312
#> 9  1164415312
#> 10 1164415312
tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1164415312
#>  2 1164415312
#>  3 1164415312
#>  4 1164415312
#>  5 1164415312
#>  6 1164415312
#>  7 1164415312
#>  8 1164415312
#>  9 1164415312
#> 10 1164415312
```
