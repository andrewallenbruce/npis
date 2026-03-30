#' @noRd
check_luhn <- function(x) {
  gtn <- function(x) cheapr::which_(x > 9L)

  i <- c(TRUE, FALSE)

  chk <- check_digit(x)

  x <- as.integer(
    vctrs::list_unchop(
      purrr::map(
        strsplit(
          as.character(
            payload(x)
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

luhn_check <- function(x) {
  if (rlang::has_length(x, 1L)) {
    return(luhn_impl(x))
  }
  purrr::map_lgl(x, luhn_impl)
}

assert_luhn <- function(x, call = rlang::caller_env()) {
  if (!any(luhn_check(x))) {
    idx <- cheapr::which_(luhn_check, invert = TRUE)
    cli::cli_abort(
      c(
        "x" = "{.val {length(idx)}} {.field npi{?s}} failed Luhn algorithm check:",
        cli::col_yellow(
          cli::format_bullets_raw(
            paste(cli::symbol$arrow_right, just_right(brackets(idx)), x[idx])
          )
        )
      ),
      call = call
    )
  }
}

x <- providertwo:::get_pin("uid")
insitu::br_idiv(x, 10)
length(x)
bench::mark(
  base = purrr::map_int(x, check_base),
  insitu = map_int(x, check_insitu)
iterations = 10,
check = FALSE
)

bench::mark(
  base = check_base(100000000:100000003),
  insitu = check_insitu(100000000:100000003)
iterations = 10,
check = FALSE
)

check_base(100000000)
check_base(100000001)
check_base(100000002)
check_base(100000003)

check_base <- function(x) {
  x <- rev(as.integer(unlist(strsplit(as.character(as.integer(x)), ""))))
  x[c(1L, 3L, 5L, 7L, 9L)]  <- x[c(1L, 3L, 5L, 7L, 9L)] * 2L
  x[cheapr::which_(x > 9L)] <- x[cheapr::which_(x > 9L)] - 9L
  x <- z <- sum(x) + 24
  ceiling(x / 10L) * 10L - z
}

check_digit_vec <- function(x) {

  if (all(ceiling(log10(x)) != 9L)) {
    stop("All numbers must have 9 digits")
  }

  i <- c(1L, 3L, 5L, 7L, 9L)
  x <- strsplit(as.character(as.integer(x)), "")

  x <- purrr::map(x, \(x) {
    x <- rev(as.integer(x))
    x[i]  <- x[i] * 2L
    x[cheapr::which_(x > 9L)] <- x[cheapr::which_(x > 9L)] - 9L
    x
  })

  x <- z <- collapse::fsum(x) + 24

  as.integer(ceiling(x / 10L) * 10L - z)
}

x        <- npi_all()
x[[100]] <- 1003011300
x[[951]] <- 1003111300
x[[673]] <- 1103111300
bench::mark(
int_luhn = map_int(npi_, luhn_algo),
  lgl_luhn = map_int(x, luhn_algo),
  iterations = 10,
  check = FALSE
)
purrr::map_vec(npi_, luhn_algo)
luhn_check(1234567890)
luhn_check(c(1417918293, 1234567890))
luhn_check(npi_all())

matrix(data = 0L,
       nrow = 10L, # length(constants),
       ncol = 9L),
dimnames = list(constants, axis))

matrix(as.numeric(1:6), 2, 3)

x <- npi_ex$k %/% 10L

check_digit_vec <- function(x) {

  if (all(ceiling(log10(x)) != 9L)) {
    stop("All numbers must have 9 digits")
  }

  i <- c(1L, 3L, 5L, 7L, 9L)
  x <- strsplit(as.character(as.integer(x)), "")

  x <- purrr::map(x, \(x) {
    x <- rev(as.integer(x))
    x[i]  <- x[i] * 2L
    x[cheapr::which_(x > 9L)] <- x[cheapr::which_(x > 9L)] - 9L
    x
  })

  x <- z <- collapse::fsum(x) + 24

  as.integer(ceiling(x / 10L) * 10L - z)
}

first_million <- check_digit_vec(100000000:101000000)
second_million <- check_digit_vec(101000001:102000000)

hist(first_million)

collapse::fcount(first_million) |>
  collapse::roworder(x)
#    x      N
# 1  0 100000
# 2  1 100000
# 3  2 100001
# 4  3 100000
# 5  4 100000
# 6  5 100000
# 7  6 100000
# 8  7 100000
# 9  8 100000
# 10 9 100000

collapse::fcount(c(first_million, second_million)) |>
  collapse::roworder(x)
#    x      N
# 1  0 200001
# 2  1 200000
# 3  2 200000
# 4  3 200000
# 5  4 200000
# 6  5 200000
# 7  6 200000
# 8  7 200000
# 9  8 200000
# 10 9 200000

check_digit_dt <- function(x) {
  fastplyr::new_tbl(
    k = as.integer(x),
    check = check_digit_vec(x))
}

check_digit_dt(100000000:100100000) |>
  fastplyr::f_mutate(
    l = k %% 10L
  )

# 1_000_000_004
