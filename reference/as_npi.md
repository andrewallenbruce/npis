# Convert to an `npi` vector

This creates an integer vector of valid NPIs.

## Usage

``` r
as_npi(x, ...)
```

## Arguments

- x:

  vector

- ...:

  empty dots

## Value

An S3 vector of class `npi`

## Examples

``` r
as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#> <npi[4]>
#> [1] 1234567891 1234567891 1234567891 <NA>      
```
