##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 05.11.2014
#
# Daten einlesen
#
##################################

#-----------------------------#
# Bibliotheken einlesen
#-----------------------------#

library(foreign)
library(xlsx)

#-----------------------------#
# Pfade definieren
#-----------------------------#

main.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/"

data.path <- paste(main.path,"data/",sep="")

SPSS.path <- paste(data.path,"SPSS/SPSS_Public Use File",sep="")

stata.path <- paste(data.path,"STATA/STATA_Public Use File/",sep="")

#-----------------------------#
# Daten einlesen
#-----------------------------#

setwd(SPSS.path)

midcar2 <- read.spss("MiD2008_PUF_Auto.sav", to.data.frame = T, use.value.labels =T)

midcar <- read.spss("MiD2008_PUF_Auto.sav", 
                    to.data.frame = T, 
                    use.value.labels =F)

midway <- read.spss("MiD2008_PUF_Wege.sav",
                    to.data.frame = T, 
                    use.value.labels =F)


midpers <- read.spss("MiD2008_PUF_Personen.sav",
                     to.data.frame=T, 
                     use.value.labels=F)

midpers2 <- read.spss("MiD2008_PUF_Personen.sav",to.data.frame=T, use.value.labels =T)

  # Ein voellig anderer Datensatz
sample <- read.csv("http://www.ats.ucla.edu/stat/examples/ara/angell.txt")


write.xlsx(sample,"sample.xlsx")

sample2 <- read.xlsx("sample.xlsx",1)

setwd(stata.path)

midpers <- read.dta("MiD2008_PUF_Personen.dta")

#-----------------------------#
# Datenmanagement wie in SPSS oder Stata
#-----------------------------#

install.packages("Rz")
library(Rz)


#-----------------------------#
# Daten sichern
#-----------------------------#

write.table(sample,file="sample.txt",
            sep="\t", na="", dec=",", row.names=FALSE)


write.dta(sample,file="sample.dta")

write.foreign(sample, "sample.txt", "sample.sps",   package="SPSS") 

save.image("Day01.RData")

save(midpers,file="midpers.RData")

#-----------------------------#
# Erste Analysen
#-----------------------------#

####
# Mittelwert

mean(midpers$wege3)

mean(midpers$wege3,na.rm=T)

mean(midpers$wege3*midpers$p_gew,na.rm=T)

####
# Mittelwert für Filter


mobilTrue <- MIDPERS[MIDPERS$mobil=="mobil",]
mean(mobilTrue$wege3*mobilTrue$p_gew , na.rm=T)

# anzkm: Tagesstrecke [km] (Summe wegkm_k)
mean(mobilTrue$anzkm*mobilTrue$p_gew, na.rm=T)

# anzmin Unterwegszeit [min] (Summe wegmin_k)
mean(mobilTrue$anzmin, na.rm=T)


####
# Varianz


?var
var(midpers$wege3)
var(midpers$wege3, na.rm=TRUE)

####
# Häufigkeitstabellen

table(midpers$mobil)

with(table(mobil))

table(midpers$mobil,midpers$hp_sex)

####
# relative Häufigkeiten


table(midpers$mobil)
?prop.table
prop.table(table(midpers$mobil))

#-----------------------------#
# Die apply Familie
#-----------------------------#

####
# apply

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
x

apply(x, 2, mean)
apply(x, 1, mean)


####
# tapply


with(midpers,tapply(p_gew,list(hp_sex,mobil),sum))


Pgew <- midpers$p_gew
sex <- midpers$hp_sex
sex[sex==9] <- NA
mob <- midpers$mobil
mob[mob==9] <- NA

Tab1 <- tapply(Pgew,list(sex,mob),sum)

apply(Tab1,1,prop.table)


attach(midway)
tempo=wegkm_k/(wegmin_k/60)

tempo=round(tempo/100,digits=2)/100


min(tempo,na.rm=T)

tempo[tempo<.5]<- .5
min(tempo,na.rm=T)

  # mehrere Bedingungen

tempo[w05_1==1 & tempo>20] <- NA


