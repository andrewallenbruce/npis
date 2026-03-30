#' Generate random NPIs
#'
#' Creates an integer vector of unvalidated NPIs.
#'
#' @param x integer, number of NPIs to generate
#' @param prop_na double; proportion of NAs to insert
#' @returns An integer vector of unvalidated NPIs
#' @examples
#' generate(100, 0.1)
#' @export
generate <- function(x, prop_na = 0L) {
  npis <- as.integer(
    replicate(
      expr = cheapr::paste_(
        cheapr::c_(
          1,
          cheapr::sample_(0:9, 9L, TRUE)
        ),
        collapse = ""
      ),
      n = x
    )
  )

  if (prop_na == 0L) {
    return(npis)
  }

  if (prop_na > 1L) {
    cli::cli_abort("{.arg prop_na} cannot be greater than 1.")
  }

  cheapr::na_insert(npis, prop = prop_na)
}

#' @noRd
unlist_ <- function(x) {
  unlist(x, use.names = FALSE)
}
