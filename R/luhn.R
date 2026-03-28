# https://www.cms.gov/Regulations-and-Guidance/Administrative-Simplification/NationalProvIdentStand/Downloads/NPIcheckdigit.pdf
# # The ceiling function maps a real number x to the smallest integer number that is greater than or equal to x:

#' @noRd
checkLuhn <- function(number) {
  # must have at least 2 digits
  if (nchar(number) <= 2) {
    return(FALSE)
  }

  # strip spaces
  number <- gsub(pattern = " ", replacement = "", number)

  # Return FALSE if not a number
  if (!grepl("^[[:digit:]]+$", number)) {
    return(FALSE)
  }

  # split the string, convert it to a list, and reverse it
  digits <- unlist(strsplit(number, ""))
  digits <- digits[length(digits):1]

  to_replace <- seq(2, length(digits), 2)
  digits[to_replace] <- as.numeric(digits[to_replace]) * 2

  # gonna do some maths, let's convert it to numbers
  digits <- as.numeric(digits)

  # a digit cannot be two digits, so any that are greater than 9, subtract 9 and
  # make the world a better place
  digits <- ifelse(digits > 9, digits - 9, digits)

  # does the sum divide by 10?
  sum(digits) %% 10 == 0
}

#' @noRd
create_npi <- function(
  npi,
  arg = rlang::caller_arg(npi),
  call = rlang::caller_env()
) {

  if (nchar(npi) != 10L) {
    cli::cli_abort(
      c(
        "An {.strong NPI} must be {.emph 10 digits long}.",
        "x" = "{.val {npi}} contains {.val {nchar(npi)}} digit{?s}."
      ),
      call = call
    )
  }

  if (!grepl("^1[0-9]{9}$", npi, perl = TRUE)) {
    cli::cli_abort(
      c(
        "An {.strong NPI} must be {.emph numeric}.",
        "x" = "{.val {npi}} contains {.emph non-numeric} characters."
      ),
      call = call
    )
  }


  # Must pass Luhn algorithm
  npi_test <- as.character(npi)

  # Remove the 10th digit to create the 9-position identifier part of the NPI
  id <- unlist_(strsplit(npi_test, ""))[1:9]

  # Reverse order of digits
  x <- rev(id)

  # Select index of every other digit
  idx <- seq(1, length(x), 2)

  # Double the value of the alternate digits
  x[idx] <- as.numeric(x[idx]) * 2

  # Reverse order of digits again
  x <- rev(x)

  # Split and unlist to separate digits
  x <- unlist_(strsplit(x, ""))

  # Add constant 24 to the sum of the digits
  x <- sum(as.numeric(x)) + 24

  # Find the next higher number ending in zero
  y <- ceiling(x / 10) * 10

  # Find the check digit by subtracting x from y
  z <- y - x

  # Append the check digit to the end of the 9-digit identifier
  id[10] <- z

  # Collapse the vector into a single string
  npi_valid <- paste0(id, collapse = "")

  list(
    input = npi_test,
    valid = npi_valid,
    equal = identical(npi_valid, npi_test)
  )
}

#' @noRd
luhn <- function(x) {
  x <- rev(as.integer(unlist(
    strsplit(as.character(x), split = "", fixed = TRUE),
    use.names = FALSE
  )))

  div <- seq_along(x) %% 2L
  odd <- div == 1L
  even <- div == 0L

  x[even] <- x[even] * 2L
  x[even] <- ifelse(x[even] > 9L, x[even] - 9L, x[even])

  sum_odd <- sum(x[odd])
  sum_even <- sum(x[even])

  sum_x <- sum_odd + sum_even

  sum_x %% 10L == 0L
}

#' @noRd
check_luhn <- function(x) {
  gtn <- function(x) cheapr::which_(x > 9L)

  i <- c(TRUE, FALSE)

  chk <- tenth(x)

  x <- as.integer(
    vctrs::list_unchop(
      purrr::map(
        strsplit(
          as.character(
            one_nine(x)
          ),
          split = "",
          fixed = TRUE
        ),
        cheapr::rev_
      )
    )
  )

  x[i] <- x[i] * 2L

  x[i][gtn(x[i])] <- x[i][gtn(x[i])] - 9L

  GRP <- cheapr::rep_each_(seq_along(chk), 9L)

  smmm <- collapse::fsum(x, g = GRP) + 24L

  x <- z <- unname(smmm)

  x <- ceiling(x / 10L) * 10L - z

  x == chk
}
