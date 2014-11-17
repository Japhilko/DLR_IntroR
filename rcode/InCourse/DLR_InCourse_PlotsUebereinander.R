#------------------------------------------------------------#
# Einführung in R
# Jan-Philipp Kolb
# 
# Verschiedene Plots übereinander
#
# 07.11.2014
#------------------------------------------------------------#

#-----------------------------#
# Bibliotheken einlesen
#-----------------------------#

library(foreign)

#-----------------------------#
# Pfade definieren
#-----------------------------#


main.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/"

data.path <- paste(main.path,"data/",sep="")

SPSS.path <- paste(data.path,"SPSS/SPSS_Public Use File",sep="")

SPSS.path <- "C:/Forschung/Workshops/WorkshopIntroBerlin/data/SPSS/SPSS_Public Use File"


#-----------------------------#
# Daten einlesen
#-----------------------------#

setwd(SPSS.path)
MIDPERS <- read.spss("MiD2008_PUF_Personen.sav",
                     to.data.frame=T, 
                     use.value.labels=F)


#-----------------------------#
# Dichte berehnen - getrennt nach Geschlecht
#-----------------------------#


AGE <- as.numeric(MIDPERS$hp_alter)

Dichte <- density(MIDPERS$anzkm,na.rm=T)

plot(Dichte)

anz <- length(table(MIDPERS$hp_sex))
Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,function(x)x)
plot(density(Erg[[1]],na.rm=T),xlim=c(0,100))
for (i in 1:2){
  points(density(Erg[[i]],na.rm=T),col=i,type="l")  
}

#-----------------------------#
# Weiterer Weg die Dichte zu plotten
#-----------------------------#


anz <- length(table(MIDPERS$hp_sex))
Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,
              function(x)density(x,na.rm=T))

plot(Erg[[1]])

for (i in 1:2){
  points(Erg[[i]],col=i,type="l")  
}

#-----------------------------#
# Zwei Barplots übereinander
#-----------------------------#

Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,function(x)x)
hist(Erg[[1]],na.rm=T,breaks=20,prob=T)
points(density(Erg[[1]],na.rm=T),type="l",col="red")


TabAB <- table(MIDPERS$hp_beruf,MIDPERS$bland)

barplot(TabAB[2,],col=rgb(0,1,0,.2))
barplot(TabAB[1,],col=rgb(0,0,1,.2),add=T)

plot(TabAB[2,],type="l")
plot(TabAB[1,],type="l",add=T)
