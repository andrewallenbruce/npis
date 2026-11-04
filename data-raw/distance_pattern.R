o <- open_rdz(1) - 1000000000L
#         4 191999998 (17700000)
# 183000003 362999991 (18000000)
# 183000003 422999999 (24000000)
# 423000003 632999995 (21000000)
# 633000009 857999993 (19800000)
# 858000007 917999991 ( 6000000)
range(o)
length(o)
diff(o - 1000000000L) |> ivs::iv_diff()
ivs::iv_diff(o - 1000000000L)
diff(o[1:50])
# i <- last_digit(o)
i <- c(i, last_digit(o))
vctrs::vec_count(i)

npi(o[i %!iin% c(2:8, 11:18)])
o |> collapse::fdiff() |> collapse::qtab() |> names()

last_digit(o) |> collapse::fdiff() |> collapse::qtab()
last_digit(o) |> diff()

check_digit(c(1056999992L, 1125999999L))

d <- tibble::tibble(
  i = o,
  diff = collapse::fdiff(
    i,
    n = 1:2,
    diff = 1,
    fill = 0L
  )
) |>
  print(n = 100)
d$diff |> unique()
#        diff    count
# 1         8 75828000
# 2        18 18957000
# 3         7  7455000
# 4        17  3195000
# 5         6   568710
# 6        16   379140
# 7         5    53250
# 8        15    53250
# 9        14     5683
# 10        4     3786
# 11       13      742
# 12        3      323
# 13       12       78
# 14        2       16
# 15       11        9
# 16        1        2
# 17  6000016        1
# 18  9000003        1
# 19 30000008        1
# 20 -5999988        1
# 21  3000009        1
