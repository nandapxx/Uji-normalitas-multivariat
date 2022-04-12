## QQ Plot
dataa=read.csv(file.choose())
dataa
datab=dataa[,-1]
datab
mu=colMeans(datab)
mu
n=nrow(datab)
n
p=ncol(datab)
p
cov=cov(datab)
cov
d=sort(mahalanobis(datab,mu,cov))
d
j=qchisq(ppoints(n),df=p)
j
qqplot(j,d,main="QQ-Plot", ylab="jarak mahalanobis")
abline(0,1)

##Shapiro Wilks
# H0 : data berdistribusi normal multivariat
# H1 : data tidak berdistribusi normal multivariat
install.packages("mvnormtest")
library(mvnormtest)
z=t(datab)
mshapiro.test(z) # H0 ditolak (data tidak normal multivariat)

##Kolmogorov Smirnov
# H0 : data berdistribusi normal multivariat
# H1 : data tidak berdistribusi normal multivariat
ks.test(datab,"pnorm") #warning ketika ada nilai data yg sama

##Skewness and Kurtosis
install.packages("MVN")
library(MVN)
mvn(data=datab,mvnTest = "mardia")