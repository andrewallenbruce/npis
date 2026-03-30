#' Generate random NPIs
#'
#' Creates an integer vector of unvalidated NPIs.
#'
#' @param x integer, number of NPIs to generate
#' @param prop double; proportion of NAs to insert
#' @param syntactic boolean; technically valid NPIs
#' @returns An integer vector of unvalidated NPIs
#' @examples
#' generate(100)
#' @export
generate <- function(x = 100L, prop = 0.1, syntactic = TRUE) {
  if (prop > 1L) {
    cli::cli_abort("{.arg prop} cannot be greater than 1.")
  }

  if (syntactic || prop == 0L) {
    return(strtoi(cheapr::paste_(1L, replicate(x, sample_payload()))))
  }

  N <- as.integer(cheapr::paste_(1L, replicate(x, sample_payload())))

  idx <- cheapr::which_(
    N %in_%
      cheapr::sample_(
        N,
        cheapr::vector_length(N) %/% 10L
      )
  )

  N <- cheapr::replace_(N, idx, cheapr::sset(N, idx) %/% 10L)

  cheapr::na_insert(N, prop = prop)
}

#' @noRd
sample_payload <- function() {
  cheapr::paste_(cheapr::sample_(0:9, 9L, TRUE), collapse = "")
}

#' @noRd
unlist_ <- function(x) {
  unlist(x, use.names = FALSE)
}

#' @noRd
mount_board <- function(pkg = "npis", source = c("local", "remote")) {
  switch(
    match.arg(source),
    local = pins::board_folder(fs::path_package(pkg, "extdata/pins")),
    remote = pins::board_url(paste0(
      "https://raw.githubusercontent.com/",
      "andrewallenbruce/",
      pkg,
      "/master/inst/extdata/pins/"
    ))
  )
}

#' @noRd
list_pins <- function(...) {
  board <- mount_board(...)
  pins::pin_list(board)
}

#' @noRd
get_pin <- function(pin, ...) {
  board <- mount_board(...)
  pin <- rlang::arg_match0(pin, list_pins())
  pins::pin_read(board, pin)
}
