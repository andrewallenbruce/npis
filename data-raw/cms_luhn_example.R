# Example of Check Digit Calculation for NPI used without Prefix

# Assume the 9-position identifier part of the NPI is `123456789`.
# Using the Luhn formula on the identifier portion,
# the check digit is calculated as follows:

# NPI without check digit:
# 1 2 3 4 5 6 7 8 9
x <- paste0(1:9, collapse = "")

x <- ex[1] |> as.character()

x <- strtoi(unlist_(strsplit(x, "")))[1:9]
x

# Step 1:
# Double the value of alternate digits,
# beginning with the rightmost digit:
#
# 2 6 10 14 18

index <- c(1L, 3L, 5L, 7L, 9L)

x[index] <- x[index] * 2

x

# Step 2:
# Add constant 24, plus the
# individual digits of products of
# doubling, plus unaffected digits.
#
# 24 + 2 + 2 + 6 + 4 + 1 + 0 + 6 + 1 + 4 + 8 + 1 + 8 = 67

x <- vctrs::vec_if_else(x > 9L, x - 9L, x) |>
  collapse::fsum() +
  24L

x

# Step 3: Subtract from next higher number ending in zero:
# 70 – 67 = 3
# Check digit = 3
# NPI with check digit = 1234567893
CEIL <- ceiling(x / 10L) * 10L

CEIL - x
