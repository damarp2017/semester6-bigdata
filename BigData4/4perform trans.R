#data penjualan provinsi Alberta & British Columbia
sample2 = penjualan_provinsi %>% 
  filter(Province %in% c('Alberta', 'British Columbia' ) ) 

vis = ggplot(data=sample2, mapping=aes(x=Tanggal, y=Total_Penjualan, col=Province))
vis + geom_point() + geom_smooth()

vis + geom_point() + stat_smooth()
library(MASS)
vis + geom_point() + geom_smooth(method=rlm)
vis + geom_point() + geom_point(stat = "summary", fun.y = "mean", colour = "red", size = 4)
vis + geom_point() + stat_summary(fun.y = "mean", colour = "red", size = 4, geom="point")
