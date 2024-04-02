# 2023년 1월 3주차 ~ 4월 1주차까지의 정당 지지도 주간 변화(단위: %)

Minju<-c(43.3,45.4,42.3,42.8,39.9,43.9,40.7,42.6,46.4,45.4,47.1,45.9) # 더불어민주당 지지율
People <- c(40.2, 38.6, 41.0, 42.5, 45.0, 42.2, 44.3, 41.5, 37.0, 37.9, 37.1, 37.0) # 국민의힘 지지율 
Justice <- c(4.0, 3.9, 3.6, 3.3, 3.3, 2.7, 2.8, 3.9, 3.7, 3.2, 3.1,3.7) # 정의당 지지율
None <- c(10.9, 10.7, 11.6, 10.0, 10.1, 9.4, 10.0, 10.1, 11.3, 11.4, 11.0, 11.2) # 무정당 지지율


party <-data.frame(Minju, People, Justice, None) # 네 벡터를 하나의 데이터프레임으로 합치기 
party

is.matrix(party) # party가 matrix인지 검사
is.data.frame(party) # party가 dataframe인지 검사

party.matrix <-as.matrix(party) # party를 matrix로 변환하여 party.matrix 생성
is.matrix(party.matrix) # party.matrix가 matrix인지 검사

colnames(party)<-c("더불어민주당", "국민의힘", "정의당","무정당") # 열에 당 이름 붙이기기
rownames(party) <- c('1월 3주', '1월 4주', '2월 1주', '2월 2주', '2월 3주', '2월 4주', '3월 1주', '3월 2주', '3월 3주', '3월 4주', '3월 5주', '4월 1주')
# 행에 주차 이름 붙이기

head(party) # party의 앞부분 5주차 추출
tail(party) # party의 뒷부분 5주차 추출

mean(head(party$더불어민주당)) # 더불어민주당의 앞부분 5주차 평균 지지율
mean(tail(party$국민의힘)) # 국민의힘의 뒷부분 5주차 평균 지지율율

mean.party<-c(mean(party$더불어민주당), mean(party$국민의힘),mean(party$정의당), mean(party$무정당)) # 각 정당의 기간 내 지지율 평균

Minju.isBig <- which(Minju == (subset(party$더불어민주당, Minju >= mean.party[1]))) # 더불어민주당의 평균 지지율보다 높았던 주차 인덱스 추출
Minju.isBig # 더불어민주당의 평균 지지율보다 높았던 주차 추출

rownames(party)[Minju.isBig] # 더불어민주당에서 전체 기간동안의 지지율 평균 이상 주차

People.isSmall <- which(People == (subset(party$국민의힘, People <= mean.party[2]))) # 국민의힘의 평균 지지율보다 낮았던 주차 인덱스 추출
People.isSmall # 국민의힘의 평균 지지율보다 낮았던 주차 추출출

rownames(party)[People.isSmall] # 국민의힘에서 전체 기간동안의 지지율 평균 이상 주차
                    
t.party <- t(party) # party의 전치행렬

t.party