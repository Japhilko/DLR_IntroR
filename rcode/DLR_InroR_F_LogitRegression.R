##################################
# DLR Intro Berlin
# Jan-Philipp Kolb
# 07.11.2014
#
# Logistische Regression
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

library(HSAUR)
library(faraway)
library(MASS)
library(brlr)
library(survival)

#------------------------------------------------------------#
# Daten
#------------------------------------------------------------#

data("plasma", package = "HSAUR")

cdplot(ESR ~ fibrinogen, data = plasma)

plasma_glm_1 <- glm(ESR ~ fibrinogen, data = plasma, 
                    family = binomial())

summary(plasma_glm_1)

probitmod <- glm(ESR ~ fibrinogen, data = plasma, 
                 family = binomial(link=probit))


data(gala)

  # Regression mit Zähldaten:
modp <- glm(Species ~ .,family=poisson,gala)

    # Proportional odds logistic regression

house.plr<-polr(Sat~Infl,weights=Freq,data=housing)
#------------------------------------------------------------#
# Weitere Daten einlesen
#------------------------------------------------------------#

data("plasma", package = "HSAUR")

data(orings)

#------------------------------------------------------------#
# Beispiele aus Faraway
#------------------------------------------------------------#

lmod <- lm(damage/6 ~ temp, orings)


plot(damage/6 ~ temp, orings, xlim=c(25,85), ylim = c(0,1), xlab="Temperature", ylab="Prob of damage")
abline(lmod)

logitmod <- glm(cbind(damage,6-damage) ~ temp, family=binomial, orings)
summary(logitmod)

plot(damage/6 ~ temp, orings, xlim=c(25,85), ylim = c(0,1), xlab="Temperature", ylab="Prob of damage")
x <- seq(25,85,1)
lines(x,ilogit(11.6630-0.2162*x))


probitmod <- glm(cbind(damage,6-damage) ~ temp, family=binomial(link=probit), orings)
summary(probitmod)

lines(x,pnorm(5.5915-0.1058*x),lty=2)
ilogit(11.6630-0.2162*31)
pnorm(5.5915-0.1058*31)

pchisq(deviance(logitmod),df.residual(logitmod),lower=FALSE)
pchisq(38.9,22,lower=FALSE)
pchisq(38.9-16.9,1,lower=FALSE)
c(-0.2162-1.96*0.0532,-0.2162+1.96*0.0532)




confint(logitmod)
data(babyfood)
xtabs(disease/(disease+nondisease)~sex+food,babyfood)
mdl <- glm(cbind(disease,nondisease) ~ sex + food, family=binomial,babyfood)
summary(mdl)
drop1(mdl,test="Chi")
exp(-0.669)
exp(c(-0.669-1.96*0.153,-0.669+1.96*0.153))



exp(confint(mdl))
1-exp(-0.173)
babyfood[c(1,3),]


data(bliss)
bliss
modl <- glm(cbind(dead,alive) ~ conc, family=binomial, data=bliss)
modp <- glm(cbind(dead,alive) ~ conc, family=binomial(link=probit), data=bliss)
modc <- glm(cbind(dead,alive) ~ conc, family=binomial(link=cloglog), data=bliss)
fitted(modl)


coef(modl)[1]+coef(modl)[2]*bliss$conc
ilogit(modl$lin)
cbind(fitted(modl),fitted(modp),fitted(modc))
x <- seq(-2,8,0.2)
pl <- ilogit(modl$coef[1]+modl$coef[2]*x)
pp <- pnorm(modp$coef[1]+modp$coef[2]*x)
pc <- 1-exp(-exp((modc$coef[1]+modc$coef[2]*x)))
plot(x,pl,type="l",ylab="Probability",xlab="Dose") 
lines(x,pp,lty=2)
lines(x,pc,lty=5)
matplot(x,cbind(pp/pl,(1-pp)/(1-pl)),type="l",xlab="Dose",ylab="Ratio")
matplot(x,cbind(pc/pl,(1-pc)/(1-pl)),type="l",xlab="Dose",ylab="Ratio")


data(hormone)
plot(estrogen ~ androgen,data=hormone,pch=as.character(orientation))
modl <- glm(orientation ~ estrogen + androgen, hormone, family=binomial)
summary(modl)
abline(-84.5/90.2,100.9/90.2)



modb <- brlr(orientation ~ estrogen + androgen, hormone, family=binomial)
summary(modb)
abline(-3.65/3.586,4.074/3.586,lty=2)
modl <- glm(cbind(dead,alive) ~ conc, family=binomial, data=bliss)
sum(residuals(modl,type="pearson")^2)
deviance(modl)
(1-exp((modl$dev-modl$null)/150))/(1-exp(-modl$null/150))
data(bliss)
modl <- glm(cbind(dead,alive) ~ conc, family=binomial,data=bliss)
lmodsum <- summary(modl)
x0 <- c(1,2.5)
eta0 <- sum(x0*coef(modl)) 
ilogit(eta0)
(cm <- lmodsum$cov.unscaled)
se <- sqrt( t(x0) %*% cm %*% x0)
ilogit(c(eta0-1.96*se,eta0+1.96*se))
predict(modl,newdata=data.frame(conc=2.5),se=T)
ilogit(c(0.58095-1.96*0.2263,0.58095+1.96*0.2263))
x0 <- c(1,-5)
se <- sqrt( t(x0) %*% cm %*% x0)
eta0 <- sum(x0*lmod$coef) 
ilogit(c(eta0-1.96*se,eta0+1.96*se))
(ld50 <- -lmod$coef[1]/lmod$coef[2])
dr <- c(-1/lmod$coef[2],lmod$coef[1]/lmod$coef[2]^2)
sqrt(dr %*% lmodsum$cov.un %*% dr)[,]
c(2-1.96*0.178,2+1.96*0.178)
ed90 <- (logit(0.9)-lmod$coef[1])/lmod$coef[2]
ed90


dose.p(lmod,p=c(0.5,0.9))
data(troutegg)
ftable(xtabs(cbind(survive,total) ~ location+period, troutegg))
bmod <- glm(cbind(survive,total-survive) ~ location+period, family=binomial,troutegg)
bmod


halfnorm(residuals(bmod))
elogits <- log((troutegg$survive+0.5)/(troutegg$total-troutegg$survive+0.5))
with(troutegg,interaction.plot(period,location,elogits))
(sigma2 <- sum(residuals(bmod,type="pearson")^2)/12)
drop1(bmod,scale=sigma2,test="F")
summary(bmod,dispersion=sigma2)
data(amlxray)
head(amlxray)



amlxray[amlxray$downs=="yes",1:4]
(ii <- which(amlxray$downs=="yes"))
ramlxray <- amlxray[-c(ii,ii+1),]



cmod <- clogit(disease ~ Sex+Mray+Fray+CnRay+strata(ID),ramlxray)
summary(cmod)
cmodr <- clogit(disease ~ Fray+unclass(CnRay)+strata(ID),ramlxray)
summary(cmodr)
gmod <- glm(disease ~ Fray+unclass(CnRay),family=binomial,ramlxray)
summary(gmod)
data(esoph)
help(esoph)



layout(matrix(1:2, ncol = 2))

cdplot(ESR ~ fibrinogen, data = plasma)
cdplot(ESR ~ globulin, data = plasma)

dev.off()

setwd(graph.path)
png("IntroR_cdplot_ESRfibrinogen.png")
  cdplot(ESR ~ fibrinogen, data = plasma)
dev.off()


plasma_glm_1 <- glm(ESR ~ fibrinogen, data = plasma, 
                    family = binomial())

summary(plasma_glm_1)


#------------------------------------------------------------#
# Links
#------------------------------------------------------------#


# http://cran.r-project.org/web/packages/HSAUR/vignettes/Ch_logistic_regression_glm.pdf
# http://www.filewatcher.com/p/HSAUR_1.3-0.tgz.2195072/HSAUR/doc/Ch_logistic_regression_glm.R.html
