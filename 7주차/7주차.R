getwd()
setwd('C:\\Users\\김수빈\\zzangsbin97main\\문서\\학교\\2024 1학기\\확률과통계\\R겠습니다\\R-\\7주차')

# a reunion of separated families => rsf로 축약

rsf <- read.csv('이산가족교류.csv', header = T,  fileEncoding="euc-kr")
rsf

row.names <- c(rsf[ ,1])
col.names <- c(rsf[1, ])
row.names
col.names

rsf <- rsf[-1, -1]
rsf

rownames(rsf) <- row.names[-1]
colnames(rsf) <- col.names[-1]

names(which.max(as.numeric(rsf[1])))

rsf
colnames(rsf)[1]
for (i in 1:7) {
  
  rsf$colnames(rsf)[i] <- as.numeric(rsf$colnames(rsf)[i])
}

#rsf$생사확인 <- as.numeric(rsf$생사확인)
#rsf$생사확인
#colnames(rsf)[1]
#class(rsf[1,1])
class(rsf[4, 4])
#as.integer(rsf[4, 4])+as.integer(rsf[4, 5])
rsf[4, 4]+rsf[4, 5]
mingan <- max(rsf[])