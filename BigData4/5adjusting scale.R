vis= ggplot(data=sample, mapping=aes(x=Tanggal, y=Province, size=Total_Penjualan, colour = Province ))
vis + geom_point()
vis + geom_point(aes(size=Total_Penjualan)) + scale_size_continuous(range=c(1,10))
vis + geom_point(aes(colour=Total_Penjualan)) + scale_color_gradient()
vis + geom_point(aes(shape=Province) )  + scale_shape_manual(values=c(5,10))

vis2 = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour = Province ))
vis2 + geom_bar(stat = "identity", aes(fill=Province), position = "dodge") + scale_fill_brewer(palette=2)
vis2 + geom_bar(stat = "identity", aes(fill=Province), position = "dodge")  + scale_y_continuous(limits = c(1,100000), trans="log10")

