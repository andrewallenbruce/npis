# https://andrewallenbruce.github.io/acephale/posts/npi/npi_constructor.html

# VALIDATION --------------
check_length <- function(x) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  if (length(x) != 1) {
    cli::cli_abort(
      "{.arg {arg}} must be of length 1.",
      arg = arg,
      call = call,
      class = "check_length"
    )
  }
}

# If `x` is a `<numeric>` vector, coerce to `<character>`
numeric_to_char <- function(x) {
  if (rlang::is_character(x)) x else as.character(x)
}

# Abort if any of `x`'s elements are not numbers
check_chars_numeric <- function(x) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  if (!stringfish::sf_grepl(x, "^[0-9]{1,10}$")) {
    cli::cli_abort(
      "An {.arg {arg}} must contain numbers only.",
      arg = arg,
      call = call,
      class = "check_chars_numeric"
    )
  }
}

# Abort if `x` is not 10 characters long
check_nchars_10 <- function(x) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  if (stringfish::sf_nchar(x) != 10L) {
    cli::cli_abort(
      "An {.arg {arg}} must be 10 characters long.",
      arg = arg,
      call = call,
      class = "check_nchars_10"
    )
  }
}

# Must begin with 1 or 2
check_first_char <- function(x) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  if (!stringfish::sf_substr(x, 1, 1) %in% c("1", "2")) {
    cli::cli_abort(
      "An {.arg {arg}} must start with a 1 or 2.",
      arg = arg,
      call = call,
      class = "check_first_char"
    )
  }
}

# CLI MESSAGES --------------
npi_inform <- function(x, msg) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  rlang::inform(
    message = (c("*" = glue::glue("{msg}: {x}"))),
    use_cli_format = TRUE,
    arg = arg,
    call = call,
    class = "npi_inform"
  )
}

npi_alert_invalid <- function(x, y) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  rlang::inform(
    message = (c("x" = "NPI is invalid")),
    body = (c("!" = glue::glue("{x} != {y}"))),
    use_cli_format = TRUE,
    arg = arg,
    call = call,
    class = "npi_alert_invalid"
  )
}

npi_alert_valid <- function(x, y) {
  arg <- rlang::caller_arg(x)
  call <- rlang::caller_env()

  rlang::inform(
    message = (c("v" = "NPI is valid")),
    body = (c(">" = glue::glue("{x} == {y}"))),
    use_cli_format = TRUE,
    arg = arg,
    call = call,
    class = "npi_alert_valid"
  )
}

# CONSTRUCTOR --------------
constructor <- function(npi, verbose = TRUE) {
  npi <- numeric_to_char(npi)
  check_length(npi)
  check_nchars_10(npi)
  check_chars_numeric(npi)
  check_first_char(npi)

  p <- \(..., ss = "") paste0(..., collapse = ss)
  s <- \(x) unlist(strsplit(x, ""), use.names = FALSE)

  id <- rev(s(npi)[1:9])

  if (verbose) {
    npi_inform(npi, "Testing NPI candidate")
    npi_inform(p(id, ss = ""), "Reverse 9-digit identifier")
  }

  idx <- c(1, 3, 5, 7, 9)
  id <- as.numeric(id)
  id[idx] <- as.numeric(id[idx]) * 2
  id[idx] <- ifelse(id[idx] > 9, id[idx] - 9, id[idx])

  if (verbose) {
    npi_inform(p(id, ss = " "), "Double & reduce alternates")
  }

  id <- sum(id)
  cn <- id + 24
  ml <- ceiling(cn / 10) * 10
  ck <- ml - cn
  test <- substr(npi, 1, 9)
  test <- p(test, ck)

  if (verbose) {
    npi_inform(
      p(p(c(id, 24), ss = " + "), p(" = ", cn)),
      "Add 24 to sum digits"
    )
    npi_inform(
      p(p("\u2308", cn, "\u2309"), p(" = ", ml)),
      "Next multiple of 10"
    )
    npi_inform(p(p(c(ml, cn), ss = " - "), p(" = ", ck)), "Find check digit")
    npi_inform(p(test, ss = ""), "Append check digit")

    if (identical(test, npi)) {
      npi_alert_valid(test, npi)
    }
    if (!identical(test, npi)) npi_alert_invalid(test, npi)
  }
  invisible(test)
}

# TESTING --------------
constructor("123456789") # must be 10 characters long
constructor("O123456789") # must contain numbers only
constructor("0000000000") # must start with a 1 or 2
# VERBOSE --------------
constructor(1234567891)
constructor(1043477615)
constructor("1000000000")
# SILENT ---------------
constructor("1000000000", FALSE)
x <- constructor("1000000000", FALSE)
x
