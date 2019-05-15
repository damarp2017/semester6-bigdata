vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour=Province))
vis + geom_point()
#aes 5
vis + geom_point(aes(size=5))
#aes 5 biru +line
vis + geom_point(size=5, colour="blue") + geom_line()
#value y
vis + geom_point(aes(y=Total_Penjualan/10000))
#aes tanpa warna
vis + geom_point(aes(colour=NULL)) 

