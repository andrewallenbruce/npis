#' @noRd
construct_npi <- function(npi) {
  npi_test <- npi

  # Remove the 10th digit to create the 9-position identifier part of the NPI
  id <- unlist(strsplit(npi_test, ""), use.names = FALSE)[1:9]

  #---
  id_print <- rlang::sym(paste0(c(id, "_"), collapse = ""))
  cli::cli_alert("01. Keep first 9 digits: {.strong {.val {id_print}}}")
  #---

  # Reverse order of digits
  x <- rev(id)

  #---
  rev_print <- rlang::sym(paste0(x, collapse = ""))
  cli::cli_alert("02. Reverse order of digits:  {.strong {.val {rev_print}}}")
  #---

  # Select index of every other digit
  idx <- seq(1, length(x), 2)

  #---
  idx_print <- rlang::sym(paste0(x[idx], collapse = " "))
  cli::cli_alert("03. Select every other digit: {.strong {.val {idx_print}}}")
  #---

  # Double the value of the alternate digits
  x[idx] <- as.numeric(x[idx]) * 2

  #---
  dbl_print <- rlang::sym(paste0(x[idx], collapse = " "))
  cli::cli_alert(
    "04. Double each alternate digit: {.strong {.val {dbl_print}}}"
  )
  ins_print <- rlang::sym(paste0(x, collapse = " "))
  cli::cli_alert(
    "05. Insert alternates back into original string: {.strong {.val {ins_print}}}"
  )
  #---

  # Reverse order of digits again
  x <- rev(x)

  #---
  rev2 <- x
  rev2_print <- rlang::sym(paste0(x, collapse = " "))
  cli::cli_alert("06. Reverse order again: {.strong {.val {rev2_print}}}")
  #---

  # Split and unlist to separate digits
  x <- unlist(strsplit(x, ""), use.names = FALSE)

  #---
  rev2 <- unlist(strsplit(rev2, ""), use.names = FALSE)
  add <- sum(as.numeric(x))
  add_print <- rlang::sym(paste0(
    paste0(rev2, collapse = " + "),
    paste0(" = ", add)
  ))
  cli::cli_alert("07. Sum the individual digits: {.strong {.val {add_print}}}")
  #---

  # Add constant 24 to the sum of the digits
  x <- sum(as.numeric(x)) + 24

  #---
  const_print <- rlang::sym(paste0(
    paste0(c(add, 24), collapse = " + "),
    paste0(" = ", add + 24)
  ))
  cli::cli_alert(
    "08. Add {.emph constant} {.strong 24} to the sum: {.strong {.val {const_print}}}"
  )
  #---

  # Find the next higher number ending in zero
  y <- ceiling(x / 10) * 10

  #---
  int_print <- rlang::sym(paste0(
    paste0("\u2308", add + 24, "\u2309"),
    paste0(" = ", y)
  ))
  cli::cli_alert(
    "09. Find next largest integer divisible by 10: {.strong {.val {int_print}}}"
  )
  #---

  # Find the check digit by subtracting x from y
  z <- y - x

  #---
  check_print <- rlang::sym(paste0(
    paste0(c(y, (add + 24)), collapse = " - "),
    paste0(" = ", z)
  ))
  cli::cli_alert(
    "10. Find the check digit by subtracting {.emph step 08} from {.emph step 09}: {.strong {.val {check_print}}}"
  )
  #---

  # Append the check digit to the end of the 9-digit identifier
  id[10] <- z

  #---
  append_print <- rlang::sym(paste0(id, collapse = ""))
  cli::cli_alert(
    "11. Append the check digit to the number from step 01: {.strong {.val {append_print}}}"
  )
  #---

  # Collapse the vector into a single string
  npi_valid <- paste0(id, collapse = "")

  # Is the syntactically valid NPI identical to the test NPI?
  if (identical(npi_valid, npi_test)) {
    #---
    identical <- rlang::sym(paste0(c(npi_test, npi_valid), collapse = " = "))
    cli::cli_alert_success(
      "NPI {.strong is} syntactically valid: {.strong {.val {identical}}}"
    )
    #---
  }

  if (!identical(npi_valid, npi_test)) {
    #---
    not_identical <- rlang::sym(paste0(
      c(npi_test, npi_valid),
      collapse = " != "
    ))
    cli::cli_alert_danger(
      "NPI {.strong is not} syntactically valid: {.strong {.val {not_identical}}}"
    )
    #---
  }
}

#' @noRd
construct_npi2 <- function(npi) {
  npi_test <- npi

  #---
  cli_npi <- rlang::sym(npi_test)
  cli::cli_alert("Testing NPI: {.strong {.val {cli_npi}}}")
  #---

  # Remove the 10th digit to create the 9-position identifier part of the NPI
  id_9 <- unlist(strsplit(npi_test, ""), use.names = FALSE)[1:9]

  #---
  cli_id_9 <- rlang::sym(paste0(c(id_9, "_"), collapse = ""))
  cli::cli_alert("Keep first 9 digits: {.strong {.val {cli_id_9}}}")
  #---

  # Reverse order of digits
  x_rev <- rev(id_9)

  #---
  cli_x_rev <- rlang::sym(paste0(x_rev, collapse = ""))
  cli::cli_alert("Reverse digit order:  {.strong {.val {cli_x_rev}}}")
  #---

  # Select index of every other digit
  x_idx <- seq(1, length(x_rev), 2)

  #---
  cli_x_idx <- rlang::sym(paste0(x_rev[x_idx], collapse = " "))
  cli::cli_alert("Select every other digit: {.strong {.val {cli_x_idx}}}")
  #---

  # Double the value of the alternate digits
  x_rev[x_idx] <- as.numeric(x_rev[x_idx]) * 2

  #---
  cli_dbl <- rlang::sym(paste0(x_rev[x_idx], collapse = " "))
  cli_ins <- rlang::sym(paste0(x_rev, collapse = " "))
  cli::cli_alert("Double each: {.strong {.val {cli_dbl}}}")
  cli::cli_alert("Replace original with doubles: {.strong {.val {cli_ins}}}")
  #---

  # Split and unlist to separate digits
  x_split <- unlist(strsplit(x_rev, ""), use.names = FALSE)

  x_add <- sum(as.numeric(x_split))

  #---
  cli_x_add <- rlang::sym(paste0(
    paste0(x_split, collapse = " + "),
    paste0(" = ", x_add)
  ))
  cli::cli_alert("Sum individual digits: {.strong {.val {cli_x_add}}}")
  #---

  # Add constant 24 to the sum of the digits
  x_24 <- x_add + 24

  #---
  sym_24 <- rlang::sym("24")
  cli_x_24 <- rlang::sym(paste0(
    paste0(c(x_add, 24), collapse = " + "),
    paste0(" = ", x_24)
  ))
  cli::cli_alert(
    "Add {.strong {.val {sym_24}}} to the sum: {.strong {.val {cli_x_24}}}"
  )
  #---

  x_divide <- x_24 / 10
  cli_x_divide <- rlang::sym(paste0(
    paste0(x_24, " / ", 10),
    paste0(" = ", x_divide)
  ))
  cli::cli_alert("Divide by 10: {.strong {.val {cli_x_divide}}}")

  x_divide_first <- as.numeric(unlist(
    strsplit(as.character(x_divide), ""),
    use.names = FALSE
  )[1])
  cli_x_first <- rlang::sym(paste0(
    paste0(x_divide),
    paste0(" = ", x_divide_first)
  ))
  cli::cli_alert("Take first digit: {.strong {.val {cli_x_first}}}")

  x_plus_one <- x_divide_first + 1
  cli_x_plus <- rlang::sym(paste0(
    paste0(x_divide_first, " + ", 1),
    paste0(" = ", x_plus_one)
  ))
  cli::cli_alert("Add one: {.strong {.val {cli_x_plus}}}")

  x_paste_zero <- paste0(x_plus_one, "0")
  cli_x_zero <- rlang::sym(paste0(
    paste0(x_plus_one, " * ", 10),
    paste0(" = ", x_paste_zero)
  ))
  cli::cli_alert("Multiply by 10: {.strong {.val {cli_x_zero}}}")

  # Find the next higher number ending in zero
  x_next <- ceiling(x_24 / 10) * 10

  #---
  cli_x_next <- rlang::sym(paste0(
    paste0("\u2308", x_24, "\u2309"),
    paste0(" = ", x_next)
  ))
  cli::cli_alert(
    "This is the next largest integer divisible by 10: {.strong {.val {cli_x_next}}}"
  )
  #---

  # Find the check digit by subtracting x from y
  x_check <- x_next - x_24

  #---
  cli_x_check <- rlang::sym(paste0(
    paste0(c(x_next, x_24), collapse = " - "),
    paste0(" = ", x_check)
  ))
  cli::cli_alert(c("Find the check digit: {.strong {.val {cli_x_check}}}"))
  #---

  # Append the check digit to the end of the 9-digit identifier
  id_10 <- id_9
  id_10[10] <- x_check

  #---
  cli_id_10 <- rlang::sym(paste0(id_10, collapse = ""))
  cli::cli_alert(c(
    "Append check digit to the original value: {.strong {.val {cli_id_10}}}"
  ))
  #---

  # Collapse the vector into a single string
  npi_valid <- paste0(id_10, collapse = "")

  # Is the syntactically valid NPI identical to the test NPI?
  if (identical(npi_valid, npi_test)) {
    #---
    identical <- rlang::sym(paste0(c(npi_test, npi_valid), collapse = " = "))
    cli::cli_alert_success(c(
      "NPI {.strong is} syntactically valid: {.strong {.val {identical}}}"
    ))
    #---
  }

  if (!identical(npi_valid, npi_test)) {
    #---
    not_identical <- rlang::sym(paste0(
      c(npi_test, npi_valid),
      collapse = " != "
    ))
    cli::cli_alert_danger(c(
      "NPI {.strong is not} syntactically valid: {.strong {.val {not_identical}}}"
    ))
    #---
  }
}
