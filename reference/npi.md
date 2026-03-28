# `npi` vector

This creates an integer vector of valid NPIs.

## Usage

``` r
generate_npi(x)

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

x <- npi(generate_npi(10))
data.frame(x)
#>             x
#> 1  1645358447
#> 2  1164415312
#> 3  1856458594
#> 4  1103750512
#> 5  1081470292
#> 6  1169253906
#> 7  1552817006
#> 8  1589156954
#> 9  1620405001
#> 10 1460366717
tibble::tibble(x)
#> # A tibble: 10 × 1
#>             x
#>         <npi>
#>  1 1645358447
#>  2 1164415312
#>  3 1856458594
#>  4 1103750512
#>  5 1081470292
#>  6 1169253906
#>  7 1552817006
#>  8 1589156954
#>  9 1620405001
#> 10 1460366717
```
