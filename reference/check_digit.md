# Luhn Check

Helpers to construct the Luhn algorithm check

## Usage

``` r
check_digit(x)

first_digit(x)

last_digit(x)

examples()
```

## Arguments

- x:

  a vector

## Value

An integer vector

## Examples

``` r
x <- examples()
head(x, 20)
#>  [1] 1285698357 1083602320 1023129947 1821010307 1770531733 1962441766
#>  [7] 1699718056 1659338564 1831170372 1962465971 1386616498 1831193515
#> [13] 1790742849 1801877675 1396831053 1255333480 1255449393 1215959697
#> [19] 1124138805 1396743886

id <- last_digit(x)
head(id, 20)
#>  [1] 7 0 7 7 3 6 6 4 2 1 8 5 9 5 3 0 3 7 5 6

x <- check_digit(x)
head(x, 20)
#>  [1] 7 0 7 7 3 6 6 4 2 1 8 5 9 5 3 0 3 7 5 6

all(head(id, 20) == head(x, 20))
#> [1] TRUE
```
