# R패키지 설치
install.packages("stringr")

# R패키지 로딩
library(stringr)
require(stringr) # 0경고메세지의 차이

# R패키지 제거
remove.packages("stringr")

# 자료형 (Data type)
int <- 20 # 숫자형
int

string <- "홍길동" # 문자형
string

boolean <- TRUE # 논리형 TRUE or T
boolean

a <- NA # 결측형
a

100/0
0/0

sum(10,20,30)
sum(10,20,30,NA)
sum(10,20,30,NA, na.rm=T)

# 자료형 확인
is.double(int)
is.integer(int)
is.numeric(int)
is.character(string)
is.logical(boolean)
is.na(a)
is.na(0/0) # NaN도 NA의 일부
is.nan(a)
is.nan(0/0)

if (is.na(a)) print("Missing!!")

# 자료형 변환
x <- c(1,2,3)
x

y <- c(1,2,"3")
y
xy <- as.numeric(y)
as.character(xy)
xy
# 자료형과 자료구조 보기
mode(int)
mode(string)
mode(boolean)
class(int)
class(string)
class(boolean)
  
mat <- matrix(0,2,2)
mat

mode(mat)
class(mat)

# 유용한 함수들
help(sum)
? sum

args(sum)
example(sum)

getwd()
setwd("C/Users")

# Vector 객체 생성
a <- 1:20
a
c(1:20,33,44)
c("a","b","c",33,44) # 모두 문자형
c("a","b","c",a)

seq(1,10,2) # from=1, to=10 , by=2
seq(1,100,3)
rep(x=1:3, times=5)
rep(x=1:3, each=2)
rep(1:3,5)
rep(1:3, each=5)

# Vector 데이터 처리 함수
x <- c(1,3,5,7)
y <- c(10,11)
union(x,y) # 합집합
intersect(x,y) # 교집합
setdiff(x,y) # 차집합
setdiff(y,x)

# Vector 컬럼 이름 지정
age <- c(20,22,33)
age
names(age) <- c("James", "Jane", "Peter")
age[1]
age[2]
age[3]
age[1:2]

# Vector 데이터 참조
a <- 1:50
a
a[c(1,3)]
a[c(30:45)] # 연속
a[c(1,3,45:50)]
a[-1] # 첫 번째 원소를 제외하고 출력
a[-c(1,4,5,6,7)]

# Matrix 객체 생성
m <- matrix(c(1:3)) # 열 우선으로 행렬 객체 생성
m
m1 <- matrix(c(1:10), nrow=2) # 행의 수를 지정
m1
m2 <- matrix(c(1:10), ncol=5) # 열의 수를 지정,, 수 들어가는 방식 확인
m2
m3 <- matrix(c(1:10),2, 5, byrow=T) # 행 우선으로 행렬 객체 생성
m3

x <- matrix(1:9, 3, 3)

x
names(x)
colnames(x) <- c("one", "two", "three")
rownames(x) <- c(1,2,3)
colnames(x)

mode(x)
class(x)

length(x)
ncol(x)
nrow(x)

# apply 함수
x
apply(x, 1, max) # 1은 행
x[1,]
x[2,]
x[,1]
max(x[1,])
max(x[2,])
max(x[3,])

x
apply(x, 2, max) # 2는 열
max(x[,1])
max(x[,2])
max(x[,3])
?apply
f <- function(x) {x * c(1,2,3)}
f(c(2,3,4))
x
apply(x,1,f)
f(x[1,])
f(x[2,])
f(x[3,])

# Array 객체 생성
arr <- array(1:12, c(3,2,2))
arr

arr[,,1]
arr[,,2]             

mode(arr)
class(arr)

# List 객체 생성
list <- list('lee', '이순신', 2, c(1,2,3), matrix(1:6, 2,3))
list # Key값과 Value값이 연결되어 있음.

list[[1]]
list[[5]]


unlist <- unlist(list)
unlist

member <- list(name=c('lee', '이순신'),age = c(35,25), address = c('미국', '한국'))
member

member[[1]]
member[[2]][2]
member[[3]]
member$age
member$name
member$address

# lapply, sapply 함수
a <- list(1:5, 6:10)
a
lapply(a, max)
unlist(lapply(a,max))
sapply(a,max) # lapply의 unlist

# do.call 함수
multy_list <- list(c1= list(1,2,3), c2 = list(10,20,30))
multy_list

multy_list[[1]]
do.call(cbind, multy_list)
cbind(multy_list[[1]], multy_list[[2]])

# Data frame 객체 생성
# (1) Vector를 이용
no <- c(1,2,3)
name <- c("hong", "lee", "kim")
pay <- c(150, 250, 300)
vemp <- data.frame(NO = no, Name = name, Pay = pay) # data.frame(Key=value)
vemp
mode(vemp)
class(vemp)

# (2) Matrix를 이용
m <- matrix(c( 1, 'hong', 150,
               2, 'lee', 250,
               3, 'kim', 300), 3, 3, byrow=T)
m

memp <- data.frame(m)
memp
class(m)
class(memp)

colnames(memp) = c("NO", "Name", "Pay") # Key값 지정
memp

# (3) txt, csv 파일을 이용하여 객체 생성
getwd()
setwd()
txtemp <- read.table("emp.txt", header = T)
txtemp
class(txtemp)

# data frame처리 함수
df <- data.frame(x=c(1:5), y=seq(2,10,2), z=c('a','b','c','d','e'))
df

str(df)
dim(df)
class(df)
ncol(df)
nrow(df)
colnames(df)
rownames(df)
summary(df)

apply(df, 1, max) # df, 1, max 해서 알파벳 나오는게 아스키코드인가 그거떄문인건가요


# subset 함수 # 특정 컬럼 추출(부분집합)
df
x1 <- subset(df, x >= 3)
x1
x2 <- subset(df, x >=3&y<9)
x2

# 데이터 병합
height <- data.frame(id=c(1,2,3), h =c(180,175,155))
weight <- data.frame(id=c(1,2), w=c(80,75))

user <- merge(height, weight, by="id")
user
user1 <- merge(weight, height, by="id")
user1

height1 <- data.frame(id=c(1,2,3), h =c(180,175,155))
weight1 <- data.frame(idd=c(1,2), w=c(80,75))

user1 <- merge(height1, weight1, by.x="id", by.y="idd") # 전체를 다 보고싶을 땐 , all=T 옵션 추가 # by.y = 'idd'?
user1

# stringr 패키지
install.packages("stringr")
library(stringr)

# 문자열 추출 (정규포현식을 활용)
str_extract("홍길동35이순신45유관순25", "[0-9]{2}")
str_extract_all("홍길동35이순신45유관순25", "[0-9]{2}")

# (1) 반복수 관련 정규 표현식
string <- "hongkildong105lee1002you25강감찬2005"
string
str_extract_all(string, "[a-z]{3,5}") # 3개이상 5개이하

# (2) 문자와 숫자 관련 정규 표현식
str_extract_all(string, 'hong')
str_extract_all(string, '[가-힣]{3,}') # 한글
str_extract_all(string, '[0-9]{4}')

# (3) 특정문자열 제외 정규표현식
str_extract_all(string, '[^a-z]{2}') # ^ 활용
str_extract_all(string, '[^0-9]{3}')

# (4) 한 개의 숫자나 단어 관련 정규표현식
jumin <- '991212-1234583'
str_extract_all(jumin, "[0-9]{6}-[1-4][0-9]{6}") # 한번 체크하기
str_extract_all(jumin, "\\d{6}-[1-4]\\d{6}") # 위 코드와 결과는 같음
str_extract_all(string, "[a-z0-9가-힣]{10,}")
str_extract_all(string, "[\\w]{10,}")

# 문자열 연산 함수
string <- "hongkildong105lee102you25강감찬2005"
string
str_length(string) # nchar(string)

str_locate(string, "강감찬") # regexpr("강감찬", string)
str_sub(string, 26, 28) # substring(string,26, 28)
str_to_upper(string) # toupper(string)
str_to_lower(string) # tolower(string)

string_rep <- str_replace(string, "hongkildong105", "홍길동35, ")
string_rep
string_rep <- str_replace(string_rep, "lee102", "이순신55, ")
string_rep
string_rep <- str_replace(string_rep, "you25", "천진영23, ")
string_rep
string_c <- str_c(string_rep, ', 강감찬55')
string_c

string_sp <- unlist(str_split(string_c, ",")) # strsplit(string_c, ",")
string_sp

class(string_sp)

string_join <- paste(string_sp, collapse = ",")
string_join
class(string_join)

number = 1:22
paste("file_chr", number, ".txt", sep = "")
paste0("file_chr", number, ".txt")

# fread의 경우 큰 파일 읽을 때 굉장히 빠름

# 키보드로 입력
scan() # 값을 받는 함수
num <- scan() # 숫자만 가능
num

name <- scan(what = character()) # 문자열 인식 가능

df = data.frame
df = edit(df)
df

# 화면 출력
x <- 10 ; y <- 20
x
y
z <- x * y
cat("x*y=", x*y, ";", "x/y=", x/y, sep = "")

print(z)
z

# 로컬 파일 읽기
getwd()
setwd("C:/Users/82106/Rdata1")
student <- read.table("student.txt")
student
colnames(student) <- c ("번호", "이름", "키", "몸무게")

student1 <- read.table("student1.txt", header = T)
student1

student2 <- read.table("student2.txt", header = T, sep= ";")
student2

student3 <- read.table("student3.txt", header = T, na.strings = "-")
student3

student4 <- read.table("student4.txt", header = T, sep= ",", na.strings = "-")
student4

student4 <- read.csv("student4.txt", na.strings="-")
student4

# 로컬 파일 읽기
install.packages("data.table")
library(data.table)
stock <- fread("stock.csv")
stock <- read.csv("stock.csv")

# 엑셀 파일 일기
install.packages("xlsx")
install.packages("rJava")

# 자바 JRE 설치
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_301")
library(xlsx)
library(rJava)
studentex <- read.xlsx("studentexcel.xlsx", sheetIndex = 1) # 한글이 깨져서 나온다면 encoding = "UTP-8" 옵션 추가
studentex

# 로컬 파일 저장
student
write.table(student, "student_new.txt") # row.names=F, quote=F
student4
write.csv(student4, "student4_new.csv", row.names=F, quote=F)

studentex
write.xlsx(studentex, "studentex_new.xlsx", row.names=F)

# 인터넷에서 파일 읽기

GDP_ranking <- read.csv("http://databank.worldbank.org/data/download/GDP.csv", skip=3)[2:206, -c(3,6)]

GDP_ranking
head(GDP_ranking)
names(GDP_ranking) = c("Code", "Ranking", "Nation", "GDP")

GDP_ranking$GDP
library(stringr)
num_gdp = as.numeric(str_replace_all(GDP_ranking$GDP, ",", ""))
num_gdp
GDP_ranking$GDP <- num_gdp
head(GDP_ranking)

GDP_ranking15 <- head(GDP_ranking, 15)
barplot(GDP_ranking15$GDP, col=rainbow(15), las = 2, cex.names=0.6, names.arg = GDP_ranking15$Nation)
 
# 웹문서 읽기
url <- "http://ssti.org/blog/useful-stats-capita-personal-income-state-2010-2015"

install.packages("XML")
install.packages("httr")
library(XML)
library(httr)

get_url <- GET(url)
get_url$content # 16진수로 내용 들어가있음
con <- rawToChar(get_url$content)

library(stringr)
str_locate_all(con, "<table")
str_sub(con, 38562, 38762 )

html_cont <- as.data.frame(readHTMLTable(con))
html_cont
class(html_cont)
names(html_cont) <- c("State", "y2010", "y2011", "y2012", "y2013", "y2014", "y2015")
html_cont

# 조건문 
# if문 only

score <- 85
result <- "B"
if (score > 80) result <- "A"
score
result
cat("당신의 학점은", result, "(점수:", score, ")입니다.", sep ="")

# if ~ else if 문
score <- 90 # 중괄호를 아래로 내리는 이유
if (score >= 90) {result = "A"
} else if (score >= 80) {result = "B"
} else if (score >= 70) {result = "C"
} else if (score >= 60) {result = "D"
} else {result = "F"}
cat("당신의 학점은", result, "(점수:", score, ")입니다.", sep ="")

# ifelse 문 (벡터인 경우 많이 사용)
score <- c(100, 85, 70, 90)
names(score) <- c("James", "Jane", "Thomas", "Maria")
score
credit <- ifelse(score >=90, "A", "B")
credit

# switch 문 (슬쩍보는정도로)
input <- "name"
switch(input, id = "hong", pwd = "1234", age = 40, name = "James")

# which문 (유용!!)

no <- 1:5
names <- c("James", "Jane", "Thomas", "Maria", "Tom")
score <- c(100, 80, 90, 95, 30)
exam <- data.frame(학번 = no, 이름=names, 성적=score)
exam
exam[which(exam$학번==3),]

d <- numeric()
1 : 10
for (i in 1:10) {
  d[i] <- i*10
  cat(i, d[i], "\n")
}

# 짝수값 출력/ 홀수값 출력
for (i in 1:10) {
 # if (i %% 2 == 0){ cat(i, " ")}
  if (i %% 2 == 0) { next
    } else {cat(i, " ")}
}
 
score <- c(50, 80)
name <- c("James", "Jane")
i <- 1
for (s in score) {
  cat(name[i], "점수",s, "\n")
  i <- i+1
}

# while 문
i <- 0
while (i < 10) {
  i <- i+1
  print(i)
}

# R 내장함수
# 행, 열 합계 및 평균 구하기
install.packages("RSADBE")
library(RSADBE)
data("Bug_Metrics_Software")
bug <- Bug_Metrics_Software
bug
class(bug)
bug[,,1]
bug[,,2]

class(bug[,,1])

rowSums(bug[,,1])
apply(bug[,,1], 1, sum)

rowMeans(bug[,,1])
apply(bug[,,1],1, mean)

colSums(bug[,,1])
apply(bug[,,1],2, sum)
colMeans(bug[,,1])
apply(bug[,,1],2, mean)

# 난수 생성 및 확률 분포
# 정규분포 (Normal distribution)
n <- 1000
r <- rnorm(n, mean=0, sd=1)
length(r)
? rnorm
hist(r, col="light blue", main = "Histogram of random numbers")

# 균등분포 (Uniform distribution)
n <- 1000
r2 <- runif(n, min=0, max=1) # r2 <- runif(n,0,1)
hist(r2, col="pink")

# 이항분포 (Binomial distribution)
? rbinom
set.seed(123) # 고정
n <- 20
rbinom(n, 1, prob=0.5)
rbinom(n, 2, 0.5)
rbinom(n, 10, 0.5)

########################
# 사용자 정의 함수
########################
# 매개변수가 없는 함수
f1 <- function() {
  cat("매개변수가 없는 함수!!!")
}
f1()

# 매개변수가 있는 함수
f2 <- function(x,y) {
  cat("x=", x,", y=", y, sep="")
}
f2(10,20)

# 리턴값이 있는 함수
f3 <- function(x,y) {
  prod <- x*y
  return(prod)
}
prod <- f3(10,20)
prod

# 분산과 표준편차를 구하는 함수
x <- c(7,5,12,9,15,6)
x
var(x)
sd(x) # sqrt(var(x))

var_sd <- function(x){
  var <- sum((x-mean(x))^2)/ (length(x)-1)
  sd <- sqrt(var)
  cat("var =", var, ", sd=",sd, sep='')
  res <- c(var,sd)
  return (res)
}
result <- var_sd(x)
result

# 구구단 출력 함수
gugu <- function(i) {
  for (x in i) {
    cat("****",x,"단","\n",sep="")
    for (y in 1:9) {
      cat(x, " * ", y, "=", x*y, "\n", sep="")
    }
    cat("********\n")
  }
}
gugu(2:11)

# 동전 앞/뒤 난수 확률 분포 함수

coin <- function(n) { # n은 시행횟수
  r <- runif(n,0,1)
  res <- numeric()
  for (i in 1:n){
    if (r[i] <= 0.5) {res[i] <- 0
    } else {res[i] <- 1}
  }
  return(res)
}
res
coin(10)

coin <- function(n) { # n은 시행횟수
  r <- runif(n,0,1)
  res <- ifelse(r<= 0.5, 0, 1)
  return(res)
}

coin(10)

# 몬테카를로 시뮬레이션
montaCoin <- function(n) {
  cnt <- 0
  for (i in 1:n) {
    cnt <- cnt + coin(1)
  }
  res <- cnt/n
  return(res)
}

montaCoin(10)
montaCoin(100)
montaCoin(1000)
montaCoin(10000000)

# c %in% y # c가 집합 y의 원소인지 확인

# Data Visualization
# Bar Plot (이산형변수)
chart_data <- c(305, 450, 320, 460, 330, 480, 380, 520)
names(chart_data) <- c("2014-1", "2015-1", "2014-2", "2015-2",
                      "2014-3", "2015-3", "2014-4", "2015-4")
chart_data

# 세로 (가로) Bar Plot 그리기
?barplot
barplot(chart_data, col=rainbow(8), ylab = "매출액", 
        xlab="연도별 분기현황",
        main = "2014 vs 2015년도 분기별 매출현황",
        ylim=c(0,600), cex.names = 0.8)

barplot(chart_data, col=rainbow(8), xlab = "매출액", 
        horiz = T,
        space = 0.2,
        ylab="연도별 분기현황",
        main = "2014 vs 2015년도 분기별 매출현황",
        xlim=c(0,600), cex.names = 0.7)

# 개별 (누적) Bar Plot
Data=(VADeaths)
head(VADeaths) # Death rates in Virginia (1940)
class(VADeaths)

barplot(VADeaths, beside=T, col=rainbow(5), # beside는 누적 정도 표시
        main = "Death rates in Virginia (1940)", ylab = "Death rates")
legend(19, 71, 
       c("50-54","55-59","60-64","65-69","70-74"),
       fill=rainbow(5))

# Dot Chart
chart_data
dotchart(chart_data, col=c("red", "blue"), xlab="매출액",
         pch = 1:2, cex=1.2,
         main="분기별 판매현황")

# Pie chart
pie(chart_data, labels=names(chart_data),
    border="blue", col=rainbow(8))
title("분기별 판매현황")

# 3D pie chart
install.packages("plotrix")
library(plotrix)
pie3D(chart_data, labels=names(chart_data),explode=0.1,
      main="분기별 판매현황")

# Histogram
data(iris)
head(iris)
table(iris$Species)

summary(iris$Sepal.Length)
hist(iris$Sepal.Length, xlab="Sepal length of iris",
     main="iris sepal length histogram", col="light green",
     breaks = 10, xlim=c(min(iris$Sepal.Length)-0.5,max(iris$Sepal.Length)))

hist(iris$Sepal.Width, xlab="Sepal width of iris", freq = F,
     main="iris sepal Width histogram", col="light green",
     breaks = 10, xlim=c(min(iris$Sepal.Width)-0.5,max(iris$Sepal.Width)))

d <- density(iris$Sepal.Width)
class(d)
names(d)
head(d$x)
head(d$y)

# add density
lines(d, col="red")

# add normal distribution curve
x <- seq(2.0, 4.5, 0.1)
length(x)
m <- mean(iris$Sepal.Width)
s <- sd(iris$Sepal.Width)
curve(dnorm(x, m, s), col = "blue", add=T)

dnorm(x,m,s)

# Box Plot
VADeaths
boxplot(VADeaths, col="light blue")
cm <- colMeans(VADeaths)
points(1:4, cm, col="red", pch=16)

# Scatter plot (산점도)
set.seed(10)
price <- runif(10, min = 1, max = 100)
price
plot(price, col='blue', pch=16)
par(new=T) # 새로운 plot 추가
plot(1:100, type = 'l',col ='red', axes = F, ann=F)
text(70,80, "대각선 추가", col="blue") 

# Draw scatter plot for overlapped points
install.packages("HistData")
library(HistData)
data(Galton)
head(Galton)
table(Galton$child, Galton$parent)
galtonData <- as.data.frame(table(Galton$child, Galton$parent))
names(galtonData) <- c("child", "parent", "freq")
head(galtonData)
plot(as.numeric(galtonData$parent), as.numeric(galtonData$child),
     col="blue", bg="red", pch=21, cex = 0.1*galtonData$freq,
     xlab="parent", ylab="child")
 
x <- rnorm(1000)
y <- rnorm(1000)
xy <- matrix(c(x,y), length(x), 2)
colnames(xy) <- c("x", "y")
head(xy)

plot(xy, col=densCols(xy), pch=20, cex=2) # 겹칠 때 진하게 

# Scatter plot for 3D
install.packages("scatterplot3d")
library(scatterplot3d)
iris$Species
table(iris$Species)

se <- iris[iris$Species == "setosa",]
vc <- iris[iris$Species == "versicolor",]
va <- iris[iris$Species == "virginica", ]

d3 <- scatterplot3d(iris$Petal.Length, iris$Sepal.Length,
                  iris$Sepal.Width, type = 'n' )

d3$points3d(se$Petal.Length, se$Sepal.Length, se$Sepal.Width,
           bg = 'orange', pch=21)

d3$points3d(vc$Petal.Length, vc$Sepal.Length, vc$Sepal.Width,
            bg = 'blue', pch=23)

d3$points3d(va$Petal.Length, va$Sepal.Length, va$Sepal.Width,
            bg = 'green', pch=25)
  
# 그룹별 기술 통계량 구하기
head(iris)
# apply, lapply, sapply
tapply(iris$Sepal.Length, iris$Species, mean) # table
tapply(iris$Sepal.Length, iris$Species, sd) 

install.packages("plyr")
library(plyr)
summarise(iris, avg=mean(Sepal.Length), std=sd(Sepal.Length))
avg_df <- ddply(iris, .(Species), summarise, 
                avg=round(mean(Sepal.Length),2),
                std=round(sd(Sepal.Length),2),
                min=min(Sepal.Length),
                max=max(Sepal.Length))

avg_df

# merge
x <- data.frame(id=c(1,2,3,4,6), height=c(160,171,173,162,180))
y <- data.frame(id=c(5,4,1,3,2), weight=c(55,73,60,57,80))
x
y
merge(x,y, by='id') # 공통된 부분에 대해서만
merge(x,y,by='id', all=T) # union (x,y)
merge(x,y,by='id', all.x=T) # x
merge(x,y,by='id', all.y=T) # y
library(regbook)
join(x,y,by='id', type='left') # x
join(x,y,by='id', type='right') # y
join(x,y,by='id', type='inner') # intersect(x,y)
join(x,y,by='id', type='full') # union(x,y)

# merge data by two keys
x <- data.frame(key1=c(1,1,2,2,3), key2=c('a','b','c','d','e'),
                val1=c(10,20,30,40,50))

x
y <- data.frame(key1=c(3,2,2,1,1), key2=c('e','d','c','b','a'),
                val2=c(500,400,300,200,100))
y
xy1 <- merge(x,y, by='key1')
xy1
xy2 <- merge(x,y, by='key2')
xy2
xy12 <- merge(x,y, by=c('key1', 'key2'))
xy12
xy12 <- join(x,y, by=c('key1', 'key2'))
xy12

# cast (던지다 long format-> wide format)

install.packages("dplyr")
install.packages("hflights")

library(dplyr)
library(hflights)

str(hflights)

class(hflights)
hflights_df <- tbl_df(hflights) # tbl은 생성자
class(hflights_df) # data.frame + 다른 f() 사용가능

head(hflights_df)

# 특정 조건에 맞는 데이터 필터링
filter(hflights_df, Month == 1 & DayofMonth == 2 )
a <- filter(hflights_df, Month == 2 | Month == 4)
table(filter(hflights_df, Month == 2 | Month == 4)$Month)
class(a)
filter(hflights_df, Month >= 7 & Month <9)
table(filter(hflights_df, Month >= 7 & Month < 9))

# 컬럼으로 데이터 정렬
arrange(hflights_df, Year, Month, DayofMonth) # 기본적으로 오름차순으로 정렬
arrange(hflights_df, Year, Month, desc(DayofMonth)) # desc는 내림차순

# 컬럼으로 데이터 검색
head(hflights_df)
select(hflights_df, Year, Month, DepTime, ArrTime)
select(hflights_df, Year:ArrTime)       
select(hflights_df, -(Year:DayOfWeek))
select(hflights_df, 1:3)

# 데이터 셋에 컬럼 추가
select <- dplyr::select

select(mutate(hflights_df, gain=ArrDelay-DepDelay,
       gain_per_hour = gain/(AirTime/60)),
Year, Month, DayofMonth, gain, gain_per_hour)
?mutate
d1 <- mutate(hflights_df, gain=ArrDelay-DepDelay,
              gain_per_hour = gain/(AirTime/60))
select(d1, Year, Month, DayofMonth, gain, gain_per_hour)

# 요약 통계량 계산
summarise(hflights_df, avgAirTime=mean(AirTime, na.rm = T),
          airTimeVar=var(AirTime, na.rm=T))

# 질적 변수 대상 그룹화
group_by(hflights_df, Month)

# 파이프 사용법
hflights_df %>% group_by(Month) %>% summarise(AvgAirTime=mean(AirTime, na.rm = T))

# reshape2 패키지 ( long -> wide, wide -> long)
install.packages("reshape2")
library(reshape2)

# Long format -> Wide format 
setwd("C:/Users/82106/STAT Rdata")
data <- read.csv("data.csv")
head(data)
dim(data)

# dcast(data.frame, 행구성변수 ~ 열구성변수, value.var="측정변수", function)
wide <- dcast(data, Customer_ID ~ Date, value.var="Buy",length) # 합계는 sum 개수는 length
wide

# Wide format -> Long format
# melt(data.frame, id="기준 column")
long <- melt(wide, id="Customer_ID")
long
names(long)[-1]=c("Date", "Buy")
head(long)

data("smiths")
smiths

# long -> wide, wide -> long 연습하기
long1 <- melt(smiths, id=c("subject", "time"))
long1
dcast(long1, subject + time ~ variable, value.var = "value")

# 3차원 배열 형식으로 변경
data("airquality")
head(airquality)

air_melt <- melt(airquality, id=c("Month", "Day"))
air_melt

acast <- acast(air_melt, Day ~ Month ~ variable) # array cast
acast
class(acast) # array 형태

# (1) 더미 형식 파생 변수 생성

setwd("C:/Users/82106/STAT Rdata")
user_data <- read.csv("user_data.csv")
head(user_data)
table(user_data$house_type) # 1단독2다세대3아파트4오피스텔

user_data$house_type2 <- ifelse(user_data$house_type == 1 |  # ifelse는 벡터를 받아서 벡터를 반환
                            user_data$house_type == 2, 0, 1)
head(user_data)

# (2) 1:1 관계로 파생변수 생성
pay_data <- read.csv("pay_data.csv")
head(pay_data)

library(reshape2)
product_price <- dcast(pay_data, user_id ~ product_type, 
                       value.var = "price", sum, na.rm=T)
head(product_price)
names(product_price)[-1] = c("식료품(1)", "생필품(2)", "의류(3)",
                          "잡화(4)", "기타(5)")
head(product_price)

pay_price <- dcast(pay_data, user_id ~ pay_method, value.var = "price",length) # length는 횟수
head(pay_price)

# (3) 파생변수 합치기
library(plyr)
head(user_data)
head(product_price)
user_pay_data <- join(user_data, product_price, by="user_id")
head(user_pay_data)
user_pay_data <- join(user_pay_data, pay_price, by="user_id")
head(user_pay_data)
mode(user_pay_data)
# (4) 변형된 데이터 저장
write.csv(user_pay_data, "CleanData.csv", quote=F, row.names=FALSE)
data <- read.csv("CleanData.csv")
head(data)

# 결측치 처리
getwd()
setwd("C:/Users/82106/Rdata1")
dataset <- read.csv("dataset.csv")
head(dataset)
dim(dataset)
dataset$resident <- as.factor(dataset$resident)
table(dataset$resident, exclude = NULL)
summary(dataset$resident)
summary(dataset$price) # 양적변수 질적변수 차이

# 결측치 제거
sum(is.na(dataset$price))
price2 <- na.omit(dataset$price)
summary(price2)
length(dataset$price)
length(price2) # 30개의 결측치 제거
colSums(is.na(dataset))
class(is.na(dataset))
dataset.new <- na.omit(dataset)
dim(dataset)
dim(dataset.new) # 91개의 결측치 제거 (1개라도 있으면 무조건 다 제거)
is.na(dataset)
sum(is.na(dataset))
sum(is.na(dataset.new))

# NA를 0이나 평균으로 대체
x <- dataset$price
sum(is.na(x))
head(dataset)
dataset$price2 <- ifelse(!is.na(x), x, 0)
sum(is.na(dataset$price2))
dataset$price3 <- ifelse(!is.na(x), x, round(mean(x, na.rm=T),2)) # na.rm=T 넣어줘야함
head(dataset,30)

# 저장하기
write.csv(dataset, "dataset_new.csv", quote=F, row.names=F)
