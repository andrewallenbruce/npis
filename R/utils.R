#' Generate random NPIs
#'
#' Creates an integer vector of unvalidated NPIs.
#'
#' @param x integer, number of NPIs to generate
#' @param prop double; proportion of NAs to insert
#' @returns An integer vector of unvalidated NPIs
#' @examples
#' generate(100, 0.1)
#' @export
generate <- function(x = 100L, prop = 0.1) {
  if (prop > 1L) {
    cli::cli_abort("{.arg prop} cannot be greater than 1.")
  }

  pay <- \() cheapr::paste_(cheapr::sample_(0:9, 9L, TRUE), collapse = "")

  N <- strtoi(cheapr::paste_(1L, replicate(x, pay())))

  if (prop == 0L) {
    return(N)
  }

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
npi_examples <- function() {
  get_pin("examples")
}

#' @noRd
unlist_ <- function(x) {
  unlist(x, use.names = FALSE)
}

#' @noRd
any2 <- function(x) {
  collapse::anyv(x, TRUE)
}

#' @noRd
all2 <- function(x) {
  collapse::allv(x, TRUE)
}

#' @noRd
has_letter <- function(x) {
  grepl("[A-Z]", x, ignore.case = TRUE, perl = TRUE)
}

#' @noRd
is_numeric <- function(x) {
  !has_letter(x)
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
