# 1. OPERATORY ARYTMETYCZNE

# Podstawowe dzialania na liczbach
x <- 4
y <- 6

cat("Suma:", x + y, "\n")
cat("Potega (4^2):", x^2, "\n")
cat("Reszta z dzielenia (modulo):", x %% y, "\n")
cat("Czesc calkowita z dzielenia:", x %/% y, "\n")

# Operacje na liczbach zespolonych
# Definicja a = 1+4i oraz b = -3-4i
a <- complex(real = 1, imaginary = 4)
b <- complex(real = -3, imaginary = -4)

# Dzialania na liczbach zespolonych
suma_z <- a + b
roznica_z <- a - b
iloczyn_z <- a * b
iloraz_z <- a / b

# Wlasnosci liczb zespolonych
re_a <- Re(a)      # czesc rzeczywista
im_a <- Im(a)      # czesc urojona
mod_a <- Mod(a)    # modul (wartosc bezwzgledna)
conj_a <- Conj(a)  # sprzezenie


# 2. OPERATORY LOGICZNE

# Dane wejsciowe (wektory logiczne)
lubie.matematyke <- c(ala = FALSE, ola = TRUE, ewa = TRUE)
lubie.prowadzacego <- c(ala = TRUE, ola = TRUE, ewa = FALSE)

# Koniunkcja (AND)
# & sprawdza kazdy element oddzielnie
and_elementy <- lubie.matematyke & lubie.prowadzacego 

# && sprawdza tylko pierwszy element (leniwe wartosciowanie)
and_warunek <- lubie.matematyke && lubie.prowadzacego

# Alternatywa (OR)
# | sprawdza kazdy element
or_elementy <- lubie.matematyke | lubie.prowadzacego

# || sprawdza tylko pierwszy element
or_warunek <- lubie.matematyke || lubie.prowadzacego

# Funkcje any i all
czy_ktokolwiek <- any(lubie.matematyke) 
czy_wszyscy <- all(lubie.matematyke)    


# 3. OPERATORY RELACYJNE

# Porownywanie liczb
val1 <- 1.745004
val2 <- 1.570796

czy_rowne <- val1 == val2
czy_rozne <- val1 != val2
czy_wieksze <- val1 > val2

# Porownywanie lancuchow znakow
g <- "Gosia"
h <- "Ala"
string_test <- g == h  

# Obsluga bledu zaokraglenia (precyzja)
# Zamiast == dla ulamkow warto uzyc all.equal
liczba_a <- sqrt(2)^2
liczba_b <- 2

# Bezposrednie == moze dac FALSE przez blad reprezentacji
rowne_precyzyjne <- isTRUE(all.equal(liczba_a, liczba_b))