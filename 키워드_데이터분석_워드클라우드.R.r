library(RSQLite)
library(KoNLP)
library(tm)
library(wordcloud)
library(httr)
library(XML)
library(devtools)
library(cli)

# 한국일보 _ 데이터분석
# (1) URL 요청
url <- "https://search.hankookilbo.com/Search?tab=NEWS&sort=recent&searchText=%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D&selectedPeriod=%EC%A0%84%EC%B2%B4&filter=head"
web1<- GET(url1)
web1

# (2) HTML 파싱
html1 <- htmlTreeParse(web1, useInternalNodes = T, trim=T, encoding="UTF-8")
rootNode1 <- xmlRoot(html1)
rootNode1

# (3) 태그 입력
# <div class="inner">
news1 <- xpathSApply(rootNode1, "//div[@class='tab-contents']", xmlValue)
news1

# (4) 수집한 자료 전처리
news_pre1 <- gsub('[\r\n\t]', '', news1) 
news_pre1 <- gsub('[a-z]','',news_pre1)
news_pre1 <- gsub('[A-Z]','',news_pre1)
news_pre1 <- gsub('\\s+',' ',news_pre1)
news_pre1 <- gsub('[[:cntrl:]]','',news_pre1)
news_pre1 <- gsub('[[:punct:]]','',news_pre1)
news_pre1 <- gsub('\\d+',' ',news_pre1)
news_pre1


#SBS _ 데이터분석
# (1) URL 요청
url2 <- "https://news.sbs.co.kr/news/search/main.do?pageIdx=1&searchTermStartDate=&searchTermEndDate=&searchSection=01%7C02%7C03%7C07%7C08%7C09%7C14&searchCategory=&searchMode=&query=%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D&collection=nnews&searchOption=1&searchStartDate=&searchEndDate=&sort=DATE"
web2 <- GET(url2)
web2

# (2) HTML 파싱
html2 <- htmlTreeParse(web2, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode2 <- xmlRoot(html2)
rootNode2

# (3) 태그 자료 수집
# <div class="main_content_inner _content_inner">
news2 <- xpathSApply(rootNode2, "//div[@class='psil_inner']", xmlValue)
news2

# (4) 수집한 자료 전처리
news_pre2 <- gsub('[\r\n\t]', '', news2) 
news_pre2 <- gsub('[a-z]','',news_pre2)
news_pre2 <- gsub('[A-Z]','',news_pre2)
news_pre2 <- gsub('\\s+',' ',news_pre2)
news_pre2 <- gsub('[[:cntrl:]]','',news_pre2)
news_pre2 <- gsub('[[:punct:]]','',news_pre2)
news_pre2 <- gsub('\\d+',' ',news_pre2)
news_pre2


# NAVER_데이터분석

# (1) NAVER URL 요청
url3 <- "https://search.naver.com/search.naver?sm=tab_hty.top&where=news&query=%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D&oquery=%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0&tqi=hjgruwprvxZssdlOz%2FRssssssYK-011668&nso=so%3Add%2Cp%3Aall&mynews=0&office_section_code=0&office_type=0&pd=0&photo=0&sort=1"
web3 <- GET(url3)
web3

# (2) HTML 파싱
html3 <- htmlTreeParse(web3, useInternalNodes = T, trim=T, encoding="utf-8")
rootNode3 <- xmlRoot(html3)
rootNode3

# (3) 태그 자료 수집
# <div class="main_content_inner _content_inner">
news3 <- xpathSApply(rootNode3, "//div[@class='group_news']", xmlValue)
news3

# (4) 수집한 자료 전처리
news_pre3 <- gsub('[\r\n\t]', '', news3) 
news_pre3 <- gsub('[a-z]','',news_pre3)
news_pre3 <- gsub('[A-Z]','',news_pre3)
news_pre3 <- gsub('\\s+',' ',news_pre3)
news_pre3 <- gsub('[[:cntrl:]]','',news_pre3)
news_pre3 <- gsub('[[:punct:]]','',news_pre3)
news_pre3 <- gsub('\\d+',' ',news_pre3)
news_pre3


# (5) 토픽 분석
# 단어 추출
library(KoNLP)
news_noun <- extractNoun(c(news_pre1, news_pre2,news_pre3))
news_noun
length(news_noun)

#말뭉치 생성
library(tm)
Sys.setlocale("LC_ALL","C")
newsCorpus <- Corpus(VectorSource(news_noun))
TDM <- TermDocumentMatrix(newsCorpus, control=list(wordLengths=c(4,6)))
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
          rot.per=0.2, colors=pal, family="malgun")

windowsFonts(A=windowsFont("serif"))

