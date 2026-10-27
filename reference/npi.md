# `npi` vector

Creates an integer vector that represents National Provider Identifiers

## Usage

``` r
npi(x = integer())

is_npi(x)

n_invalid(x)
```

## Arguments

- x:

  - For `npi()`: A numeric vector

  - For `is_npi()`: An object to test.

## Value

An S3 vector of class `npi`

## Examples

``` r
x <- npi(c(123456789, npis::examples, generate(1000L)))
head(sort.int(x), 30L)
#> <npi[30]>
#>  [1] 1001750607 1003014911 1003016304 1003017690 1003019563 1003019563
#>  [7] 1003021783 1003021783 1003021783 1003028036 1003029398 1003036765
#> [13] 1003039157 1003044157 1003052002 1003063397 1003065202 1003066143
#> [19] 1003066143 1003066143 1003066143 1003066143 1003075623 1003077082
#> [25] 1003077140 1003077140 1003077140 1003077140 1003079625 1003079625
is_npi(x)
#> [1] TRUE
n_invalid(x)
#> [1] 896
tibble::tibble(x = sort.int(x))
#> # A tibble: 27,020 × 1
#>             x
#>         <npi>
#>  1 1001750607
#>  2 1003014911
#>  3 1003016304
#>  4 1003017690
#>  5 1003019563
#>  6 1003019563
#>  7 1003021783
#>  8 1003021783
#>  9 1003021783
#> 10 1003028036
#> # ℹ 27,010 more rows
```
