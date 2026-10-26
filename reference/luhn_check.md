# Luhn Check

Luhn Check

## Usage

``` r
luhn_check(x)

check_digit(x)
```

## Arguments

- x:

  an integer vector

## Value

An integer vector

## Examples

``` r
luhn_check(generate(1000L)) |> length()
#> [1] 1000
```
