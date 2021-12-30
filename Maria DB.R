getwd()
setwd("C:/Users/82106/Rdata1")

library(DBI)
Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_301")
library(rJava)
library(RJDBC)

drv <- JDBC(driverClass="com.mysql.cj.jdbc.Driver", 
            classPath = "C:/Temp/mysql-connector-java-8.0.27")

conn <- dbConnect(drv, "jdbc:mysql://127.0.0.1:3306/work?serverTimezone=UTC",
                  "scott", "tiger") # scott 부분 아이디 tiger 비밀번호

# select 문장
dbGetQuery(conn, "select * from goods")
dbGetQuery(conn, "select code, name from goods where code=1 or code=2") # where 조건문도 사용 가능 

# create / alter 문장
dbSendUpdate(conn, "create table goods1 as select * from goods")
dbGetQuery(conn, "select * from goods1")
dbSendUpdate(conn, "alter table goods1 rename to goods_original") # 이름 바꾸기

# insert, update, delete 문장
dbSendUpdate(conn, "insert into goods values (5, '식기세척기', 1, 25000)")
dbGetQuery(conn, "select * from goods")
dbSendUpdate(conn, "insert into goods values (6, 'test', 1, 1000)")

dbSendUpdate(conn, "update goods set name='테스트' where code = 6")
dbSendUpdate(conn, "update goods set su=3 where code = 6")
dbSendUpdate(conn, "delete from goods where code = 6")

# inner / outer / left / right join
dbGetQuery(conn, "select * from goods_original inner join goods on
           goods_original.code=goods.code")
where smoking='3.non-smoking' and education='2.high'
# write table
recode <- read.csv("recode.csv")
recode
class(recode)
dbWriteTable(conn, "goods_new", recode)
dbGetQuery(conn, "select * from goods_new")

# disconnect
dbDisconnect(conn)
