library(dplyr)
library(nycflights13) # Pakiet z danymi o lotach
library(ggplot2)      # Zawiera zbiór diamonds
library(gapminder)    # Zawiera dane o krajach i PKB

# ------------------------------------------------------------------------
# Zadania na rozgrzewkę (nycflights) 
# 1. Wskaż dane początkowe oraz dane końcowe tabeli nycflights
head(flights)
tail(flights)

# 2. Zweryfikuj strukturę danych
str(flights)

# 3. Ile mamy obserwacji, a ile cech?
dim(flights) 

# 4. Jakie dane są zawarte w tabeli?
summary(flights)


# ------------------------------------------------------------------------
# Zadania na rozgrzewkę (diamonds)
# 1. Wybierz obserwacje, dla których zmienna kolor wynosi "E"
zad1_diam <- diamonds %>% filter(color == "E")

# 2. Wybierz diamenty, które charakteryzują się przynajmniej dobrym (Good) cięciem
# Wykorzystujemy fakt, że cut jest czynnikiem uporządkowanym (ordered factor)
zad2_diam <- diamonds %>% filter(cut >= "Good")

# 3. Wybierz diamenty, których karat jest większy od 0.25 i mniejszy bądź równy 0.30
zad3_diam <- diamonds %>% filter(carat > 0.25 & carat <= 0.30)

# 4. Wybierz diamenty, których cena > 350 i karat > 0.25 LUB kolor != "I" i cięcie >= Premium
zad4_diam <- diamonds %>% 
  filter((price > 350 & carat > 0.25) | (color != "I" & cut >= "Premium"))


# ------------------------------------------------------------------------
# Zadanie (gapminder)
# Filtrujemy dane dla Afryki do obliczeń
africa_data <- gapminder %>% filter(continent == "Africa")

# 1-5) Statystyki dla oczekiwanej długości życia w Afryce
africa_stats <- africa_data %>% 
  summarise(
    srednia = mean(lifeExp),
    odchylenie_std = sd(lifeExp),
    percentyl_90 = quantile(lifeExp, 0.9),
    percentyle_ogolne = list(quantile(lifeExp)), # Zwraca kwartyle
    IQR = IQR(lifeExp)
  )

# 6-7) Najmniejsza, największa i mediana długości życia w Afryce w 1952
africa_1952 <- africa_data %>% 
  filter(year == 1952) %>% 
  summarise(min_life = min(lifeExp), max_life = max(lifeExp), mediana = median(lifeExp))

# 8-10) Azja - min, mediana i 5. percentyl
asia_stats <- gapminder %>% 
  filter(continent == "Asia") %>% 
  summarise(min_life = min(lifeExp), mediana = median(lifeExp), perc_5 = quantile(lifeExp, 0.05))

# 11-12) Rozstęp i średnia w Azji w 2002
asia_2002 <- gapminder %>% 
  filter(continent == "Asia" & year == 2002) %>% 
  summarise(rozstep = max(lifeExp) - min(lifeExp), srednia = mean(lifeExp))

# 13) Zakres lifeExp w Azji 2002 przy PKB > 25000
asia_rich_2002 <- gapminder %>% 
  filter(continent == "Asia" & year == 2002 & gdpPercap > 25000) %>% 
  summarise(zakres_min = min(lifeExp), zakres_max = max(lifeExp))

# 14) Zakres oczekiwanej długości życia w Polsce
poland_life_range <- gapminder %>% 
  filter(country == "Poland") %>% 
  summarise(min_life = min(lifeExp), max_life = max(lifeExp))

# 15) O ile wzrosło PKB w Polsce w latach 1952-2007?
poland_gdp_growth <- gapminder %>% 
  filter(country == "Poland" & year %in% c(1952, 2007)) %>% 
  arrange(year) %>% 
  summarise(wzrost_pkb = diff(gdpPercap))


# ------------------------------------------------------------------------

# Zadanie końcowe
# Łączymy loty z danymi o lotniskach (airports), aby mieć nazwy i współrzędne
flights_full <- flights %>% 
  left_join(airports, by = c("dest" = "faa"))

# 1. Nazwa lotniska, do którego przyleciało najwięcej samolotów w ciągu roku
top_airport <- flights_full %>% 
  count(name) %>% 
  arrange(desc(n)) %>% 
  slice(1)

# 2. Ilość i sumaryczny czas opóźnień dla lotniska o współrzędnych 32.5N 85.7E
# W bazie współrzędne mogą się różnić, filtrujemy dokładnie wg polecenia
coords_delays <- flights_full %>% 
  filter(lat == 32.5 & lon == 85.7) %>% 
  summarise(ilosc = n(), suma_opoznien = sum(arr_delay + dep_delay, na.rm = TRUE))

# 3. Średnia liczba i sumaryczny czas opóźnień dla każdego lotniska w maju
may_delays <- flights_full %>% 
  filter(month == 5) %>% 
  group_by(name) %>% 
  summarise(
    avg_flights = n(), 
    total_delay_time = sum(arr_delay + dep_delay, na.rm = TRUE)
  )

# 4. Odchylenie standardowe dla opóźnień na lotnisku "Finger Lakes Regional Airport"
# SD określa zmienność/rozrzut opóźnień. Małe SD = stabilne opóźnienia, duże = duża nieprzewidywalność
finger_lakes_sd <- flights_full %>% 
  filter(name == "Finger Lakes Regional Airport") %>% 
  group_by(month) %>% 
  summarise(sd_arr = sd(arr_delay, na.rm = TRUE), sd_dep = sd(dep_delay, na.rm = TRUE))