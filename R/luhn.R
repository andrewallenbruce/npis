#' Luhn Check
#'
#' Helpers to construct the Luhn algorithm check
#'
#' @param x a vector
#' @inheritParams rlang::args_error_context
#' @returns An integer vector
#' @examples
#' x <- examples()
#' check_luhn(x)
#' @export
check_luhn <- function(
  x,
  arg = rlang::caller_arg(x),
  call = rlang::caller_env()
) {
  raw <- last_digit(x)
  act <- check_digit(x)
  if (!collapse::all_identical(raw, act)) {
    i <- raw %!=% act
    cli::cli_abort(
      c(
        "An {.cls npi} must pass the Luhn check.",
        "i" = "Invalid locations: {.val {i}}."
      ),
      arg = arg,
      call = call
    )
  }
}
#' @export
#' @rdname check_luhn
check_digit <- function(x) {
  # x <- examples()
  IDX <- c(1L, 3L, 5L, 7L, 9L)

  x <- matrix(
    explode(payload(x)),
    nrow = cheapr::vector_length(x),
    ncol = 9L,
    byrow = TRUE
  )

  x[, IDX] <- x[, IDX] * 2L
  x[, IDX] <- ifelse(x[, IDX] > 9L, x[, IDX] - 9L, x[, IDX])
  x <- matrixStats::rowSums2(x) + 24L

  as.integer(cheapr::ceiling_(x / 10L) * 10L - x)
}

#' @export
#' @rdname check_luhn
last_digit <- function(x) {
  x %% 10L
}

#' @noRd
payload <- function(x) {
  x %/% 10L
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

#' @export
#' @rdname check_luhn
examples <- function() {
  get_pin("examples")
}
