o <- open_rdz(2)
# i <- last_digit(o)
i <- c(i, last_digit(o))
vctrs::vec_count(i)

npi(o[i %!iin% c(2:8, 11:18)])
o |> collapse::fdiff() |> collapse::qtab() |> names()

last_digit(o) |> collapse::fdiff() |> collapse::qtab()
last_digit(o) |> diff()

check_digit(c(1056999992L, 1125999999L))

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
