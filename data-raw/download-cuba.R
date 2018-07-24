fn <- get_cuba()
dfn <- file.path("inst", "extdata", basename(fn))

for (i in seq_along(fn)) {
  if (!file.exists(dfn[i])) download.file(fn[i], dfn[i])
}
