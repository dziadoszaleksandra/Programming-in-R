# Zad1: Parzystosc liczby (if-else oraz ifelse) 

# Funkcja weryfikujaca parzystosc na podstawie instrukcji warunkowej 
check_parity <- function(x) {
  if (x %% 2 == 0) {
    print("Even")
  } else {
    print("Odd")
  }
}

# Przyklad wywolania dla pojedynczej liczby
check_parity(8)
check_parity(13)

# Rozwiazanie zorientowane wektorowo przy uzyciu ifelse() 
# Zwraca wektor tej samej dlugosci z przypisanymi etykietami 
test_vector <- 1:10
parity_result <- ifelse(test_vector %% 2 == 0, "Even", "Odd")
print(parity_result)

# Zad2: Podzielnosc przez 3 i reszta

check_divisibility_3 <- function(val) {
  remainder <- val %% 3
  
  if (remainder == 0) {
    cat("Liczba", val, "jest podzielna przez 3. Reszta: 0\n")
  } else {
    cat("Liczba", val, "NIE jest podzielna przez 3. Reszta:", remainder, "\n")
  }
}

# Testowanie podzielnosci
check_divisibility_3(15)
check_divisibility_3(20)