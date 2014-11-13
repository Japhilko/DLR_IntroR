#------------------------------------------------------------#
# Einführung in R
# Jan-Philipp Kolb
# 
# Speichermanagement
#
# 07.11.2014
#------------------------------------------------------------#

#------------------------------------------------------------#
# Bibliotheken
#------------------------------------------------------------#

library(foreign)


#------------------------------------------------------------#
# Pfad angeben
#------------------------------------------------------------#

# main.path <- "C:/Forschung/Workshops/WorkshopIntroBerlin/data/SPSS/SPSS_Public Use File"
main.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/data"

#------------------------------------------------------------#
# Beispieldaten erzeugen
#------------------------------------------------------------#

a <- runif(100)
b <- rnorm(100)

ab <- cbind(a,b)

#------------------------------------------------------------#
# Das komplette Abbild des Workspace speichern
#------------------------------------------------------------#

# Hier wird alles gespeichert was auch mit ls() sichtbar wird
ls()

setwd(main.path)
save.image("WOrkshop.RData")

  # einzelne Objekte aus dem Workspace löschen
rm(a)


  # so kann man den gesamten Workspace löschen
rm(list=ls())

  # Um zu sehen, was sich im Arbeitsverzeichnis befindet:
dir()

  # Abgespeicherten Workspace wieder einlesen:
load("WOrkshop.RData")
ls()

#------------------------------------------------------------#
# Einzelne Dateien speichern
#------------------------------------------------------------#

  # Dateien als csv abspeichern:
write.csv(ab,file="ab.csv")

  # Um stata Dateien zu speichern:
?write.dta

  # Um SPSS Dateien zu speichern
?write.foreign


  # Um RData-Objekte zu erzeugen:
attr(ab,"info2") <- paste(date(),"Jan-Philipp Kolb")
attr(ab,"info2") <- c(paste(date(),"Jan-Philipp Kolb"),"Hallo")

x<- 1:10
attr(x,"Info") <- "Name 07.11.14.R"
attr(x,"Projektname") <- "DLR"

attr(x,"Projektname")
attr(x,"Info")
attr(x,"Info")

  # so können die Attribute wieder aufgerufen werden:
attributes(x)

  # Die Informationen können bei anderen Objekten gespeichert werden:
y <- 10:1
m1 <- lm(y~x)
attr(m1,"Info") <- "was auch immer"
attr(m1,"Info")


  # Dateien abspeichern:
save(a,file="a.RData")

  # Das Einlesen funktioniert dann auch wieder mit load():
load("a.RData")

  # Es ist auch hier möglich mehrere Objekte gleichzeitig zu speichern:

save(a,b,file="a_und_b.RData")



