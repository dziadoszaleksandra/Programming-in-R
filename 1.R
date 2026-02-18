#ZADANIE FUNKCJE 
#Zadanie 1
#1. Napisz funkcję do obliczania delty funkcji kwadratowej oraz wierzchołka. Wypisz je na ekranie.

parabola<-function(a,b,c)
{
  delta<-b^2- 4*a*c
  p<- -b/(2*a)
  q<- -delta/(4*a)
  
  return(list(delta,p,q))
}

parabola(1,2,1)


#Zadanie 2
# 2. Napisz funkcję do obliczenia średniej ważonej z 2 liczb, jako argumenty podać: 2 liczby oraz 2 wagi. 
Wypisz wynik.

mean1<-function(n1,n2,w1,w2)
{
  res<-(n1*w1+n2*w2)/ (w1+w2)
  return(res)
}

mean1(5,4,1,2)


#Zadanie 3
#3. Napisz funkcję do obliczenia średniej oraz sumy z 2 liczb. Wyświetl wynik.

fun3<- function(a,b)
{
  sum<- a+b
  mean2<- (a+b)/2
  return(list(sum,mean2))
}
fun3(4,5)

#Zadanie 4
#4. Stwórz funkcje obliczającą wartość funkcji liniowej w punkcie x o podanych parametrach a,b , a następnie wyświetl wprowadzoną funkcje. Wyświetl funkcję z wartościami domyślnymi oraz z 
#wartościami x = 1, a = 2, b= 3.

fun4<-function(x,a,b)
{
  y<- a*x+b
  cat("f(x) =", a, "* x +", b, "\n")
  cat("f(", x, ") =", y, "\n")
  return(y)
}

fun4(1,2,3)



#ZADANIE PETLE
# Analiza stanów USA

# 1. Instalujemy i wczytujemy pakiet MASS
install.packages("MASS")  

# Wczytujemy dane o 50 stanach USA
data(state)

# Oglądamy pierwsze wiersze tabeli
head(state.x77)



# 2. Sprawdzamy typ danych:

# Sprawdzamy klasę (typ) danych
class(state.x77)

# Sprawdzamy strukturę danych (ile kolumn, jakie typy)
str(state.x77)

# Krótkie podsumowanie liczbowe
summary(state.x77)




# 3. Statystyki ogólne:

# Średnie, min, max itp.
summary(state.x77)

# Odchylenie standardowe dla każdej kolumny
apply(state.x77, 2, sd)

# Wariancja
apply(state.x77, 2, var)



# 4. Dwa nowe obiekty ze statystykami

# Pierwszy obiekt ze średnią i odchyleniem standardowym
stat1 <- data.frame(
  Srednia = apply(state.x77, 2, mean),
  Odchylenie = apply(state.x77, 2, sd)
)
print("Średnie i odchylenie standardowe:")
print(stat1)

# Drugi obiekt z minimum, medianą i maksimum
stat2 <- data.frame(
  Minimum = apply(state.x77, 2, min),
  Mediana = apply(state.x77, 2, median),
  Maksimum = apply(state.x77, 2, max)
)
print("Minimum, mediana, maksimum:")
print(stat2)



# 5. Gęstość zaludnienia (Population / Area)

# Obliczamy gęstość populacji (ludzie na km2)
gestosc <- state.x77[, "Population"] / state.x77[, "Area"]

# Zaokrąglamy wyniki
gestosc <- round(gestosc, 2)

# Nadajemy nazwy stanów
names(gestosc) <- rownames(state.x77)

# Wyświetlamy kilka pierwszych wyników
print("Gęstość zaludnienia (pierwsze 6 stanów):")
print(head(gestosc))

# Dodajemy gęstość do danych
state_data <- as.data.frame(state.x77)
state_data$Gestosc <- gestosc




# 6. Populacja według regionów

# Sprawdzamy populację w podziale na regiony (min, mediana, max)
wyniki_regiony <- aggregate(state.x77[, "Population"], 
                            by = list(Region = state.region),
                            FUN = function(x) c(Min = min(x), Mediana = median(x), Max = max(x)))

print("Populacja w podziale na regiony:")
print(wyniki_regiony)




# 7. Tworzymy listę z dwóch elementów:

# Pierwszy element to liczby od 1 do 10
wektor1 <- 1:10

# Drugi element to pierwsze 5 potęg liczby 2: 2^1, 2^2, ..., 2^5
wektor2 <- 2^(1:5)

# Tworzymy listę z tych dwóch wektorów
moja_lista <- list(liczby_1_do_10 = wektor1, potegi_2 = wektor2)

# Wyświetlamy listę
print("Zawartość listy:")
print(moja_lista)

# Obliczamy średnią dla każdego elementu listy
srednie <- lapply(moja_lista, mean)

# Wyświetlamy średnie
print("Średnie dla każdego elementu listy:")
print(srednie)



# 8. Pętla, która wypisuje zdanie 100 razy
for (i in 1:100) {
  cat("R jest najlepszy!\n")
}



# 9. Pętla losująca 10 kuponów totolotka

for (i in 1:10) {
  kupon <- sample(1:49, 6)  # losuje 6 różnych liczb od 1 do 49
  print(paste("Kupon", i, ":", paste(kupon, collapse = " ")))
}



# 10. Pętla z konkretnymi wartościami zmiennej i

for (i in c(3.5, 5, 20)) {
  print(paste("Aktualna wartość i to:", i))
}




