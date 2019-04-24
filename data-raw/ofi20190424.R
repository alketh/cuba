# Erzeuge 'tidy data' der Oberflächenströmung der Ostfriesischen Inseln
# OFI am 24.04.2019 (ftp://ftp.bsh.de/Stroemungsvorhersagen/grib2/Nordsee/)

# Die zeitliche Auflösung aller Datenpakete beträgt 15 Minuten.

met <- stars::read_stars("inst/extdata/Current_ofi_2019042400_00.grb2")

plot(met[[1]])






