##########################################
# Einführung in die Datenanalyse mit R
# am DLR in Berlin
# Jan-Philipp Kolb
# 
# Reproducible research
#
# 07.11.2014
##########################################

#-----------------------------#
# Bibliotheken einlesen
#-----------------------------#

library(knitr)

library(stargazer)



#-----------------------------#
# Daten anschauen
#-----------------------------#

data(roller)


head(roller)
roller

#-----------------------------#
# Regression durchführen
#-----------------------------#

mod1 <- lm(depression ~ weight  ,data=roller)
summary(mod1)

plot(mod1)
?plot.lm

names(mod1)

mod1$coefficients

#-----------------------------#
# LaTeX-Tabelle Regressionsergebnis
#-----------------------------#

stargazer(mod1)

#-----------------------------#
# Links
#-----------------------------#


# http://journal.r-project.org/archive/2014-1/leeper.pdf

# http://blog.revolutionanalytics.com/2014/10/introducing-minicran.html

# http://www.molecularecologist.com/2013/11/using-github-with-r-and-rstudio/
