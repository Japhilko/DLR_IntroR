##########################################
# Einführung in die Datenanalyse mit R
# am DLR in Berlin
# Jan-Philipp Kolb
# 
# Regression
#
# 07.11.2014
##########################################

#-----------------------------#
# Pakete installieren und laden
#-----------------------------#

install.packages("DAAG")
library(DAAG)
library(stargazer)

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
# Daten anschauen
#-----------------------------#

data(roller)

ls()
head(roller)
roller

#-----------------------------#
# Regression durchführen
#-----------------------------#

mod1 <- lm(depression ~ weight  ,data=roller)
summary(mod1)

plot(mod1)
?plot.lm

mod2 <- lm(as.numeric(hheink)~hp_sex , data = MIDPERS)
summary(mod2)


mod3 <- lm(as.numeric(hheink)~hp_sex:bland , data = MIDPERS)
summary(mod3)


names(mod1)

mod1$coefficients

#-----------------------------#
# LaTeX-Tabelle Regressionsergebnis
#-----------------------------#


stargazer(mod1)

