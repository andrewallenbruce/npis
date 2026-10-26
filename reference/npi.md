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
x <- c(123456789, example_())
length(x)
#> [1] 26916
is_npi(x)
#> [1] FALSE

x <- npi(x)
head(x)
#> <npi[6]>
#> [1] <NA>       1285698357 1083602320 1023129947 1821010307 1770531733
is_npi(x)
#> [1] TRUE
n_invalid(x)
#> [1] 1

data.frame(x) |> head()
#>            x
#> 1       <NA>
#> 2 1285698357
#> 3 1083602320
#> 4 1023129947
#> 5 1821010307
#> 6 1770531733

tibble::tibble(x)
#> # A tibble: 26,916 × 1
#>             x
#>         <npi>
#>  1         NA
#>  2 1285698357
#>  3 1083602320
#>  4 1023129947
#>  5 1821010307
#>  6 1770531733
#>  7 1962441766
#>  8 1699718056
#>  9 1659338564
#> 10 1831170372
#> # ℹ 26,906 more rows
```
