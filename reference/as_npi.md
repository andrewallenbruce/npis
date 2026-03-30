# Convert a vector to an `npi` object

Converts a character or numeric vector of unvalidated NPIs into a
validated `<npi>` vector.

## Usage

``` r
as_npi(x, ...)
```

## Arguments

- x:

  vector

- ...:

  These dots must be empty

## Value

An S3 vector of class `<npi>`

## Examples

``` r
as_npi(c("1234567891", 1234567891, 1234567891L, NA_character_))
#> <npi[4]>
#> [1] 1234567891 1234567891 1234567891 <NA>      
```
