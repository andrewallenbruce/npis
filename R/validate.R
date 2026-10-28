#' @noRd
n_digits <- function(x) {
  as.integer(cheapr::floor_(cheapr::log10_(x)) + 1)
}

#' @noRd
first_digit <- function(x) {
  as.integer(x / (cheapr::pow_(10L, cheapr::log10_(x))))
}

#' @noRd
all_10_digits <- function(x) {
  collapse::allv(n_digits2(x), 10L)
}

#' @noRd
which_not_10 <- function(x) {
  collapse::whichv(n_digits2(x), 10L, invert = TRUE)
}

#' Luhn Check
#' @param x an integer vector
#' @returns An integer vector
#' @examples
#' luhn_check(generate())
#' @export
luhn_check <- function(x) {
  original <- last_digit(x)
  expected <- check_digit(x)

  i <- vctrs::vec_compare(original, expected, na_equal = TRUE)
  if (!collapse::allv(i, 0L)) {
    x[i %!=% 0L] <- NA_integer_
  }
  return(x)
}

# all but last digit
#' @noRd
payload <- function(x) {
  x %/% 10L
}

#' @noRd
last_digit <- function(x) {
  x %% 10L
}

#' @noRd
explode <- function(x) {
  as.integer(
    unlist_(
      strsplit(
        as.character(x),
        split = "",
        fixed = TRUE
      )
    )
  )
}

NINE_ <- c(1L, 3L, 5L, 7L, 9L)

#' @inheritParams rlang::args_error_context
#' @export
#' @rdname luhn_check
check_digit <- function(x, call = rlang::current_env()) {
  if (!all_10_digits(x)) {
    cli::cli_abort("All input must be 10 digits", call = call)
  }

  x <- matrix(
    explode(payload(x)),
    nrow = vctrs::vec_size(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, NINE_] <- x[, NINE_] * 2L

  x[, NINE_] <- cheapr::if_else_(
    x[, NINE_] > 9L,
    x[, NINE_] - 9L,
    x[, NINE_]
  )

  x <- matrixStats::rowSums2(x) + 24L
  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)
}

#' @noRd
which_valid_npi <- function(x) {
  x <- collapse::ss(x, last_digit(x) %==% check_digit(x), check = FALSE)
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

#' @noRd
n_digits2 <- function(x) {
  purrr::map_int(x, number_digits)
}

#' @noRd
number_digits <- function(x) {
  if (is.na(x)) {
    return(NA_integer_)
  }
  if (x < 100000) {
    if (x < 100) {
      if (x < 10) {
        return(1L)
      } else {
        return(2L)
      }
    } else {
      if (x < 1000) {
        return(3L)
      } else {
        if (x < 10000) {
          return(4L)
        } else {
          return(5L)
        }
      }
    }
  } else {
    if (x < 10000000) {
      if (x < 1000000) {
        return(6L)
      } else {
        return(7L)
      }
    } else {
      if (x < 100000000) {
        return(8L)
      } else {
        if (x < 1000000000) {
          return(9L)
        } else {
          return(10L)
        }
      }
    }
  }
  cli::cli_abort("Could not determine the number of digits in {.val {x}}")
}
