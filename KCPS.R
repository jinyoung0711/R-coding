getwd()
setwd("C:/Users/82106/동계인턴십_Data_1000")

d1 <- read.table("phenotype_1000.txt", header = T)
str(d1)

# 이상치 처리 (NA값을 평균값 or 0으로 대체)
colSums(is.na(d1))
# SMOK_B 이상치 처리
d1$SMOK_B <- ifelse(!is.na(d1$SMOK_B), d1$SMOK_B, round(mean(d1$SMOK_B, na.rm=T))) # 10개의 이상치, 2로 대체

# SMOKA_MOD_B 이상치 처리
length(which(d1$SMOK_B == 1 & is.na(d1$SMOKA_MOD_B)))
length(which(d1$SMOK_B == 2 & is.na(d1$SMOKA_MOD_B)))
length(which(d1$SMOK_B == 3 & is.na(d1$SMOKA_MOD_B)))

d1$SMOKA_MOD_B <- ifelse(d1$SMOK_B == 1 & is.na(d1$SMOKA_MOD_B), 0, d1$SMOKA_MOD_B) # 276개의 이상치, 0로 대체
round(mean(d1$SMOKA_MOD_B[d1$SMOK_B==2])) # 41개의 이상치, 13으로 대체
d1$SMOKA_MOD_B <- ifelse(d1$SMOK_B == 2 & is.na(d1$SMOKA_MOD_B), round(mean(d1$SMOKA_MOD_B[d1$SMOK_B==2], na.rm=T)), d1$SMOKA_MOD_B)
round(mean(d1$SMOKA_MOD_B[d1$SMOK_B==3])) # 4개의 이상치, 16으로 대체
d1$SMOKA_MOD_B <- ifelse(d1$SMOK_B == 3 & is.na(d1$SMOKA_MOD_B), round(mean(d1$SMOKA_MOD_B[d1$SMOK_B==3], na.rm=T)), d1$SMOKA_MOD_B)

# pass
d1$ALCO_B
d1$ALCO_AMOUNT_B
d1$EXER_B
d1$MDM_B
d1$MHTN_B
d1$MLPD_B
d1$PHTN_B
d1$PDM_B
d1$PLPD_B

# HT_B, WT_B, WAIST_B 이상치 처리
d1$HT_B <- ifelse(!is.na(d1$HT_B), d1$HT_B, round(mean(d1$HT_B, na.rm=T))) # 2개의 이상치, 166로 대체
d1$WT_B <- ifelse(!is.na(d1$WT_B), d1$WT_B, round(mean(d1$WT_B, na.rm=T))) # 2개의 이상치, 66로 대체
d1$WAIST_B <- ifelse(!is.na(d1$WAIST_B), d1$WAIST_B, round(mean(d1$WAIST_B, na.rm=T))) # 29개의 이상치, 82로 대체
round(mean(d1$WAIST_B, na.rm=T))

# SBP_B, DBP_B, CHO_B, LDL_B, TG_B, HDL_B, FBS_B, GOT_B, GPT_B, GGT_B, URIC_B 이상치 처리
d1$SBP_B <- ifelse(!is.na(d1$SBP_B), d1$SBP_B, round(mean(d1$SBP_B, na.rm=T))) # 124개의 이상치, 121로 대체
round(mean(d1$SBP_B, na.rm=T))
d1$DBP_B <- ifelse(!is.na(d1$DBP_B), d1$DBP_B, round(mean(d1$DBP_B, na.rm=T))) # 11개의 이상치, 75로 대체
round(mean(d1$DBP_B, na.rm=T))
d1$CHO_B <- ifelse(!is.na(d1$CHO_B), d1$CHO_B, round(mean(d1$CHO_B, na.rm=T))) # 5개의 이상치, 192로 대체
round(mean(d1$CHO_B, na.rm=T))
d1$LDL_B <- ifelse(!is.na(d1$LDL_B), d1$LDL_B, round(mean(d1$LDL_B, na.rm=T))) # 5개의 이상치, 116로 대체
round(mean(d1$LDL_B, na.rm=T))
d1$TG_B <- ifelse(!is.na(d1$TG_B), d1$TG_B, round(mean(d1$TG_B, na.rm=T))) # 5개의 이상치, 137로 대체
round(mean(d1$TG_B, na.rm=T))
d1$HDL_B <- ifelse(!is.na(d1$HDL_B), d1$HDL_B, round(mean(d1$HDL_B, na.rm=T))) # 13개의 이상치, 51로 대체
round(mean(d1$HDL_B, na.rm=T))
d1$FBS_B <- ifelse(!is.na(d1$FBS_B), d1$FBS_B, round(mean(d1$FBS_B, na.rm=T))) # 2개의 이상치, 93로 대체
round(mean(d1$FBS_B, na.rm=T))
d1$GOT_B <- ifelse(!is.na(d1$GOT_B), d1$GOT_B, round(mean(d1$GOT_B, na.rm=T))) # 4개의 이상치, 25로 대체
round(mean(d1$GOT_B, na.rm=T))
d1$GPT_B <- ifelse(!is.na(d1$GPT_B), d1$GPT_B, round(mean(d1$GPT_B, na.rm=T))) # 4개의 이상치, 26로 대체
round(mean(d1$GPT_B, na.rm=T))
d1$GGT_B <- ifelse(!is.na(d1$GGT_B), d1$GGT_B, round(mean(d1$GGT_B, na.rm=T))) # 8개의 이상치, 43로 대체
round(mean(d1$GGT_B, na.rm=T))
d1$URIC_B <- ifelse(!is.na(d1$URIC_B), d1$URIC_B, round(mean(d1$URIC_B, na.rm=T))) # 71개의 이상치, 5로 대체
round(mean(d1$URIC_B, na.rm=T))

# PCAN80 ~ PCAN89, FCAN80 ~ FCAN90 이상치 대체
d1$PCAN80 <- ifelse(!is.na(d1$PCAN80), d1$PCAN80, 0) # 996개의 이상치, 0으로 대체
d1$PCAN81 <- ifelse(!is.na(d1$PCAN81), d1$PCAN81, 0) # 985개의 이상치, 0으로 대체
d1$PCAN82 <- ifelse(!is.na(d1$PCAN82), d1$PCAN82, 0) # 1000개의 이상치, 0으로 대체
d1$PCAN83 <- ifelse(!is.na(d1$PCAN83), d1$PCAN83, 0) # 999개의 이상치, 0으로 대체
d1$PCAN84 <- ifelse(!is.na(d1$PCAN84), d1$PCAN84, 0) # 992개의 이상치, 0으로 대체
d1$PCAN86 <- ifelse(!is.na(d1$PCAN86), d1$PCAN86, 0) # 996개의 이상치, 0으로 대체
d1$PCAN89 <- ifelse(!is.na(d1$PCAN89), d1$PCAN89, 0) # 982개의 이상치, 0으로 대체

d1$FCAN80 <- ifelse(!is.na(d1$FCAN80), d1$FCAN80, 0) # 970개의 이상치, 0으로 대체
d1$FCAN81 <- ifelse(!is.na(d1$FCAN81), d1$FCAN81, 0) # 931개의 이상치, 0으로 대체
d1$FCAN82 <- ifelse(!is.na(d1$FCAN82), d1$FCAN82, 0) # 999개의 이상치, 0으로 대체
d1$FCAN83 <- ifelse(!is.na(d1$FCAN83), d1$FCAN83, 0) # 977개의 이상치, 0으로 대체
d1$FCAN84 <- ifelse(!is.na(d1$FCAN84), d1$FCAN84, 0) # 980개의 이상치, 0으로 대체
d1$FCAN86 <- ifelse(!is.na(d1$FCAN86), d1$FCAN86, 0) # 965개의 이상치, 0으로 대체
d1$FCAN89 <- ifelse(!is.na(d1$FCAN89), d1$FCAN89, 0) # 989개의 이상치, 0으로 대체

# FEV1, FVC
d1$FEV1
d1$FVC

# BIL, WBC, CREAT
d1$BIL <- ifelse(!is.na(d1$BIL), d1$BIL, round(mean(d1$BIL, na.rm=T),2)) # 52개의 이상치, 0.88로 대체
round(mean(d1$BIL, na.rm=T),2)
d1$WBC <- ifelse(!is.na(d1$WBC), d1$WBC, round(mean(d1$WBC, na.rm=T),2)) # 72개의 이상치, 6.09로 대체
round(mean(d1$WBC, na.rm=T),2)
d1$CREAT <- ifelse(!is.na(d1$CREAT), d1$CREAT, round(mean(d1$CREAT, na.rm=T),2)) # 38개의 이상치, 0.98로 대체
round(mean(d1$CREAT, na.rm=T),2)

colSums(is.na(d1))
