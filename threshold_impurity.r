# Read data
setwd('.')
pim = read.csv("./pim.txt", header=FALSE)

# Threshold on the number of vectors at a node with information
library(rpart)

# Replace absurd values in pim with NA
na.pim = pim
colnames(na.pim) = c("pregnant", "glucose", "bp", "triceps", "insulin", "bmi", "diabetes", "age", "class")
na.pim[na.pim$bp <= 30, "bp"] = NA
na.pim[na.pim$bmi <= 10, "bmi"] = NA
na.pim[na.pim$glucose == 0, "glucose"] = NA
na.pim[na.pim$triceps == 0, "triceps"] = NA
na.pim[na.pim$insulin == 0, "insulin"] = NA

# ---------- INFORMATION ---------------
fit = rpart(formula = class ~ pregnant + glucose + bp + triceps + insulin + bmi + diabetes + age, method="class", data=na.pim, parms = list(split="information"), control = rpart.control(xval = 5, cp=0.01))
plot(fit, uniform=TRUE, main="Threshold on Impurity - Entropy")
text(fit, use.n=TRUE, all=TRUE, cex=0.7)
printcp(fit)

# ---------- GINI ---------------
fit = rpart(formula = class ~ pregnant + glucose + bp + triceps + insulin + bmi + diabetes + age, method="class", data=na.pim, parms = list(split="gini"), control = rpart.control(xval = 5, cp=0.01))
plot(fit, uniform=TRUE, main="Threshold on Impurity - Gini")
text(fit, use.n=TRUE, all=TRUE, cex=0.7)
printcp(fit)