getwd()
setwd("C:/Users/82106/동계인턴십_Data_1000")

temp1 <- read.table("phenotype_1000.txt", header = T)
temp1
str(temp1)

library(dplyr)
tb1 <- select(temp1, FID, IID, STOMA, COLON, LIVER, LUNG, PROST, THROI, BREAC, RECTM)
tb1

temp2 <- read.csv("KCPS_r2_0.01_1000.csv")

str(temp2)


tb12 <- merge(tb1, temp2, by=c('FID', 'IID'))
tb12
str(tb12)

trainData <- tb12[1:800]
str(trainData)
testData <- tb12[801:1000]
str(testData)

