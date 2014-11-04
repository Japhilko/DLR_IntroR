##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 07.11.2014
#
# Graphiken
#
##################################



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

graph.path <- "J:/Work/Statistik/Kolb/Workshops/2014/WorkshopIntroBerlin/Rfolien/figure"

#-----------------------------#
# Daten einlesen
#-----------------------------#

setwd(SPSS.path)

midcar <- read.spss("MiD2008_PUF_Auto.sav", 
                    to.data.frame = T, 
                    use.value.labels =F)

#-----------------------------#
# Einfache Graphiken
#-----------------------------#

attach(midcar)

####
# Histogram

hist(hheink)

setwd(graph.path)
png("mid_hheink.png")
hist(hheink)
dev.off()

png("mid_hheinkB.png")
hist(hheink,breaks=50)
dev.off()

png("mid_hheink2.png")
hist(hheink,col="blue",
     main="MiD Autdatensatz",
     ylab="Häufigkeit",
     xlab="Haushaltseinkommen")
dev.off()

####
# Barplot


tabBland <- table(bland)
barplot(tabBland)


####
# Boxplot

png("boxplot_hheink.png")
boxplot(hheink,
        horizontal=TRUE)
dev.off()

  # gruppierte Boxplots

png("boxplot_hheink_gr.png")
boxplot(hheink~bland)
dev.off()

