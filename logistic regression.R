# 단순 로지스틱회귀모형

data(iris)
a <- subset(iris, Species == "setosa" | Species == "versicolor")
a$Species <- factor(a$Species)
str(a) # setosa(Y=1), versicolor(Y=2)

b <- glm(Species ~ Sepal.Length, data=a, family=binomial)
summary(b)

coef(b)
exp(coef(b)["Sepal.Length"])

confint(b, parm = "Sepal.Length") # 회귀계수에 대한 신뢰구간
exp(confint(b, parm = "Sepal.Length")) # 오즈의 증가량에 대한 신뢰구간

fitted(b)[c(1:5, 96:100)]
predict(b, newdata=a[c(1, 50, 51, 100), ], type="response")

cdplot(Species ~ Sepal.Length, data=a) # 연속형 변수의 변화에 따른 범주형 변수의 조건부 분포

plot(a$Sepal.Length, a$Species, xlab="Sepal.Length")
x=seq(min(a$Sepal.Length), max(a$Sepal.Length), 0.1)
lines(x, 1+(1/(1+(1/exp(-27.831+5.140*x)))), type="l", col="red")
      
# 다중 로지스틱호귀모형
attach(mtcars)
str(mtcars)

glm.vs <- glm(vs ~ mpg + am, data=mtcars, family=binomial)
summary(glm.vs)

step.vs <- step(glm.vs, direction="backward")

ls(glm.vs)
str(glm.vs)

anova(glm.vs, test="Chisq")
