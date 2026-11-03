library(slam)
x <- matrix(c(1, 0, 0, 2, 1, NA), nrow = 3)
x
s <- slam::as.simple_triplet_matrix(x)
unclass(s)
row_sums(s)
row_sums(s, na.rm = TRUE)
col_sums(s)
col_sums(s, na.rm = TRUE)
M
ind <- which(e >= 1L, arr.ind = TRUE)
dimnames(ind) <- NULL
simple_triplet_matrix(
  ind[, 1L],
  ind[, 2L],
  M[ind],
  nrow = nrow(x),
  ncol = ncol(x),
  dimnames = dimnames(x)
)

# i = column index
# j = row index
# v = values
x
str(s)
s$v[s$j %% 2L != 0L]

s$v[s$j %% 2L != 0L] <- minus_nine(s$v[s$j %% 2L != 0L] * 2L)
ss <- slam::row_sums(s) + 24L
ss <- as.integer(cheapr::ceiling_(ss / 10L) * 10L - ss)

x

x <- open_rdz(1)


x <- explode(x %/% 10L)
vctrs::vec_split(e, vctrs::vec_rep_each(1:10, 9L))

slam::simple_triplet_matrix(
  i = vctrs::vec_rep(seq(vctrs::vec_size(x)), vctrs::vec_size(x)),
  j = vctrs::vec_rep_each(1:9, vctrs::vec_size(x)),
  v = explode(x %/% 10L)
)

M <- matrix(
  explode(x %/% 10L),
  nrow = vctrs::vec_size(x),
  ncol = 9L,
  byrow = TRUE
)
unclass(slam::as.simple_triplet_matrix(M))

x <- generate()

# unclass(slam::as.simple_triplet_matrix(M))
x <- triplet_matrix(x)
x$v[c(1, 11, 21, 31, 41, 51, 61, 71, 81)]
tm$v[tm$j %% 2L != 0L] <- minus_nine(x$v[x$j %% 2L != 0L] * 2L)
vctrs::vec_split(tm$v, tm$j)
M

matrix(
  explode(x %/% 10L),
  nrow = vctrs::vec_size(x),
  ncol = 9L
)
