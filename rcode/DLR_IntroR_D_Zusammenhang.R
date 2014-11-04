##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 07.11.2014
#
# Zusammenhangsmaße
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

library(foreign)
library(vcd)

library(visreg)
library(datasets)
library(AER)


#------------------------------------------------------------#
# Daten einlesen
#------------------------------------------------------------#


setwd(SPSS.path)


midpers <- read.spss("MiD2008_PUF_Personen.sav",
                     to.data.frame=T, 
                     use.value.labels=F)


#------------------------------------------------------------#
# Einen ersten Überblick bekommen
#------------------------------------------------------------#

head(iris)

cor(iris$Sepal.Length,iris$Sepal.Width)

cor(iris$Sepal.Length,iris$Petal.Length)

setwd(graph.path)
png("IntroR_plot_iris.png")
  plot(iris$Sepal.Length,iris$Petal.Length)
dev.off()

png("IntroR_plot_iris2.png")
  plot(iris$Sepal.Length,iris$Petal.Length,pch=20,col="royalblue",
       xlab="Länge Kelchblatt",ylab="Länge Blütenblatt")
dev.off()

  # Wenn der Zusammenhang zwischen mehreren Variablen angeschaut werden soll:

pairs(iris[,1:4])

setwd(graph.path)
png("IntroR_pairs_iris.png")
  pairs(iris[,1:4])
dev.off()

pairs(iris[,1:4], main = "Anderson's Iris Data -- 3 species",
      pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)])

#------------------------------------------------------------#
# Zusammenhang zwischen stetigen Variablen
#------------------------------------------------------------#

  # Eine weitere schöne Funktion
?pairs.panels

png("IntroR_pairspanels_iris.png")
  pairs.panels(iris[1:4],bg=c("red","yellow","blue")[iris$Species],
             pch=21,main="Iris Datensatz")
dev.off()



cor(iris[,1:4])
cor(iris[,1:4], method = "kendall")
cor(longley, method = "spearman") 

#------------------------------------------------------------#
# Zusammenhang zwischen kategorialen Variablen
#------------------------------------------------------------#


?chisq.test

M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("M","F"),
                    party = c("Democrat","Independent", "Republican"))
(Xsq <- chisq.test(M))  # Prints test summary
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null
Xsq$residuals  # Pearson residuals
Xsq$stdres     # standardized residuals



data(BankWages)

levelplot(table(BankWages$education,BankWages$job))


#------------------------------------------------------------#
# Mosaikplot
#------------------------------------------------------------#


Pgew <- midpers2$p_gew
sex <- midpers2$hp_sex
sex[sex==9] <- NA
sex <- as.character(sex)
mob <- midpers2$mobil
mob[mob==9] <- NA

Tab1 <- tapply(Pgew,list(sex,mob),sum)
Tab1[is.na(Tab1)] <- 0
mosaicplot(Tab1)

mosaicplot(Tab1,shade=T)


setwd(graph.path)
png("DLR_mosaic_Tab1.png")
mosaicplot(Tab1,shade=T,main="",xlab="",
           ylab="")
dev.off()


#------------------------------------------------------------#
# Links
#------------------------------------------------------------#

# http://de.wikipedia.org/wiki/Portal:Statistik/Datensaetze#ALLBUS