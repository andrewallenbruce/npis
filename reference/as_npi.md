# Cast to other types

Cast to other types

## Usage

``` r
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
npi(1234567893 + 1L)
#> <npi[1]>
#> [1] 1234567894
as_npi(c("1234567893", 1234567893.00, 1234567893, 1234567893L, NA))
#> <npi[5]>
#> [1] 1234567893 1234567893 1234567893 1234567893 <NA>      
```
