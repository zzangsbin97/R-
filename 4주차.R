# 2022년 자료 기준(서울, 부산 대구)

Army <- list(Seoul = c(183, 314, 603, 850, 159, 11, 231), Busan = c(39, 80, 194, 256, 47, 3, 79), Daegu = c(37, 90, 235, 312, 65, 7, 52), total = c(0, 0, 0), class = c('현역병입영 대상', '현역병입영 대상', '현역병입역 대상', '보충역', '전시근로역', '병역면제', '재신체검사') )

Army$class <- factor(Army$class)

names(Army$Seoul) <- Army$class # 지역별 인원에 처분기준에 따른 분류 부여 - 서울
names(Army$Busan) <- Army$class # 지역별 인원에 처분기준에 따른 분류 부여 - 부산
names(Army$Daegu) <- Army$class # 지역별 인원에 처분기준에 따른 분류 부여 - 대구


Army$total <- c(sum(Army$Seoul), sum(Army$Busan), sum(Army$Daegu)) # Army에 지역별 총 인원 추가가
Army.avg <- c(mean(Army$Seoul), mean(Army$Busan), mean(Army$Daegu)) # 각 지역별 평균 

Army.avg 

Army.rate.Seoul <- Army$Seoul / Army$total[1] * 100 # 각 처분기준에 따른 분류의 비율 - 서울
Army.rate.Busan <- Army$Busan / Army$total[2] * 100 # 각 처분기준에 따른 분류의 비율 - 부산
Army.rate.Daegu <- Army$Daegu / Army$total[3] * 100 # 각 처분기준에 따른 분류의 비율 - 대구

Army.rate <- c(Army.rate.Seoul, Army.rate.Busan, Army.rate.Daegu)
names(Army.rate) <- c('Seoul', 'Busan', 'Daegu')

names(Army.rate.Seoul[Army.rate.Seoul == max(Army.rate.Seoul)]) # 지역별 가장 비율이 높은 처분기준 - 서울
names(Army.rate.Busan[Army.rate.Busan == max(Army.rate.Busan)]) # 지역별 가장 비율이 높은 처분기준 - 부산
names(Army.rate.Daegu[Army.rate.Daegu == max(Army.rate.Daegu)]) # 지역별 가장 비율 높은 처분기준 - 대구

names(Army.rate.Seoul[Army$Seoul == max(Army$Seoul)]) # 지역별 가장 인원이 많은 처분기준 - 서울
names(Army.rate.Busan[Army$Busan == max(Army$Busan)]) # 지역별 가장 인원이 많은 처분기준 - 부산
names(Army.rate.Daegu[Army$Daegu == max(Army$Daegu)]) # 지역별 가장 인원이 많은 처분기준 - 대구

Army.Duty.total <- c(sum(Army$Seoul[1:3]), sum(Army$Busan[1:3]), sum(Army$Daegu[1:3]))


names(Army.Duty.total) <- c('Seoul', 'Busan', 'Daegu') # 지역별 현역병입영 대상자 합
names(Army.Duty.total[Army.Duty.total == max(Army.Duty.total)]) # 현역병입영 대상자가 가장 많은 지역

