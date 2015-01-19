# Grow and Prune
library(rpart)

# Replace absurd values in pim with NA
na.pim = pim
colnames(na.pim) = c("pregnant", "glucose", "bp", "triceps", "insulin", "bmi", "diabetes", "age", "class")
na.pim[na.pim$bp == 0, "bp"] = NA
na.pim[na.pim$bmi == 0, "bmi"] = NA
na.pim[na.pim$glucose == 0, "glucose"] = NA
na.pim[na.pim$triceps == 0, "triceps"] = NA
na.pim[na.pim$insulin == 0, "insulin"] = NA

# ---------- INFORMATION ---------------
# Grow tree completely till only one vector is present at a node
fit = rpart(formula = class ~ pregnant + glucose + bp + triceps + insulin + bmi + diabetes + age, method="class", data=na.pim, parms = list(split="gini"), control = rpart.control(xval = 5, minsplit = 1, cp = 0))
plot(fit, uniform=TRUE, main = "Complete Tree - Information")
text(fit, use.n=TRUE, all=TRUE, cex=0.7)

# We find the cp of the tree with minimum xerror and prune the tree
pfit = prune(fit, cp=fit$cptable[which.min(fit$cptable[,"xerror"]), "CP"])
plot(pfit, uniform=TRUE, main = "Pruned Tree - Information")
text(pfit, use.n=TRUE, all=TRUE, cex=0.7)

# ---------- GINI ---------------
# Grow tree completely till only one vector is present at a node
fit = rpart(formula = class ~ pregnant + glucose + bp + triceps + insulin + bmi + diabetes + age, method="class", data=na.pim, parms = list(split="gini"), control = rpart.control(xval = 5, minsplit = 1, cp = 0))
plot(fit, uniform=TRUE, main = "Complete Tree - Gini")
text(fit, use.n=TRUE, all=TRUE, cex=0.7)

# We find the cp of the tree with minimum xerror and prune the tree
pfit = prune(fit, cp=fit$cptable[which.min(fit$cptable[,"xerror"]), "CP"])
plot(pfit, uniform=TRUE, main = "Pruned Tree - Gini")
text(pfit, use.n=TRUE, all=TRUE, cex=0.7)