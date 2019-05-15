library(grid)
grid.newpage()
vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour = Province ))
plot1 = vis + geom_point()
plot2 = vis + geom_line() 
pushViewport(viewport(layout = grid.layout(1, 2)))
print(plot1, vp =viewport(layout.pos.row = 1, layout.pos.col = 1))
print(plot2, vp =viewport(layout.pos.row = 1, layout.pos.col = 2))

