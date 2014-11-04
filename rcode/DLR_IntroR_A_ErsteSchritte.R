##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 05.11.2014
#
# Erste Schritte
#
##################################


#Grundrechenarten

1+1
2-1
2*2
4/2


#Mathematische Funktionen

log(4)
log(4,base=2)
exp(4)
sqrt(4)
2^4


#------------------------------------------------------------#
# Modularer Aufbau - Bibliotheken
#------------------------------------------------------------#

# so installiert man eine Bibliothek
install.packages("lme4")

# so lädt man eine Bibliothek
library(lme4)

#------------------------------------------------------------#
# Wie bekommt man Hilfe
#------------------------------------------------------------#

help.start()

# Die Funktion help:
help(lm)
help(lapply)

help(package = "splines")

# Grundsätzlich mit dem Befehl ?

# Beispiele bekommt man so:

example(lm)

#------------------------------------------------------------#
# Vektoren und Zuweisungen
#------------------------------------------------------------#

# <- ist der Zuweisungsoperator
b <- c(1,2)

# den Mittelwert berechnen
mean(b)
length(b)

str(b)

# Das Maximum:
max(b)

# Minimum
min(b)

# Standardabweichung
sd(b)

# Varianz
var(b)

# Mittelwert
mean(b)

# Median
median(b)

# Das Ergebnis kann wieder einem Objekt zugewiesen werden
med_b <- median(b)

#####
# Funktionen mit mehr Argumenten

d <- c(1,4,3,7,9,5,4,3)


# Quantil berechnen:
quantile(d,0.9)


# hier werden 2 Elemente aus d gezogen
sample(x=d,size=2,replace=FALSE)

# jedes Mal können andere Ergebnisse resultieren

# hier wird nur ein Element gezogen
sample(x=d,size=1,replace=FALSE)

# auch dieses Ergebnis kann wieder in einem Element
# gespeichert werden

stichA <- sample(x=d,size=1,replace=FALSE)

# Das Argument replace gibt an, ob eine Stichprobe mit
# oder ohne zurücklegen gezogen wird

#------------------------------------------------------------#
# Verschiedene Datentypen
#------------------------------------------------------------#

A <- c(5,4,3)
is.numeric(A)
str(A)

B <- c(T,F,T,T)
is.logical(B)
str(B)

C <- c("AB","F","23")
is.logical(C)
str(C)

# immer das niedrigste 
# Niveau wird genommen

D <- c(1,3,"A")
str(D)

b <- c(1,2)
log <- c(T,F)
char <- c("A","b")

# Faktoren sind eine spezielle Form,
# vor allem bei Regression hilfreich

fac <- as.factor(c(1,2))

# mit as... kann man also umwandeln

as.character(b)
# wenn man das nicht in Objekt speichert
# merkt es es sich R auch nicht

b


b <- c(1,2) # numeric
log <- c(T,F) # logical
char <-c("A","b") # character
fac <- as.factor(c(1,2)) # factor

#------------------------------------------------------------#
# Indizieren
#------------------------------------------------------------#

####
# vector

A1 <- c(1,2,3,4)
A1
A1[1]
A1[4]
A1[1:3]
A1[-4]

####
# dataframe

# Beispieldaten generieren:
AGE <- c(20,35,48,12)
SEX <- c("m","w","w","m")

# Diese beiden Vektoren zu einem data.frame verbinden:
Daten <- data.frame(Alter=AGE,Geschlecht=SEX)

# Anzahl der Zeilen/Spalten herausfinden

nrow(Daten) # Zeilen
ncol(Daten) # Spalten

AA <- 4:1
A2 <- cbind(A1,AA)
A2[1,1]
A2[2,]
A2[,1]
A2[,1:2]

####
# Matrizen und Arrays

A <- matrix(seq(1,100), nrow = 4)
dim(A)

A3 <- array(1:8,c(2,2,2))
A3
A3[,,2]

####
# Liste

A4 <- list(A1,1)
A4
A4[[2]]

#------------------------------------------------------------#
# Logische Operatoren
#------------------------------------------------------------#

# Ist 1 größer als 2?
1>2
1<2

1==2

# Diese Operatoren eignen sich gut 
# um Datensätze einzuschränken

Daten
Daten[AGE>20,]
Daten[SEX=="w",]

# gleiches Ergebnis:
Daten[SEX!="m",]

# Ergebnis in ein Objekt speichern
subDat <- Daten[AGE>20,]

# mehrere Bedingeungen können mit
# & verknüpft werden:

Daten[AGE>18 & SEX=="w",]

#------------------------------------------------------------#
# Sequenzen
#------------------------------------------------------------#


# Sequenz von 1 bis 10
1:10

seq(-2,8,by=1.5)

a<-seq(3,12,length=12)

b<- seq(to=5,length=12,by=0.2)

d <-1:10
d<- seq(1,10,1)
d <- seq(length=10,from=1,by=1)

# wiederhole 1 10 mal
rep(1,10)
rep("A",10)


#------------------------------------------------------------#
# Der Befehl paste
#------------------------------------------------------------#

?paste
paste(1:4)
paste("A", 1:6, sep = "")

