# Cast to other types

Cast to other types

## Usage

``` r
as_npi(x, ...)

# Default S3 method
as_npi(x, ...)

# S3 method for class 'npi'
as_npi(x, ...)

# S3 method for class 'integer'
as_npi(x, ...)

# S3 method for class 'double'
as_npi(x, ...)

# S3 method for class 'character'
as_npi(x, ...)
```

## Arguments

- x:

  a scalar or vector to convert to the npi class

- ...:

  passed on to
  [`npi()`](https://andrewallenbruce.github.io/npis/reference/npi.md)

## Value

An S3 vector of class `npi`

## Examples

``` r
as_npi(
  c(
    1000000004,
    npi(1000000012),
    1000025001L,
    1000050009.00,
    "1000050041L",
    "1000050058"
  ),
  sort = TRUE,
  na.rm = TRUE
)
#> <npi[5]>
#> [1] 1000000004 1000000012 1000025001 1000050009 1000050058
```
