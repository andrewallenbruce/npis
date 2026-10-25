# Low-level Constructor

Low-level Constructor

## Usage

``` r
new_npi(x = integer(), call = rlang::current_env())
```

## Arguments

- x:

  An integer vector

- call:

  The execution environment of a currently running function, e.g.
  `caller_env()`. The function will be mentioned in error messages as
  the source of the error. See the `call` argument of
  [`abort()`](https://rlang.r-lib.org/reference/abort.html) for more
  information.
