#' read GRIB2 data from BSH
#'
#' @export
#' @return Chr Namen der Current Dateien.

get_cuba <- function() {
  url <- "ftp://ftp.bsh.de/Stroemungsvorhersagen/grib2/Ostsee/"
  cuba <- xml2::read_html(url) %>%
    rvest::html_text()

  fn <- stringr::str_split(cuba, "\r\n")[[1]]
  ids <- stringr::str_locate(fn, "Current")[, 1]

  # Clean NAs
  fn <- fn[!is.na(ids)]
  ids <- na.omit(ids)

  # Select file names.
  out <- purrr::map2_chr(fn, ids, ~stringr::str_sub(string = .x, start = .y))
  zip <- stringr::str_detect(out, pattern = "\\.bz2")
  out[!zip]
}
