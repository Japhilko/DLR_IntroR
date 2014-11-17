##########################################
# Einführung in die Datenanalyse mit R
# am DLR in Berlin
# Jan-Philipp Kolb
# 
# Regression
#
# 07.11.2014
##########################################

install.packages("DAAG")
library(DAAG)
data(roller)

ls()
head(roller)
roller

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

stargazer(mod1)


AGE <- as.numeric(MIDPERS$hp_alter)


Dichte <- density(MIDPERS$anzkm,na.rm=T)

plot(Dichte)

anz <- length(table(MIDPERS$hp_sex))
Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,function(x)x)
plot(density(Erg[[1]],na.rm=T))
for (i in 1:2){
  points(density(Erg[[i]],na.rm=T),col=i,type="l")  
}

anz <- length(table(MIDPERS$hp_sex))
Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,
              function(x)density(x,na.rm=T))
plot(Erg[[1]])

for (i in 1:2){
  points(Erg[[i]],col=i,type="l")  
}




Erg <- tapply(MIDPERS$anzkm,MIDPERS$hp_sex,function(x)x)
hist(Erg[[1]],na.rm=T,breaks=20)
for (i in 1:length(anz)){
  points(density(Erg[[i]],na.rm=T),col=i,type="l")  
}


install.packages("DAAG")
library(DAAG)
