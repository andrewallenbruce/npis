# Cast to other types

Cast to other types

## Usage

``` r
as_npi(x, ...)

# S3 method for class 'integer'
as_npi(x, ...)

# S3 method for class 'character'
as_npi(x, ...)

# S3 method for class 'double'
as_npi(x, ...)
```

## Arguments

- x:

  description

- ...:

  description

## Value

description

## Examples

``` r
as_npi(c("1234567893L", 1234567893.00, 1234567893, 1234567893L, NA))
#> <npi[5]>
#> [1] <NA>       1234567893 1234567893 1234567893 <NA>      
```
