# `npi` vector

Creates an integer vector that represents National Provider Identifiers

## Usage

``` r
npi(x = integer())

is_npi(x)
```

## Arguments

- x:

  - For `npi()`: A numeric vector

  - For `is_npi()`: An object to test.

## Value

An S3 vector of class `npi`

## Examples

``` r
x <- example_()
length(x)
#> [1] 26915
is_npi(x)
#> [1] FALSE

x <- npi(x)
head(x)
#> <npi[6]>
#> [1] 1285698357 1083602320 1023129947 1821010307 1770531733 1962441766
is_npi(x)
#> [1] TRUE

data.frame(x) |> head()
#>            x
#> 1 1285698357
#> 2 1083602320
#> 3 1023129947
#> 4 1821010307
#> 5 1770531733
#> 6 1962441766

tibble::tibble(x)
#> # A tibble: 26,915 × 1
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
#> # ℹ 26,905 more rows
```
