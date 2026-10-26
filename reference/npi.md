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
 x <- npi(c(123456789, example_(), generate(1000L)))
 head(sort.int(x), 30L)
#> <npi[30]>
#>  [1] 1003014911 1003016304 1003017690 1003019563 1003019563 1003021783
#>  [7] 1003021783 1003021783 1003028036 1003029398 1003036765 1003039157
#> [13] 1003044157 1003052002 1003063397 1003065202 1003066143 1003066143
#> [19] 1003066143 1003066143 1003066143 1003075623 1003077082 1003077140
#> [25] 1003077140 1003077140 1003077140 1003079625 1003079625 1003082017
 is_npi(x)
#> [1] TRUE
 n_invalid(x)
#> [1] 919
 x <- tibble::tibble(x = sort.int(x))
 x
#> # A tibble: 26,997 × 1
#>             x
#>         <npi>
#>  1 1003014911
#>  2 1003016304
#>  3 1003017690
#>  4 1003019563
#>  5 1003019563
#>  6 1003021783
#>  7 1003021783
#>  8 1003021783
#>  9 1003028036
#> 10 1003029398
#> # ℹ 26,987 more rows
 cheapr::counts(x$x, TRUE) |>
   collapse::roworderv("count", decreasing = TRUE) |>
   collapse::qTBL() |>
   # collapse::sbt(count > 4L) |>
   _$count |>
   stem(scale = 0.7, width = 40)
#> 
#>   The decimal point is 1 digit(s) to the right of the |
#> 
#>   0 | 1111111111111111111111111111+23093
#>   0 | 5555555555555555555555555555+52
#>   1 | 00122244
#>   1 | 556
#>   2 | 
#>   2 | 
#>   3 | 
#>   3 | 
#>   4 | 1
#> 
```
