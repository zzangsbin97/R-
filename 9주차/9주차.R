getwd()
setwd('C:\\Users\\김수빈\\zzangsbin97main\\문서\\학교\\2024 1학기\\확률과통계\\R겠습니다\\R-\\9주차')
# getwd()
stress <- read.csv('Stress.csv', header = T,  fileEncoding="euc-kr") # 파일 불러오기

daily_stress <- data.frame(matrix(ncol = 6, nrow = 6)) # 연령대별 부분만 새로운 데이터프레임으로 저장

for ( i in 1:6){
  for ( j in 1:6){
    daily_stress[i, j] <- as.numeric(stress[2+i, 3+j]) * 10 # 도수로 나타내기 위해 소수점을 없애줌(*10)
  }
}

rownames(daily_stress) <- stress[c(3:8), 3]
colnames(daily_stress) <- c("", "전혀 느끼지 않음", "드물게 느낌", "제법 느낌", "자주 느낌", "항상 느낌")

daily_stress_mt = as.matrix(daily_stress[, -1])

class(daily_stress_mt)
daily_stress_table = as.table(daily_stress_mt)

class(daily_stress_table)
daily_stress_table

barplot(daily_stress_table, main = "일상생활에서 전반적으로 느끼는 스트레스(연령대별)")


##### Pie그래프로 그리기#####

thirty_stress <- daily_stress_table[3, ]
pie(thirty_stress, main = "일상생활에서 전반적으로 느끼는 스트레스(30~39세)")

forty_stress <- daily_stress_table[4, ]
pie(forty_stress, main = "일상생활에서 전반적으로 느끼는 스트레스(40~49세)")

