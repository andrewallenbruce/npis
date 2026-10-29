# `npi` vector

Creates an integer vector that represents National Provider Identifiers

## Usage

``` r
npi(x = integer(), sort = FALSE, na.rm = FALSE)

is_npi(x)
```

## Arguments

- x:

  - For `npi()`: A numeric vector

  - For `is_npi()`: An object to test.

- sort:

  default is FALSE; sort output

- na.rm:

  default is FALSE; remove NA values

## Value

An S3 vector of class `npi`

## Examples

``` r
(x <- npi(generate(1000L), sort = TRUE, na.rm = TRUE))
#> Warning: `in_place` is `TRUE` but `x` may be shared by multiple objects
#> <npi[108]>
#>  [1] 1002409476 1008702189 1017230826 1020520692 1022450088 1039036045
#>  [7] 1043922131 1046441717 1054424191 1061606632 1071992402 1072504008
#> [13] 1078716077 1087703983 1088553312 1091496178 1103965103 1138696863
#> [19] 1141343958 1145194431 1160722009 1180418919 1190689327 1229241249
#> [25] 1239989415 1243122607 1251402768 1261740579 1267308058 1286048735
#> [31] 1289863916 1295122570 1307516645 1326425901 1329292738 1333182750
#> [37] 1333943649 1336765965 1338155603 1360365005 1361213915 1377132778
#> [43] 1379597465 1382262305 1384734558 1386403624 1403741576 1418224782
#> [49] 1433101155 1434864512 1442077834 1466572520 1467280867 1479638417
#>  [ reached 'max' / getOption("max.print") -- omitted 54 entries ]
is_npi(x)
#> [1] TRUE
tibble::tibble(npi = x)
#> # A tibble: 108 × 1
#>           npi
#>         <npi>
#>  1 1002409476
#>  2 1008702189
#>  3 1017230826
#>  4 1020520692
#>  5 1022450088
#>  6 1039036045
#>  7 1043922131
#>  8 1046441717
#>  9 1054424191
#> 10 1061606632
#> # ℹ 98 more rows
```
