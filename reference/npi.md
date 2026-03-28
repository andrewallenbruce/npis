# National Provider Identifier

A National Provider Identifier (NPI) is...

## Usage

``` r
generate_npi(x)

npi(x = integer())

new_npi(x = integer())

is_npi(x)
```

## Arguments

- x:

  integer vector

## Value

An S3 vctr of class `npi`

## Examples

``` r
new_npi()
#> <npi[0]>
npi()
#> <npi[0]>
is_npi(npi())
#> [1] TRUE

x <- generate_npi(10)
npi(x)
#> <npi[10]>
#>  [1] 1645358447 1164415312 1856458594 1103750512 1081470292 1169253906
#>  [7] 1552817006 1589156954 1620405001 1460366717
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
#>         <int>
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
