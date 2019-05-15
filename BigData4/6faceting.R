vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour = Province ))
vis + geom_point() +  facet_wrap(~Province)
vis + geom_point() +  facet_wrap(~Province, ncol=1)

vis = ggplot(data=sample, mapping=aes(x="Total Penjualan", y=Total_Penjualan, col=Province ))
vis + geom_bar(stat = "identity", aes(fill=Province)) + facet_grid(Tanggal ~ Province)
library(lattice)
barchart(Total_Penjualan ~ Province| Tanggal , data=sample)
