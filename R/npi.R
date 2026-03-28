#' @noRd
check_10_digits <- function(x, call = rlang::caller_env()) {
  if (ceiling(log10(x)) != 10L) {
    cli::cli_abort(c("x" = "{.arg x} must have 10 digits"), call = call)
  }
}


#' @noRd
luhn_impl <- function(x) {
  check <- x %% 10L
  x <- cheapr::cheapr_rev(as.integer(unlist(strsplit(
    as.character(as.integer(x %/% 10L)),
    ""
  ))))
  x[c(1L, 3L, 5L, 7L, 9L)] <- x[c(1L, 3L, 5L, 7L, 9L)] * 2L
  x[cheapr::which_(x > 9L)] <- x[cheapr::which_(x > 9L)] - 9L
  x <- z <- collapse::fsum(x) + 24
  x <- ceiling(x / 10L) * 10L - z
  x == check
}


#' @noRd
luhn_check <- function(x) {
  if (rlang::has_length(x, 1L)) {
    return(luhn_impl(x))
  }
  purrr::map_lgl(x, luhn_impl)
}

# assert_luhn <- function(x, call = rlang::caller_env()) {
#   if (!any(luhn_check(x))) {
#     idx <- cheapr::which_(luhn_check, invert = TRUE)
#     cli::cli_abort(
#       c(
#         "x" = "{.val {length(idx)}} {.field npi{?s}} failed Luhn algorithm check:",
#         cli::col_yellow(
#           cli::format_bullets_raw(
#             paste(cli::symbol$arrow_right, just_right(brackets(idx)), x[idx])
#           )
#         )
#       ),
#       call = call
#     )
#   }
# }
