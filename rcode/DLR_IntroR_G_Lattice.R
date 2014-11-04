#------------------------------------------------------------#
# Einführung in R
# Jan-Philipp Kolb
# 
# Lattice Graphics
#
# 29.04.2014
#------------------------------------------------------------#


#------------------------------------------------------------#
# General Information
#------------------------------------------------------------#

scriptname <- "IntroR_E_latticeGraphics.R"
author <- "Jan-Philipp Kolb"

#------------------------------------------------------------#
# Pfade angeben
#------------------------------------------------------------#

graph.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopEinfuehrungR/Folien/figure"

#------------------------------------------------------------#
# Bibliotheken
#------------------------------------------------------------#

library(lattice)


#------------------------------------------------------------#
# Histogram
#------------------------------------------------------------#

data(Chem97, package = "mlmRev")


setwd(graph.path)
png("IntroR_histogram_gcsescore.png")
histogram(~ gcsescore, data = Chem97)
dev.off()

png("IntroR_histogram_gcsescore2.png")
  histogram(~ gcsescore | factor(score), data = Chem97)
dev.off()


#------------------------------------------------------------#
# Densityplot
#------------------------------------------------------------#

png("IntroR_densityplot_gcsescore.png")
densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
            plot.points = FALSE, auto.key = TRUE)
dev.off()


#------------------------------------------------------------#
# Boxplot
#------------------------------------------------------------#

png("IntroR_bwplot_Chem97.png")

bwplot(factor(score) ~ gcsescore | gender, Chem97)
dev.off()


png("IntroR_bwplot_Chem97B.png")

bwplot(gcsescore ~ gender | factor(score), Chem97, layout = c(6, 1))
dev.off()



#------------------------------------------------------------#
# qq
#------------------------------------------------------------#



qq(gender ~ gcsescore | factor(score), Chem97,
   f.value = ppoints(100), type = c("p", "g"), aspect = 1)

#------------------------------------------------------------#
# qqmath
#------------------------------------------------------------#


qqmath(~ gcsescore | factor(score), Chem97, groups = gender,
       f.value = ppoints(100), auto.key = list(columns = 2),
       type = c("p", "g"), aspect = "xy")


#------------------------------------------------------------#
# Links
#------------------------------------------------------------#

# http://www.isid.ac.in/~deepayan/R-tutorials/labs/04_lattice_lab.pdf
