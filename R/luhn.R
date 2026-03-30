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
