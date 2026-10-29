#' @noRd
unlist_ <- function(x) unlist(x, use.names = FALSE)

#' @noRd
has_letter <- function(x) {
  grepl("[A-Z]", x, ignore.case = TRUE, perl = TRUE)
}

#' @noRd
is_numeric <- function(x) !has_letter(x)

#' @noRd
any_ <- function(x) collapse::anyv(x, TRUE)

#' Count invalid NPIs
#' @param x An `npi` vector
#' @export
#' @keywords internal
n_invalid <- function(x) {
  if (is_npi(x) && anyNA(x)) {
    length(collapse::whichNA(x))
  } else {
    0L
  }
}

#' @noRd
which_valid_npi <- function(x) {
  x <- collapse::ss(
    x,
    last_digit(x) %==% check_digit(x),
    check = FALSE
  )
  collapse::funique(sort.int(x))
}

#' @noRd
which_valid <- function(x, check = FALSE) {
  x <- collapse::funique(sort.int(x))
  x <- which_valid_npi(x)
  if (!check) {
    return(x)
  }
  last_digit(x)
}
