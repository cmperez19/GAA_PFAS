setwd("~/Downloads")
library(planet)
#data(plBetas)
#data(plPhenoData)
library(dplyr)
load("2_BMIQ_Adjsuted.RData")
load("ALLBETAS.FunNormBMIQ.RData")
colnames(FunNorm.BMIQ.ALL) = pd$Sample_Name

load("Perez_Dis_PhenoData.Rdata")
pheno$RPC_clock = predictAge(FunNorm.BMIQ.ALL, type = "RPC")
pheno$CPC_clock = predictAge(FunNorm.BMIQ.ALL, type = "CPC")
pheno$RRPC_clock = predictAge(FunNorm.BMIQ.ALL, type = "RRPC")

#ggplot(data = meta_data, aes(y = CPC_clock, x = CalcGestationLengthInWeeks)) + geom_point() +  geom_smooth(method='lm')

#The null hypothesis is that there is no relationship between the dependent variable and the independent variable(s) 
#and the alternative hypothesis is that there is a relationship. 
#The F-statistic provides us with a way for globally testing if ANY of the independent variables X1, X2, X3, X4… is related to the outcome Y
# F-statistic = MSR/MSE 
#degree of freedom = (k, n-k-1) where k is the number of explanatory/independent(?) variables. n is sample size 
summary(lm(gest_age_in_weeks_edd~RPC_clock, pheno))
summary(lm(gest_age_in_weeks_edd~RRPC_clock, pheno))
summary(lm(gest_age_in_weeks_edd~CPC_clock, pheno))

#if F-statistic > F critical value then reject null Hypothesis 

CPC_clock_lm = lm(gest_age_in_weeks_edd~CPC_clock, pheno)

covariates = c("Prob_African", "Prob_Asian", "Prob_Caucasian", "Batch_Plate", "Batch_Array",
"Trophoblasts","Stromal", "Hofbauer", "Endothelial", "nRBC","Syncytiotrophoblast","SEMs", "log2_SEMs") 

cor.test(pheno$gest_age_in_weeks_edd, pheno$CPC_clock)
cor.test(pheno$gest_age_in_weeks_edd, pheno$RPC_clock)
cor.test(pheno$gest_age_in_weeks_edd, pheno$RRPC_clock)

covar_improve = c()

out = vector('list', length(covariates))
for(i in seq_along(covariates)){
   out[[i]] = lm(paste('gest_age_in_weeks_edd~CPC_clock','+',covariates[i]), data = pheno)
  if ( out[[i]][["coefficients"]][["CPC_clock"]] >= CPC_clock_lm[["coefficients"]][["CPC_clock"]] ){
    append(covar_improve, covariates[i])
  }
}


summary(lm(gest_age_in_weeks_edd~CPC_clock+ Trophoblasts + Stromal + Hofbauer + Endothelial + nRBC + Syncytiotrophoblast, data =pheno))
