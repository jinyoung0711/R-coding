# 연관어 분석
setwd("C:\\Users\\rmaqh\\OneDrive\\바탕 화면\\21년 2학기\\전산통계\\")
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_271")


library(rJava) 
library(slam) 
library(RSQLite)
library(httr)
library(devtools)
library(XML)
library(KoNLP) # 세종사전 
library(tm) # 영문 텍스트 마이닝 
library(wordcloud) # RColorBrewer()함수 제공


# (1) 텍스트 파일 가져오기
bigdata_korea <- file("키워드_빅데이터_연관어분석용.txt", encoding="UTF-8")
bigdata_korea2 <- readLines(bigdata_korea) # 줄 단위 데이터 생성
# incomplete final line found on - Error 발생 시 UTF-8 인코딩 방식으로 재 저장
close(bigdata_korea) 


# (2) 줄 단위 단어 추출
lword <- Map(extractNoun, bigdata_korea2)  
length(lword) # [1] key = 472

lword <- unique(lword) # 중복제거1(전체 대상)
length(lword) # [1] 353 (19개 제거)

# (3) 중복단어 제거와 추출 단어 확인
lword <- sapply(lword, unique) # 중복제거2 (줄 단위 대상) 
length(lword) # [1] 353


# (4) 연관어 분석을 위한 전처리 

# 단어 필터링 함수 정의 (길이 2~4사이 한글 단어 추출)
filter1 <- function(x){
  nchar(x) <= 4 && nchar(x) >= 2 && is.hangul(x)
}

filter2 <- function(x){
  Filter(filter1, x)
}

# 줄 단위로 추출된 단어 전처리 
lword <- sapply(lword, filter2)
lword

# (5) 트랜잭션 생성

# 연관분석을 위한 패키지 설치
library(arules) 

# 트랜잭션 생성 
wordtran <- as(lword, "transactions") # lword에 중복데이터가 있으면 error발생
wordtran 

# (6) 단어 간 연관규칙 산출 
# default (support지지도=0.1, confidence신뢰도=0.8, maxlen최대길이=10)
# 지지도와 신뢰도를 높이면 발견되는 규칙수가 줄어듦
tranrules <- apriori(wordtran, parameter=list(supp=0.03, conf=0.25)) 
tranrules <- apriori(wordtran, parameter=list(supp=0.03, conf=0.8)) 
tranrules <- apriori(wordtran, parameter=list(supp=0.03, conf=0.25)) 

# 연관규칙 생성 결과보기 
inspect(tranrules) # 연관규칙 생성 결과(59개) 보기

# (7)  연관어 시각화 

# 연관단어 시각화를 위해서 자료구조 변경
rules <- labels(tranrules, ruleSep=" ")  
rules
class(rules)

# 문자열로 묶인 연관단어를 행렬구조 변경 
rules <- sapply(rules, strsplit, " ",  USE.NAMES=F) 
rules
class(rules) 

# 행 단위로 묶어서 matrix로 반환
rulemat <- do.call("rbind", rules)
rulemat
class(rulemat)

# 연관어 시각화를 위한 igraph 패키지 설치

library(igraph)   

# edgelist보기 - 연관단어를 정점 형태의 목록 제공 
ruleg <- graph.edgelist(rulemat[c(1:36),], directed=F) # [1,]~[11,] "{}" 제외
ruleg

#  edgelist 시각화
#X11()
plot.igraph(ruleg, vertex.label=V(ruleg)$name,
            vertex.label.cex=1.2, vertex.label.color='black', 
            vertex.size=20, vertex.color='green', vertex.frame.color='blue')
