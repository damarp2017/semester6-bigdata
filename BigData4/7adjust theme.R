vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour = Province ))
vis + geom_point(size=5) + theme_bw()
vis + geom_point(size=5) + theme_dark()
vis + geom_point(size=5) + 
  theme(
    axis.text = element_text(size = 12),
    legend.background = element_rect(fill = "white"),
    panel.grid.major = element_line(colour = "yellow"),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = "blue")
  )
