# Cast to other types

Cast to other types

## Usage

``` r
as_npi(x, sort = FALSE, na.rm = FALSE, ...)

# S3 method for class 'integer'
as_npi(x, sort = FALSE, na.rm = FALSE, ...)

# S3 method for class 'double'
as_npi(x, sort = FALSE, na.rm = FALSE, ...)

# S3 method for class 'character'
as_npi(x, sort = FALSE, na.rm = FALSE, ...)
```

## Arguments

- x:

  a scalar or vector to convert to the npi class

- sort:

  default is FALSE; sort output

- na.rm:

  default is FALSE; remove NA values

- ...:

  passed to methods

## Value

An S3 vector of class `npi`

## Examples

``` r
as_npi(
  c("1234567893L", 1234567893.00, 1234567893L, "1234567893", NA),
  sort = TRUE,
  na.rm = TRUE
)
#> <npi[3]>
#> [1] 1234567893 1234567893 1234567893
```
