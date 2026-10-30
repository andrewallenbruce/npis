#' @noRd
sample_payload <- function() {
  cheapr::paste_(cheapr::sample_(0:9, 9L, TRUE), collapse = "")
}

#' @noRd
sample_valid <- function(n) {
  cheapr::sample_(npis::examples, size = n, replace = TRUE)
}

#' Generate random NPIs
#'
#' Creates an integer vector of random NPIs.
#'
#' @param n `<integer>`, default is `10`; number of NPIs to generate
#' @param prop `<double>`, between 0 and 1, default is `0.1`; proportion of NAs to insert
#' @param syntactic `<boolean>`, default is `TRUE`; syntactically valid output
#' @param valid `<boolean>`, default is `FALSE`; technically valid output
#' @returns A vector of random NPIs
#' @examples
#' generate()
#' generate(n = 100, prop = 0.2, syntactic = FALSE)
#' generate(n = 100, valid = TRUE)
#' @export
generate <- function(n = 10L, prop = 0, syntactic = TRUE, valid = FALSE) {
  check_number_whole(n, min = 1)
  check_bool(valid)
  x <- if (n >= 100L) n %/% 10L else 1L

  if (valid) {
    return(sample_valid(n))
  }

  check_number_decimal(prop, min = 0, max = 1)
  check_bool(syntactic)
  n <- replicate(n, sample_payload())
  n <- as.integer(paste0(1L, n))

  if (prop > 0L) {
    n <- cheapr::na_insert(n, prop = prop)
  }

  if (syntactic) {
    return(n)
  }

  i <- n %iin% cheapr::sample_(n, x)
  cheapr::replace_(n, i, cheapr::sset(n, i) %/% 10L)
}
