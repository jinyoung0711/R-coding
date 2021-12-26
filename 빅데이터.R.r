setwd("C:\\Users\\rmaqh\\OneDrive\\바탕 화면\\21년 2학기\\전산통계\\")
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_271")
library(rJava) 
library(slam)
library(RSQLite)
library(KoNLP)
library(tm)
library(wordcloud)
library(httr)
library(XML)
library(tm)

# google
# (1) URL 요청
url1 <- "https://www.google.com/search?q=Big+data&hl=en&source=lnms&tbm=nws&sa=X&ved=2ahUKEwj7sdakjsD0AhXhs1YBHeXTAvYQ_AUoAnoECAEQBA&biw=1920&bih=969&dpr=1"
web1 <- GET(url1)
web1

# (2) HTML 파싱
html1 <- htmlTreeParse(web1, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode1 <- xmlRoot(html1)
rootNode1

# (3) 태그 자료 수집
# <div class="main_content_inner _content_inner">
# div[@class='main_content_inner _content_inner']
news1 <- xpathSApply(rootNode1, "//div", xmlValue)
news1

# (4) 수집한 자료 전처리
news_pre1 <- gsub('[\r\n\t]', '', news1) 
news_pre1 <- gsub('[가-힣]','',news_pre1)
news_pre1 <- gsub('\\s+',' ',news_pre1)
news_pre1 <- gsub('[[:cntrl:]]','',news_pre1)
news_pre1 <- gsub('[[:punct:]]','',news_pre1)
news_pre1 <- gsub('\\d+',' ',news_pre1)
news_pre1 <- gsub('c\\[a-z]+','',news_pre1)
news_pre1
class(news_pre1)

# FOX
# (1) URL 요청
url2 <- "https://www.foxnews.com/search-results/search?q=Big%20data"
web2 <- GET(url2)
web2

# (2) HTML 파싱
html2 <- htmlTreeParse(web2, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode2 <- xmlRoot(html2)
rootNode2

# (3) 태그 자료 수집
# <div class="main_content_inner _content_inner">
# div[@class='main_content_inner _content_inner']

news2 <- xpathSApply(rootNode2, "//div", xmlValue)
news2

# (4) 수집한 자료 전처리
news_pre2 <- gsub('[\r\n\t]', '', news2) 
news_pre2 <- gsub('[가-힣]','',news_pre2)
news_pre2 <- gsub('\\s+',' ',news_pre2)
news_pre2 <- gsub('[[:cntrl:]]','',news_pre2)
news_pre2 <- gsub('[[:punct:]]','',news_pre2)
news_pre2 <- gsub('\\d+',' ',news_pre2)
news_pre2 <- gsub('c\\([a-z]+','',news_pre2)
news_pre2

# (5) 토픽 분석
# 단어 추출
library(KoNLP)
news_noun <- extractNoun(c(news_pre1, news_pre2))
news_noun
class(news_noun)
#말뭉치 생성
library(tm)
newsCorpus <- VCorpus(VectorSource(news_noun))
newsCorpus
# 불용어 제거
newsCorpus<- tm_map(newsCorpus, removeWords, stopwords())
newsCorpus
TDM <- TermDocumentMatrix(newsCorpus, control=list(wordLengths=c(5,20)))
TDM
tdm.df <- as.data.frame(as.matrix(TDM))
dim(tdm.df)
tdm.df

wordResult <- sort(rowSums(tdm.df),decreasing =T)
wordResult

wordResult <- wordResult[-c(1:6)]

library(wordcloud)
myNames <- names(wordResult)
df <- data.frame(word=myNames, freq=wordResult)
df
pal <- brewer.pal(12,"Paired")
wordcloud(df$word, df$freq, min.freq=2, random.order=F, scale=c(4,0.3), 
          rot.per=0.1, colors=pal, family="malgun")

qwindowsFonts(A=windowsFont("serif"))

