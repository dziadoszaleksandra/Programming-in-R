library(stringr)

# 1. FUNKCJE WBUDOWANE 

# Definicja wektora testowego
n <- c("ibm", "asus", "acer", "microsoft", "lenovo", "msi", "dell")

# Podstawowe operacje
detect_a <- str_detect(n, "a")        # Czy zawiera 'a'
which_a <- str_which(n, "a")          # Indeksy elementow z 'a'
count_a <- str_count(n, "a")          # Ile razy wystepuje 'a'
sub_text <- str_sub(n, start = 1, end = 2) # Wycinanie fragmentow
subset_a <- str_subset(n, "a")        # Elementy zawierajace 'a'
upper_n <- str_to_upper(n)            # Zamiana na wielkie litery
sorted_n <- str_sort(n)               # Sortowanie alfabetyczne



# 2. CWICZENIE DODATKOWE (Tekst Wladyslawa Orkana)

# Zad 1: Kazdy akapit jako oddzielny wektor
akapit1 <- "Naprzeciw Tatr, między doliną Nowotarską, a wężowatą kotliną Raby, wspięło się gniazdo dzikich Gorców. Od romantycznych Pienin odciął je wartki Kamienicki potok, a od spiskiej krainy odgraniczył je falami bystry Dunajec."

akapit2 <- "Samotnie stoją nad wzgórzami. A wyżej jeszcze nosi głowę ociec ich rodu, zasępiony Turbacz. Niewiadomo, kto go chrzcił i skąd mu to miano. Może stąd, że turbanem mgły przed deszczem owija łysą głowę, albo raczej, że widywano go zawsze w turbacyi wiecznej. Podle się z nim losy zaobeszły, dając mu zwykłą dumę wierchów i nadszczytów, a nie dając ich wielkości nadchmurnej. Otoczyły go jeszcze tłumem bliźniąt, wśród których maleje doznaku i zdaje się być zwykłą górą. A przecież coś mu się śni, że przed potopem inaczej było – coś mu się śni..."

akapit3 <- "Z zazdrością patrzy, jak w słoneczne południe garbaty Krywań do Łomnicy się śmieje, a ona, zalotnica, rada go widzi. Daremnie się podnosi, by jej spojrzeć w oczy - ona hań grzeje czoło wysoko... Z zazdrości też umizga się o zachodzie słońca do Babiej Góry. Widzi, jak opuszczona wdowa płoni się i czerwienieje i radaby się przychylić ku niemu, gdyby nie patrzeli na nią ze wszystkich stron."

akapit4 <- "Stary Turbacz mści się za małość swoją na wierchach Tatr, zasłaniając im czołem widok na Wawelskie grodzisko. Zazdrosnem uchem łowi grające dźwięki Zygmunta i zasępią się w przeszłości dalekiej. Coś mu się śni, że drzewiej dzwony inaczej grały – coś mu się śni..."

# Zad 2: Sprawdz ile razy wystepuje litera 'ą'
caly_tekst <- c(akapit1, akapit2, akapit3, akapit4)
count_a_ogon <- str_count(caly_tekst, "ą")

# Zad 3: Ile razy wystepuje fragment 'turb' (case insensitive)
count_turb <- sum(str_count(str_to_lower(caly_tekst), "turb"))

# Zad 4: Nazwy geograficzne wielkimi literami
# Tworzymy liste nazw do podmiany
geo_names <- c("Tatr", "Nowotarską", "Raby", "Gorców", "Pienin", "Dunajec", 
               "Turbacz", "Krywań", "Łomnicy", "Babiej Góry", "Wawelskie")

# Funkcja do masowej zmiany na wielkie litery
akapit1_upper <- str_replace_all(akapit1, fixed("Tatr"), "TATR")
# Mozna tez uzyc petli lub mapowania dla wszystkich nazw:
tekst_v2 <- str_replace_all(caly_tekst, "Tatry|Turbacz|Dunajec|Krywań|Łomnica", str_to_upper)

# Zad 5: Zamien wyrazy staropolskie (hań -> tam, drzewiej -> dawniej)
akapit3_clean <- str_replace(akapit3, "hań", "tam")
akapit4_clean <- str_replace(akapit4, "drzewiej", "dawniej")

# Wyniki dla akapitu 4 po zmianach
print(akapit4_clean)