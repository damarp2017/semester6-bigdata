
vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour=Province))
vis + geom_point() 

#line putus2
vis + geom_line(linetype="dashed")

#bar stack
vis + geom_bar(stat = "identity", aes(fill=Province) , position = "stack")

#bar prosentae
vis + geom_bar(stat = "identity", aes(fill=Province), position = "fill")

#bar dodge
vis + geom_bar(stat = "identity", aes(fill=Province), position = "dodge")

#boxplot
vis + geom_boxplot(aes(x=Province)) + xlab("Province")

#pie chart
sample_pie = penjualan_provinsi  %>% 
  select(Province, Total_Penjualan) %>% 
  group_by(Province) %>%
  summarise(Total_Penjualan=sum(Total_Penjualan))
vis = ggplot(sample_pie, aes(x = "", y=Total_Penjualan, 
                             fill=Province))+geom_bar(stat = "identity")
vis

vis +  coord_polar("y", start=0)
