setwd("~/GitHub/Planet_Epigenetic_GA_Clocks")
library(planet)
#data(plBetas)
#data(plPhenoData)
library(dplyr)
load("2_BMIQ_Adjsuted.RData")
load("ALLBETAS.FunNormBMIQ.RData")
colnames(FunNorm.BMIQ.ALL) = pd$Sample_Name

#There are 141 samples in my meta data set and 153 samples in both FunNorm.BMIQ files 
#the column order for FunNorm wasn't in ascending order 
FunNorm.BMIQ.ALL_141 = FunNorm.BMIQ.ALL[ ,which(colnames(FunNorm.BMIQ.ALL) %in% meta_data$ID)]
FunNorm.BMIQ.ALL_141 = FunNorm.BMIQ.ALL_141[, order(colnames(FunNorm.BMIQ.ALL_141))]
colnames(FunNorm.BMIQ.ALL_141) == meta_data$ID

meta_data$RPC_clock = predictAge(FunNorm.BMIQ.ALL_141, type = "RPC")
meta_data$CPC_clock = predictAge(FunNorm.BMIQ.ALL_141, type = "CPC")
meta_data$RRPC_clock = predictAge(FunNorm.BMIQ.ALL_141, type = "RRPC")

ibrary(ggplot2) 
#should I have added coefficients? probably 
ggplot(data = meta_data, aes(x= CalcGestationLengthInWeeks, y = RPC_clock)) + geom_point() +  geom_smooth(method='lm')
ggplot(data = meta_data, aes(y = RRPC_clock, x = CalcGestationLengthInWeeks)) + geom_point() +  geom_smooth(method='lm')
ggplot(data = meta_data, aes(y = CPC_clock, x = CalcGestationLengthInWeeks)) + geom_point() +  geom_smooth(method='lm')

#The null hypothesis is that there is no relationship between the dependent variable and the independent variable(s) 
#and the alternative hypothesis is that there is a relationship. 
#The F-statistic provides us with a way for globally testing if ANY of the independent variables X1, X2, X3, X4… is related to the outcome Y
# F-statistic = MSR/MSE 
#degree of freedom = (k, n-k-1) where k is the number of explanatory/independent(?) variables. n is sample size 
summary(lm(CalcGestationLengthInWeeks~RPC_clock, meta_data))
summary(lm(CalcGestationLengthInWeeks~RRPC_clock, meta_data))
summary(lm(CalcGestationLengthInWeeks~CPC_clock, meta_data))

qf(p= 0.05, df1=1, df2=138 ,lower.tail=TRUE)
#if F-statistic > F critical value then reject null Hypothesis 

#ChildGender or Childgender.1? 

