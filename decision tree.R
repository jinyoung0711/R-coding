# 목표변수가 이산형 -> 분류나무(classification tree)
# 목표변수가 연속형 -> 회귀나무(regression tree)

################################################################################

# Example 1
library(rpart)
c <- rpart(Species ~ . , iris)
c
plot(c, compress = T, margin = 0.5)
text(c, cex = 1.0)

head(predict(c, newdata=iris, type="class"))
tail(predict(c, newdata=iris, type="class"))

install.packages("rpart.plot")
library(rpart.plot)
prp(c, type = 4, extra = 2)

c$cptable
opt <- which.min(c$cptable[, "xerror"])
cp <- c$cptable[opt, "CP"]
prune.c <- prune(c, cp = cp)
plot(prune.c)
text(prune.c, use.n = T)

plotcp(c)

################################################################################

# Example 2
install.packages("party")
library(party)
data(stagec)
str(stagec)

# 결측값 제거
stagec1 <- subset(stagec, !is.na(g2))
stagec2 <- subset(stagec1, !is.na(gleason))
stagec3 <- subset(stagec2, !is.na(eet))
str(stagec3)

set.seed(1234)
ind <- sample(2, nrow(stagec3), replace = TRUE, prob = c(0.7, 0.3))

ind
trainData <- stagec3[ind==1,]
testData <- stagec3[ind==2,]
str(trainData)
str(testData)

tree <- ctree(ploidy ~ . , data=trainData)
tree
plot(tree)

testPred = predict(tree, newdata=testData)
table(testPred, testData$ploidy)

################################################################################

# Example 3
data(airquality)
airq <- subset(airquality, !is.na(Ozone))
head(airq)

airct <- ctree(Ozone ~ ., airq)
airct
plot(airct)
