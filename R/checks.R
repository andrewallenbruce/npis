# npi <- ex[1:20]
# npi[5] <- NA_integer_
# npi[6] <- npi[6] %/% 10L
#' @noRd
check_digits <- function(
  npi,
  arg = rlang::caller_arg(npi),
  call = rlang::caller_env()
) {

  if (anyNA(npi)) {
    npi <- cheapr::sset(npi, cheapr::which_not_na(npi))
  }

  if (collapse::anyv(n_digits(npi) == 10L, FALSE)) {
    i <- collapse::whichv(n_digits(npi) == 10L, FALSE)

    cli::cli_abort(
      c(
        "An {.strong NPI} must be {.val 10 digits}.",
        "x" = "{.val {npi[i]}} contain{?s} {.val {n_digits(npi[i])}} digit{?s}."
      ),
      arg = arg,
      call = call
    )
  }
}
