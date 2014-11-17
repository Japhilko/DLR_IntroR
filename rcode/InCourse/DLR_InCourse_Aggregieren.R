##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 07.11.2014
#
# Lag-Funktionen
#
##################################


#-----------------------------#
# Bibliotheken einlesen
#-----------------------------#

library(xtable)

library(foreign)

#-----------------------------#
# Pfade definieren
#-----------------------------#


main.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/"
main.path <- "C:/Forschung/Workshops/WorkshopIntroBerlin/"

graph.path <- paste(main.path,"Rfolien/figure/",sep="")


data.path <- paste(main.path,"data/",sep="")

SPSS.path <- paste(data.path,"SPSS/SPSS_Public Use File",sep="")

#-----------------------------#
# Daten einlesen
#-----------------------------#

setwd(SPSS.path)

# MIDWAY <- read.spss("MiD2008_PUF_Wege.sav",
#                    to.data.frame = T, 
#                    use.value.labels =F)

# save(MIDWAY,file="MIDWAY.RData")

(load("MIDWAY.RData"))


(load("MIDPERS.RData"))

#-----------------------------#
# Analyse der Wegstrecken
#-----------------------------#

MIDWAY$ind1 <- with(MIDWAY,paste(hhid,pid,sep="_"))
MIDWAY$ind2 <- with(MIDWAY,paste(hhid,pid,wid,sep="_"))

  # mittlere Wegelänge einer Person

meanP <- with(MIDWAY,tapply(wegkm_k,ind1,mean))

hist(meanP)

#######################################
#######################################


#-----------------------------#
# Neue Variable erzeugen
#-----------------------------#

widTab  <- with(MIDWAY,tapply(wid,hhid,table))

MIDWAY$w04_neu <- MIDWAY$w04

MIDWAY$ID <- 1:nrow(MIDWAY)
MIDWAY3 <- MIDWAY[MIDWAY$wsid >= 3,]

MIDWAY3$ID[x] <- MIDWAY3$ID[x-1]
match(MIDWAY$ID,MIDWAY3$ID

myfun1 <- function(x){
  MIDWAY3$ID[x] <- MIDWAY3$ID[x-1]
}

ab <-with(MIDWAY3[1:100,],tapply(1:length(w04_neu),w04,myfun1 ))



# IF  (wsid >= 3 & w04_neu = 9) w04_neu=LAG(w04_neu,2).


table(MIDWAY$w04)

sum(MIDWAY$w04==9)

table(MIDWAY$w04_sons[MIDWAY$w04==9])

MIDWAY$wsid>=3 & MIDWAY$w04==9



#-----------------------------#
# Was könnte LAG-Funktion machen
#-----------------------------#

table(MIDWAY$w04_sons[MIDWAY$w04==9])

table(MIDWAY$w04)
table(MIDWAY$w01)
table(MIDWAY$w13)
table(MIDWAY$w044)
table(MIDWAY$w05_1)
table(MIDWAY$w04_sons)

table(MIDWAY$w04_dzw)
