#' Generate random NPIs
#'
#' This creates an integer vector of valid NPIs.
#'
#' @param x integer, number of NPIs to generate
#' @returns An integer vector of unvalidated NPIs
#' @examples
#' generate(100)
#' @export
generate <- function(x) {
  as.integer(
    collapse::alloc(
      value = cheapr::paste_(
        cheapr::c_(
          1,
          cheapr::sample_(0:9, 9L, TRUE)
        ),
        collapse = ""
      ),
      n = x
    )
  )
}

# generate_npi <- function(x) {
#   as.integer(replicate(
#     n = x,
#     expr = paste0(c(1, sample(0:9, 9, replace = TRUE)), collapse = "")
#   ))
# }
