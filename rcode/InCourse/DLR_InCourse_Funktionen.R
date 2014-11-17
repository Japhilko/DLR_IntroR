#------------------------------------------------------------#
# Einführung in R
# Jan-Philipp Kolb
# 
# Eigene Funktionen schreiben
#
# 07.11.2014
#------------------------------------------------------------#

#------------------------------------------------------------#
# Funktion definieren
#------------------------------------------------------------#

myfun <- function(x){
  mean(x)
}

#------------------------------------------------------------#
# Beispieldaten erzeugen und anwenden
#------------------------------------------------------------#

N <- 1000
x <- runif(N)

myfun(x)


#------------------------------------------------------------#
# Funktion abspeichern
#------------------------------------------------------------#

dump("myfun",file="myfun.R")

  # und wieder aufrufen
source("myfun.R")

#------------------------------------------------------------#
# Links
#------------------------------------------------------------#


# http://ww2.coastal.edu/kingw/statistics/R-tutorials/functions.html

# http://stackoverflow.com/questions/11055618/how-to-save-a-function-as-new-r-script
