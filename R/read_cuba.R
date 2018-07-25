#' Read in *.grib2 data
#'
#' @param grib2 Chr Canonical Filename
#' @return Tibble
#' @export
#'
#' @examples
path <- file.path("inst", "extdata")
files <- list.files(path, full.names = TRUE, pattern = "\\.grb2")
grib2 <- files[1]

# https://stackoverflow.com/questions/7622090/how-to-read-grib-files-with-r-gdal
read_cuba <- function(grib2) {

}

gribfile <- grib2
library(rgdal)
library(sp)
gribfile<-"wavedata.grib"
grib <- readGDAL(gribfile)

summary = GDALinfo(gribfile,silent=TRUE)
