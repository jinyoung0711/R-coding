# ggplot2 설치

install.packages("ggplot2")
library(ggplot2)
data(mpg)
head(mpg)
getwd()
setwd("C:/Users/82106/Rdata1")
head(mpg)
str(mpg)
? mpg

table(mpg$drv)
summary(mpg$hwy)

plot(mpg$hwy)

hist(mpg$hwy)
qplot(hwy, data=mpg, fill="light blue") # light blue라는 이름의 색이 나옴
qplot(hwy, data=mpg, fill=I("light blue"), col=I("black")) # I를 넣어줘야함
qplot(hwy, data=mpg, fill=drv, col=I("black")) # drv변수에 색 채우기(누적 막대그래프)

qplot(hwy, data=mpg, fill=drv, col=I("black"), binwidth=2) 
qplot(hwy, data=mpg, fill=drv, facets=.~ drv, binwidth=2) 
qplot(hwy, data=mpg, fill=drv, col=I("black"), facets= . ~ drv ,binwidth=2) # facets= 행 ~ 열 (그리드형태)
# fill같은 경우 변수로 해석되는 경우가 많음 . I를 넣어줘서 변수로 해석하지말아라. 
qplot(hwy, data=mpg, fill=drv, col=I("black"), facets= drv ~ cyl ,binwidth=2)

# diamonds data

head(diamonds)
? diamonds
table(diamonds$clarity)
table(diamonds$cut)

qplot(clarity, data=diamonds, fill=cut, geom="bar") # 레이아웃에 색 채우기
qplot(clarity, data=diamonds, color=cut, geom="bar") # 테두리 색 적용

# 변수가 2개인 경우 -> 산점도 (scatter)
summary(mpg$displ)

qplot(displ, hwy, data=mpg, color=drv, facets=drv~.)
qplot(hwy, displ, data=mpg, color=drv, facets=drv~.)

# mtcars
head(mtcars)
? mtcars
table(mtcars$carb)
summary(mtcars$qsec)

qplot(wt, mpg, data=mtcars, color=factor(carb)) # 색상적용
qplot(wt, mpg, data=mtcars, color=factor(carb),size=qsec) # 크기적용
qplot(wt, mpg, data=mtcars, color=factor(carb),size=qsec,shape=factor(cyl)) #모양적용

qplot(wt, mpg, data=mtcars, color=factor(carb), size = qsec,
      shape=factor(cyl))

qplot(wt, mpg, data=mtcars, geom="point") # geom="point": default
qplot(wt, mpg, data=mtcars, geom="smooth") # geom="smooth" (method='lowess‘) 
qplot(wt, mpg, data=mtcars, geom=c("point", "smooth")) 
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom=c("point", "smooth"))
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom="line") # geom="line“ (polygon)
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom=c("point", 'line'))


# factor를 사용함으로 질적변수로 변경시켜줌

qplot(wt, mpg, data=mtcars, geom="point")
qplot(wt, mpg, data=mtcars, geom="smooth")
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom=c("point", "smooth"))
qplot(wt, mpg, data=mtcars, color=factor(cyl), geom=c("point", "line"))

# ggplot function

# (1) Set up
library(ggplot2)
head(diamonds)
ggplot(diamonds, aes(x=carat, y=price, color=cut))

# (2) Layers
g1 <- ggplot(diamonds, aes(x=carat, y=price, color=cut)) + 
  geom_point() + geom_smooth()

g2 <- ggplot(diamonds) + geom_point(aes(x=carat, y=price, color=cut)) +
  geom_smooth(aes(x=carat, y=price))

g3 <- ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(aes(color=cut, shape = cut)) +
  geom_smooth()

# (3) Labels
g4 <- g1 + labs(title = "Scatter Plot", x="Carat11", y="Price")
print(g4)

# (4) Theme
g5 <- g4 + theme(plot.title=element_text(size=20, face="bold"),
                 axis.text.x=element_text(size=15),
                 axis.text.y=element_text(size=20),
                 axis.title.x=element_text(size=25),
                 axis.title.y=element_text(size=25)) +
  scale_color_discrete(name='Cut of Diamonds') 
print(g5)

# scale_color, discrete
# scale_color, continuous
# scale_shape, discrete
# scale_shape, continuous

# (5) Facets
g6 <- g4 + facet_wrap(.~cut, ncol=3)
print(g6)

g7 <- g4 + facet_grid(color~cut)
print(g7)

# (6) Box Plot
library(datasets)
data("airquality")
head(airquality)
dim(airquality)
airquality$Month <- factor(airquality$Month) # discrete로 변경

pp1 <- ggplot(airquality, aes(x=Month, y=Ozone)) +
  geom_boxplot(fill="red", color="blue")
print(pp1)

pp2 <- pp1 + scale_x_discrete(name="Month") +
  scale_y_continuous(name="Mean Ozone in \nparts per billion",
                     breaks = seq(0,175,25), limits= c(0,180))
print(pp2)

# install packages
install.packages("DBI")
install.packages("rJava")
install.packages("RJDBC")
library(DBI)
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_301")
library(rJava)

# 단일 집단 모평균 추론
set.seed(1)
n <- 100
x <- rnorm(n)
xbar <- mean(x)
se <- sd(x) / sqrt(n)
xbar
se
sd(x)

# (xbar-t_alpha_2_n_1*se,xbar+t_alpha_2_n_1*se)

t_alpha_2_n_1 <- qt(0.05/2, df = n-1)
t_alpha_2_n_1
ci.x <- c(xbar-t_alpha_2_n_1*se,xbar+t_alpha_2_n_1*se)
ci.x

# compute mean
setwd("C:/Users/82106/Rdata1")
data <- read.csv("one_sample.csv", header = T)
data
dim(data)
head(data)
mean(data$time, na.rm = T)
x <- data$time
x1 <- na.omit(x)
length(x)
length(x1)

# Shapiro-Wilk test (H0 : x1,...,xn ~ Normal)
shapiro.test(x1)

# Histogram
hist(x1, freq=F, col="light blue", main="Histogram")
lines(density(x1), col="red")

# QQPLOT
qqnorm(x1, pch =16, col="light blue")
qqline(x1, lyt=1, col='red')
# y축 : sort(x1) : 1~109 
# x축 : F^-1(i/(n+1)) n=109, i=1,...,109 
# c(F^1(1/110),...,F^-1(109/110))

# 양측 검정 (H0: mu=5.2 vs H1: mu!=5.2)
mean(x1)
res <- t.test(x1, mu =5.2, alter="two.sided")
res

# 단측 검정(H0: mu=5.2 vs H1: mu>5.2)
res <- t.test(x1, mu=5.2, alter="greater")
res

# 대응표본의 평균 계산
setwd("C:/Users/82106/Rdata1")
data <- read.csv("paired_sample.csv")
head(data)
sum(is.na(data))
result <- na.omit(data)
dim(data)
dim(result)
mean(result$before)
mean(result$after)
x <- result$before
y <- result$after

# 양측 검정 (H0: mu1=mu2, H1: mu1 !=mu2)
t.test(x, y, paired=T)

# 단측 검정 (Ho: mu1=mu2, H1: mu1 < mu2)
t.test(x, y, paired=T, alter="less")

# 두 집단 평균 계산
data <- read.csv("two_sample.csv")
dim(data)
head(data)
sum(is.na(data[,1]))
sum(is.na(data[,2]))
sum(is.na(data[,3]))
sum(is.na(data[,4]))
sum(is.na(data[,5]))

result <- na.omit(data)
dim(result)


head(result)
table(result$method)

a <- subset(result, method==1)$score
b <- subset(result, method==2)$score

mean(a)
mean(b)

# 분산의 동질성 검정 (H0: 두개 그룹의 분산이 동일하다)
var.test(a, b, alter="two.sided")

# 양측 검정 (H0 : mu1=mu2, H1: mu1 != mu2)
t.test(a, b, alter="two.sided")

# 단측검정 (H0:mu1=mu2 , H1:mu1 != mu2)
t.test(a, b)

# 분산 분석
data <- read.csv("three_sample.csv")
head(data)
sum(is.na(data[,1]))
sum(is.na(data[,2]))
sum(is.na(data[,3]))
sum(is.na(data[,4]))

result <- na.omit(data)
dim(result)
dim(data)
sort(result$score, decreasing =T)

plot(result$score)
data2 <- subset(result, score<=13)
dim(data2)
boxplot(data2$score, col="light blue")

# 그룹별 평균 
head(data2)
data2$method2[data2$method==1] <- "M1"
data2$method2[data2$method==2] <- "M2"
data2$method2[data2$method==3] <- "M3"

x <- table(data2$method2)
tapply(data2$score, data2$method2, mean)

library(dplyr)
data2 %>% group_by(method2) %>% summarize(avg = mean(score))

library(plyr)
ddply(data2, .(method2), summarize, avg=mean(score))

# 세집단간의 동질성 검정( H0: 세집단 분표의 모양이 같다)
bartlett.test(score~method2, data=data2)

# 분산분석
res <- aov(score~method2, data=data2)
res
summary(res)

# 단일 집단 모비율 추론
setwd("C:/Users/82106/Rdata1")
data <- read.csv("one_sample.csv")
data
sum(is.na(data$survey))
table(data$survey) # 0 불만족(14), 1 만족 (136 sample)
sum(data$survey)/length(data$survey)

# 양측 검정(H0 : p=0.8, H1: p != 0/8)
x <- dadta$survey
binom.test(136, 150, p=0.8)
binom.test(c(136,14), p=0.8)
# X ~ Bin(150, 0.8)
pbinom(135, 150, 0.8, lower.tail = F)*2

# 단측 검정 (H0:p=0.8, H1: p>0/8)
binom.test(136, 150, p=0.8, alternative = "greater")
pbinom(135, 150, 0.8, lower.tail = F)

# 두 집단 비율 추론
data <- read.csv("two_sample.csv")
head(data)
x <- data$method
y <- data$survey
table(x,y)

# 양측 검정 (H0 : p1=p2 vs H1 : p1 != p2)
prop.test(c(110, 135),c(150,150), alternative = "two.sided",conf.level = 0.95)

# 단측 검정 (Ho : p1=p2 vs H1: p1 < p2)
prop.test(c(110, 135), c (150,150), alternative = "less", conf.level = 0.95)

# 세 집단 비율 추론
data <- read.csv("three_sample.csv")
head(data)
x <- data$method
y <- data$survey
table(x,y)

# 세집단의 비율 차이 검정 (H0 : p1=p2=p3 vs H1 : not H0)
prop.test(c(34,37,39),c (50, 50, 50), alternative = "two.sided", conf.level = 0.95)

# 적합도 검정

x <- data.frame(matrix(c(1,2,3,4,5,41,30,51,71,61), ncol=2))
head(x)
names(x) <- c("prod", "freq")
x$prop <- x$freq/sum(x$freq)
x

# Ho : p1=p2=p3=p4=p5=0.2 vs H1 : not H0
chisq.test(x$freq)
# Ho : p1~p5 = (0.2,0.1,0.2,0.3,0.2) vs H1:not H0
chisq.test(x$freq, p=c(0.2,0.1,0.2,0.3,0.2))

# 독립성 검정 (Independent Test)
install.packages("gmodels")
library(gmodels)
getwd()
setwd("C:/Users/82106/Rdata1")
data <- read.csv("cleanDescriptive.csv")
head(data)
dim(data)

x <- data$level2 # 부모의 학력 수준
y <- data$pass2 # 자녀의 대학진학여부

# H0 : 부모의 학력수준과 대학진학여부는 독립이다.(관련성이 없다.)
chisq.test(x, y)
? chisq.test
CrossTable(x, y, chisq = T)

# 동질성 검정
data <- read.csv("homogenity.csv", header = T)
head(data)
dim(data)

CrossTable(data$method, data$survey, chisq = T)
chisq.test(data$method, data$survey)

# Chisq Test - 어떻게 코드가 된건지 볼 필요가 있음.

data <- read.csv("cleanDescriptive.csv")
tab1 = table(data$level2, data$pass2)

data <- read.csv("homogenity.csv", header = T)
tab1 = table(data$method, data$survey)

compute.chisq = function(tab) {
  r = nrow(tab)
  c = ncol(tab)
  tab = cbind(tab,apply(tab,1,sum))
  tab = rbind(tab,apply(tab,2,sum))
  chi = 0
  for (i in 1:r) {
    for (j in 1:c) {
      eij = tab[r+1,c+1]*tab[i,j]/tab[r+1,j]*tab[i,j]/tab[i,c+1]
      chi = chi + (tab[i,j]-eij)^2/eij
    }
  }
  list(chi,pchisq(chi,df=(r-1)*(c-1),lower.tail=F))
}
compute.chisq(tab1)

# OOP (객체지향언어 )
install.packages("pryr")
library(pryr)

df <- data.frame(x=1:10, y=letters[1:10])
df
otype(df)
methods("mean")
methods("t.test")
methods(class="ts")

# S3 object (1)
foo <- structure(list(), class="foo")
class(foo)
inherits(foo, "foo")
otype(foo)

# S3 object (2)
foo <- list()
class(foo) <- "foo"
class(foo)
inherits(foo, "foo")
otype(foo)

# S3 Function
# create a generic function
f <- function(x) UseMethod("f")
f

f.a <- function(x) "Class a!!!"

obj1 <- list(); class(obj1) <- "a"
class(obj1)
otype(obj1)
f(obj1)

f.a <- function(x) "Class a!!!"
f.default <- function(x) "Unknwon!!!"
obj1 <- list(); class(obj1) <- "a"
class(obj1)
f(obj1)

# create a linear model
mod <- lm(log(mpg)~ log(disp), data=mtcars)
mod
? mtcars

summary(mod)
class(mod)
otype(mod)
methods("summary")
class(mod) <- "newlm" # 새로운거로 정의

summary(mod) # newlm이 없기 떄문에 summary.default로 실행

summary.newlm <- function(object, ...) print("newlm!!!") 
summary(mod)
methods("summary")

# S4 Object : S3보다는 객체지향적이지만 RC보단 X 
library(methods)

# 함수를 사용하여 Class 정의
# setClass(Class이름 지정, slots= list형태로 변수 지정)
# setClass, setRefClass등을 사용하는점이 일반적인 형태와 다름
setClass("Person", slots = list(name="character", age="numeric"))
setClass("Employee", slots = list(boss="Person"), 
         contains = "Person") # contains를 사용하여 Person Class 상속

# 상속 받았기 때문에 boss, name, age 다 포함
alice <- new("Person", name ="Alice", age = 40)
john <- new("Employee", name = "John", age = 20, boss = alice)

alice
john

alice@name # @사용하는 것 주의하기
alice@age

john@name
john@age
john@boss

# create a generic function and method 
# Generic, Method 생성 함수 다름
union
methods("union") # class와 연관되어있지 않음
setGeneric("union")
setMethod("union", c(x="data.frame", y="data.frame"), #x와y의 인자값
          function(x,y) {unique(rbind(x,y))})

a <- data.frame(a=10, b=20)
b <- data.frame(a=10, b=30)
a
b
union(a,b)

# RC Object # 가장 다른 언어들과 유사함 - 변수와 함수 같이 넣음
Acc1 <- setRefClass("Account1", fields = list(balance="numeric")) #fields가 변수 이름
Acc2 <- setRefClass("Account2", fields = list(balance="numeric"),
                    methods=list( #list형태로 method 추가 가능하다는 장점
                      withdraw = function(x) {balance <<- balance - x}, # R에서는 <- 대입하는 거니까 <<- 유의하기
                      deposit = function(x) {balance <<- balance + x}
                    ))
Acc3 <- setRefClass("NoOverdraft",
            contains = "Account2", # 상속을 받는 인자
            methods = list(
              withdraw = function(x) {
                if (balance < x) stop("Not enough Money!!!")
                balance <<- balance - x
                }
            ))

a1 <- Acc1$new(balance=100)
a1$balance
a1$balance <- 200

# 이런건 객체지향에서 선호 x

a2 <- Acc2$new(balance=100)
a2$deposit(100)
a2$balance
a2$withdraw(50)

a3 <- Acc3$new(balance=100)
a3$deposit(50)
a3$balance
a3$withdraw(2000)
