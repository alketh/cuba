# Erzeuge 'tidy data' der Oberflächenströmung der Ostfriesischen Inseln
# OFI am 24.04.2019 (ftp://ftp.bsh.de/Stroemungsvorhersagen/grib2/Nordsee/)

# Die zeitliche Auflösung aller Datenpakete beträgt 15 Minuten.

library(ggplot2)

met <- stars::read_stars("inst/extdata/Current_ofi_2019042400_00.grb2")

ss <- as.data.frame(met)

ggplot(ss[ss$band == 1, ], aes(x = x, y = y, fill = Current_ofi_2019042400_00.grb2)) +
  geom_raster() +
  scale_fill_viridis()

plot(met[[1]])


data <- tibble::tribble(
  ~region,   ~area, ~area_long,              ~lat1,     ~lon1,     ~lat2,     ~lon2,     ~grid,
  "Nordsee", "no",  "Nordsee",               "48,5° N", "4°W",     "60°N",    "10°E",    3,
  "Nordsee", "db",  "Deutsche Bucht",        "53°N",    "6°E",     "58° N",   "9,5°E",   0.5,
  "Nordsee", "idb", "Innere deutsche Bucht", "53°N",    "7.75°E",  "54.25°N", "9°E",     0.5,
  "Nordsee", "nfi", "Nordfriesische Inseln", "54.25°N", "7.75°E",  "55.25°N", "9°E",     0.5,
  "Nordsee", "ofi", "Ostfriesische Inseln",  "53°N",    "6°E",     "54.25°N", "7.75°E",  0.5,
  "Ostsee",  "ba",  "Ostsee",                "52° N",   "10° E",   "68,8° N", "30° E",   3,
  "Ostsee",  "wb",  "Westliche Ostsee",      "53,2° N", "9,5° E",  "56,4° N", "14,8° E", 0.5,
  "Ostsee",  "kbu", "Kieler Bucht",          "53.9°N",  "9.8°E",   "54.75°N", "11.3°E",  0.5,
  "Ostsee",  "mbu", "Lübecker Bucht",        "53.9°N",  "10.75°E", "54.75°N", "12.5°E",  0.5,
  "Ostsee",  "rgn", "Gebiet um Rügen",       "53°N",    "12.5°E",  "55°N",    "14.5°E",  0.5,
  "Ostsee",  "snd", "Öresund",               "56.1°N",  "12.2° E", "56.3°N",  "13.1° E", 0.5,
  "Ostsee",  "blt", "Beltgerion",            "54.7°N",  "9.5°E",   "56°N",    "11.3° E", 0.5
)



