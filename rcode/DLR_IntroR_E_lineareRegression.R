##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 07.11.2014
#
# Lineare Regression
#
##################################

#------------------------------------------------------------#
# Pfade angeben
#------------------------------------------------------------#

main.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/"

graph.path <- paste(main.path,"Rfolien/figure/",sep="")

#------------------------------------------------------------#
# Bibliotheken
#------------------------------------------------------------#

library(lattice)
library(car)
library(DAAG)

#------------------------------------------------------------#
# lineares Modell in R
#------------------------------------------------------------#


data(Prestige)       # DAAG package

?Prestige
  # Datensatz über kanadische Berufe

prestige.lm <- lm(prestige ~ income, data = Prestige)
  
summary(prestige.lm)

  # Falls das Modell ohne Intercept geschätzt werden soll
lm(prestige ~ -1 + income, data = Prestige)


  # Vorhersage mit predict
predict(prestige.lm)

  # Die Residuen bekommt man mit 
resid(prestige.lm)

# Die gefitteten Werte und die Residuen 
# 

data.frame(Prestige, fitted.value=predict(prestige.lm), 
           residual=resid(prestige.lm))


  # Ein Residuenplot
plot(prestige.lm, which = 1)

setwd(graph.path)
png("IntroR_Resplot_prestige.png")
  plot(prestige.lm, which = 1)
dev.off()


  # qqplot
plot(prestige.lm, which = 2, pch=16)


setwd(graph.path)
png("IntroR_qqplot_prestige.png")
plot(prestige.lm, which = 2, pch=16)
dev.off()

  # um die Ergebnisse besser beurteilen zu können kann man den Plot
  # mit anderen Plots vergleichen in denen simulierte Daten dargestellt sind

qreference(residuals(prestige.lm),nrep=8,nrows=2,xlab="")

?qreference

setwd(graph.path)
png("IntroR_qreference_prestige.png")
qreference(residuals(prestige.lm),nrep=8,nrows=2,xlab="")
dev.off()


#------------------------------------------------------------#
# Dummies integrieren
#------------------------------------------------------------#

# http://stat.ethz.ch/~mmarloes/teaching/stat423/handouts/Chapter7.pdf

data(Prestige)

D1 <- (type=="prof")*1
D2 <- (type=="wc")*1

m1 <- lm(prestige~education+income+D1+D2)


#------------------------------------------------------------#
# Links
#------------------------------------------------------------#

# http://maths-people.anu.edu.au/~johnm/r-book/1edn/scripts/reg1.R

