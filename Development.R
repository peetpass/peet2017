School <- read.csv("data/school.csv")
X = 300
School %>% group_by(school) %>% mutate(Cut = min(value) < X) %>%  mutate(Sure = max(value) < X)

MyDist2 = function(No, Mean, Sd, Subject){
  Dist = rtruncnorm(No, a=0, b=400, mean=Mean, sd=Sd)
  cat(c("1. ", Subject, "- 평균은", stat.desc(Dist)["mean"], "입니다. \n"))
  Quant = format(quantile(Dist, c(0.95, 0.87, 0.84)), digits = 2)
  cat(c("상위 5% 점수는", Quant[1]), "점, 상위 13% 점수는", Quant[2], "점, 상위 25% 점수는", Quant[3], "점 입니다. \n ")
  dftemp = data.frame(Subj = Subject, value = Dist)
  df <<- rbind(df, dftemp)
}

df = NULL ; MyDist2(N2017, 222.5, 70, "Total")
df = NULL ; MyDist2(14759, 200, 50, "Total")
df %>% mutate("Tscore" = (value - 200) / 50 * 10 + 200) %>% filter(Tscore>200)

표준점수= [원점수- 평균점수] / 표준편차 * 10 + 50 (탐구 영역)

hist(df$value)
