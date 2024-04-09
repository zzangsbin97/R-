# 2022년 자료 기준

getwd()
setwd('C:\\Users\\김수빈\\zzangsbin97main\\문서\\학교\\2024 1학기\\확률과통계\\R겠습니다\\R-\\6주차')

death <- read.csv('death.csv', header = T,  fileEncoding="euc-kr")

class(death)

# 특정 감염성 및 기생충성 질환
infection <- subset(death, 사망원인별.104항목. == '특정 감염성 및 기생충성 질환' & (연령.5세.별 == '20 - 24세' | 연령.5세.별 == '25 - 29세') & 성별 == '계')
infection.total <- sum(as.numeric(infection$X2022))
infection.total

# 신생물물
# neoplasm <- subset(death, 사망원인별.104항목. == '신생물' & (연령.5세.별 == '20 - 24세' | 연령.5세.별 == '25 - 29세') & 성별 == '계')
# neoplasm.total <- sum(as.numeric(infection$X2022))

twenty_total <- subset(death, (연령.5세.별 == '20 - 24세' | 연령.5세.별 == '25 - 29세') & 성별 == '계')
twenty_total

cause <- factor(twenty_total$사망원인별.104항목.)
cause

levels(cause)
cause.vector <- as.vector(levels(cause))[-1]
test <- c()
test.sum <- c()

for ( i in 1:19 ){ # 사망원인이 18개이므로 1부터 18까지 반복
  #c(test, subset(twenty_total, 사망원인별.104항목. == cause.vector[i]))
  test <- subset(twenty_total, 사망원인별.104항목. == cause.vector[i])
  test.sum <- append(test.sum, sum(as.numeric(test$X2022)))
}

print("2022년 기준 20대의 사망원인별 사망자 수")
names(test.sum) <- cause.vector
test.sum


cat("사망자수가 가장 많은 사망원인: ", names(which.max(test.sum)), ", 사망자수: ", max(test.sum), "(명)\n")
cat("사망자수가 가장 적은 사망원인: ", names(which.min(test.sum)), ", 사망자수: ", min(test.sum), "(명)\n")
cat("평균 사망자수: ", mean(test.sum), "(명)")
