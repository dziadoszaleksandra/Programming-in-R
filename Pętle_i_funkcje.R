# 1. FUNKCJE

# Zad: Srednia z wektora (manualnie sum/length)
mymean <- function(x) {
  suma <- sum(x)
  ilosc <- length(x)
  return(suma / ilosc)
}

# Zad: Srednia z 2 liczb
mean_2_numbers <- function(num1, num2) {
  res <- (num1 + num2) / 2
  return(res)
}

# Zad: Potega 2 i 3 stopnia (zwracanie listy)
count_pow <- function(a) {
  p2 <- a^2
  p3 <- a^3
  return(list(potega2 = p2, potega3 = p3))
}

# Zad 1 : Delta i wierzcholek funkcji kwadratowej
calc_quadratic <- function(a, b, c) {
  delta <- b^2 - (4 * a * c)
  p <- -b / (2 * a)
  q <- -delta / (4 * a)
  
  # Wypisanie wynikow na ekran
  cat("Delta:", delta, "\n")
  cat("Wierzcholek (p, q): (", p, ",", q, ")\n")
}

# Zad 2 : Srednia wazona
weighted_mean_custom <- function(values, weights) {
  if (length(values) != length(weights)) {
    stop("Wektory musza miec te sama dlugosc")
  }
  res <- sum(values * weights) / sum(weights)
  return(res)
}


# 2. PETLE I FUNKCJE APPLY 

# Przygotowanie macierzy do testow (10 wierszy, 3 kolumny)
my_matrix <- matrix(c(1:10, 11:20, 21:30), nrow = 10, ncol = 3)

# Uzycie apply()
# MARGIN = 1 oznacza operacje na wierszach
row_sums <- apply(my_matrix, 1, sum)

# MARGIN = 2 oznacza operacje na kolumnach
col_means <- apply(my_matrix, 2, mean)

# l-apply (zwraca liste) oraz s-apply (zwraca wektor/macierz)
test_list <- list(grupa1 = 1:5, grupa2 = 10:20, grupa3 = 100:105)

list_results <- lapply(test_list, mean)  
vector_results <- sapply(test_list, mean) 

# Przyklad tapply (srednia w grupach)
# Tworzymy wektor danych i wektor czynnikowy (kategorie)
dane_test <- c(10, 15, 12, 50, 55, 60)
grupy_test <- factor(c("A", "A", "A", "B", "B", "B"))
group_means <- tapply(dane_test, grupy_test, mean)


# 3. TESTOWANIE FUNKCJI

# Test kwadratowej: f(x) = 1x^2 + 4x + 1
calc_quadratic(1, 4, 1)

# Test sredniej wazonej: oceny 3, 4, 5 z wagami 1, 2, 3
weighted_mean_custom(c(3, 4, 5), c(1, 2, 3))