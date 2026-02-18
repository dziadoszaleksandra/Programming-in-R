library(tidyverse)
library(rvest)
library(writexl)
library(foreign)


#----------------------------------------------------------------------
# Zad1: Przygotuj ramke danych z informacjami ze strony internetowej

# Pobieranie danych o filmach (przyklad na bazie struktury Filmweb/IMDb)
url <- "https://www.imdb.com/chart/top/" 
page <- read_html(url)

# Wyciaganie informacji 
titles <- page %>% html_nodes(".ipc-title-link-wrapper") %>% html_text() %>% head(20)
years <- page %>% html_nodes(".cli-title-metadata-item:nth-child(1)") %>% html_text() %>% head(20)
ratings <- page %>% html_nodes(".ipc-rating-star--rating") %>% html_text() %>% head(20)

# Tworzenie ramki danych (minimum 20 obserwacji, 5 zmiennych)
filmy_df <- data.frame(
  id = 1:20,
  tytul = titles,
  rok_produkcji = years,
  ocena = ratings,
  zrodlo = rep("IMDb", 20)
)

print(filmy_df)


#----------------------------------------------------------------------
# Zad2: Podsumowanie (Operacje na projektach i plikach)

# 1. Sprawdzanie folderu roboczego
getwd()

# 3. Tworzenie folderow data i R
dir.create("data")
dir.create("R")

# 4. Pobieranie danych meteo do katalogu data
url_meteo <- "https://raw.githubusercontent.com/Nowosad/elp/master/pliki/dane_meteo.csv"
download.file(url_meteo, destfile = "data/dane_meteo_url.csv")

# 5. Obiekt ptaki i eksport do katalogu R
url_ptaki <- "http://biecek.pl/MOOC/dane/koty_ptaki.csv"
ptaki <- read.table(url_ptaki, sep=";", dec=",", header=TRUE)
write.csv(ptaki, file = "R/ptaki_export.csv")

# 6. Wczytanie meteo, usuniecie 1. kolumny i zapis do RDS
meteo_raw <- read.csv("data/dane_meteo_url.csv")
meteo_clean <- meteo_raw[, -1]
saveRDS(meteo_clean, file = "data/dane_meteo_url2.rds")

# 7. Polaczenie kolumnowe (cbind) ramek przed i po przerobkach
met <- cbind(meteo_raw, meteo_clean)


#----------------------------------------------------------------------
# Zad3: Wprowadzanie danych (Tabela Owady)

# 1. Tworzenie ramki danych na podstawie tabeli 1.1
z <- data.frame(
  Pleć = c(0, 1, 0, 1, 0, 1, 1, 0, 1, 1),
  Kolor = c(1, 1, 2, 1, 3, 3, 2, 3, 1, 2),
  Waga = c(10.68, 10.02, 10.18, 8.01, 10.23, 9.70, 9.73, 11.22, 9.19, 11.45),
  Wzrost = c(9.43, 10.66, 10.41, 9.00, 8.98, 9.71, 9.09, 9.23, 8.97, 10.34)
)

# 4. Zmiana wagi czwartego owada na 9.77
z[4, "Waga"] <- 9.77

# 5. Zapis do owady.csv
write.csv(z, file = "owady.csv", row.names = FALSE)

