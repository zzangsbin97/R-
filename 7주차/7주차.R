getwd()
setwd('C:\\Users\\김수빈\\zzangsbin97main\\문서\\학교\\2024 1학기\\확률과통계\\R겠습니다\\R-\\7주차')

# a reunion of separated families => rsf로 축약

rsf <- read.csv('이산가족교류.csv', header = T,  fileEncoding="euc-kr") # 파일 불러오기
rsf # 불러온 파일 확인

row.names <- c(rsf[ ,1]) # 행, 열 이름을 적절히 가공하기 위해 바꿀 값 벡터에 저장
col.names <- c(rsf[1, ])
col.names[2] <- paste(col.names[2], "(민간)", sep ="") # 이름이 같은 항목이 두 가지 있어 구분을 위해 데이터 수정 
col.names[6] <- paste(col.names[6], "(당국)", sep ="")

rsf <- rsf[-1, -1] # 저장한 값 데이터프레임에서 삭제

rownames(rsf) <- row.names[-1] #행, 열 이름 변경
colnames(rsf) <- col.names[-1]

rsf.num = data.frame(matrix(ncol = 7, nrow = 20)) # 데이터를 숫자로 저장하기 위해 데이터 프레임 생성

for (i in 1:20) {
  
  rsf.num[i,] <- c(as.numeric(rsf[i,])) # 데이터를 숫자 형태로 옮겨담음
  
}


rownames(rsf.num) <- row.names[-1] #행, 열 이름 붙이기
colnames(rsf.num) <- col.names[-1]


rsf.num # 저장한 값 확인 

max(rsf.num[1])

when.max <- function(colname){
  
  value = rsf.num[, colname]
  max = max(value)
  which.max(value)
  name.max= row.names[which.max(value) + 1]
  cat(colname, "이(가) 가장 많았던 년도는", name.max, "년이며, ", max, "명이 상봉했습니다.")
  
}

when.max('상봉')
when.max('서신교환')
