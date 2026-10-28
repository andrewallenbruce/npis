#' Generate random NPIs
#'
#' Creates an integer vector of unvalidated NPIs.
#'
#' @param x integer, number of NPIs to generate
#' @param prop double; proportion of NAs to insert
#' @param syntactic boolean; technically valid NPIs
#' @returns An integer vector of unvalidated NPIs
#' @examples
#' generate(100, 0.2, FALSE)
#' @export
generate <- function(x = 10L, prop = 0.1, syntactic = TRUE) {
  check_number_whole(x, min = 1)
  check_number_decimal(prop, min = 0, max = 1)
  check_bool(syntactic)

  if (syntactic || prop == 0L) {
    N <- replicate(x, sample_payload())
    return(as.integer(cheapr::paste_(1L, N)))
  }
  N <- replicate(x, sample_payload())
  N <- as.integer(cheapr::paste_(1L, N))
  i <- N %iin% cheapr::sample_(N, x %/% 10L)
  N <- cheapr::replace_(N, i, cheapr::sset(N, i) %/% 10L)
  cheapr::na_insert(N, prop = prop)
}

#' @noRd
sample_payload <- function() {
  cheapr::paste_(cheapr::sample_(0:9, 9L, TRUE), collapse = "")
}
