#' @noRd
sample_payload <- function() {
  cheapr::paste_(cheapr::sample_(0:9, 9L, TRUE), collapse = "")
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
generate <- function(n = 10L, prop = 0.1, syntactic = TRUE, valid = FALSE) {
  check_number_whole(n, min = 1)
  check_bool(valid)

  if (valid) {
    return(
      cheapr::sample_(
        npis::examples,
        size = n,
        replace = TRUE
      )
    )
  }

  check_number_decimal(prop, min = 0, max = 1)
  check_bool(syntactic)
  x <- n %/% 10L
  n <- replicate(n, sample_payload())
  n <- as.integer(cheapr::paste_(1L, n))

  if (syntactic || prop == 0L) {
    return(n)
  }

  i <- n %iin% cheapr::sample_(n, x)
  n <- cheapr::replace_(n, i, cheapr::sset(n, i) %/% 10L)
  cheapr::na_insert(n, prop = prop)
}
