# download data
download.file("https://raw.githubusercontent.com/ywchiu/rcookbook/master/chapter7/superstore_sales.csv","data_penjualan.csv")
# install dan load ggplot2
install.packages("ggplot2")
library(ggplot2)
#cek tipe data
data = read.csv("data_penjualan.csv",header = T)
str(data)
data$Order.Date = as.Date(data$Order.Date)

#data penjualan tiap tanggal 1, tiap provinsi
penjualan_provinsi = data %>%
  filter(Order.Date >="2010-01-01") %>%
  select(Order.Date,Sales,Province) %>%
  group_by(Tanggal = as.Date(strftime(Order.Date,"%Y/%m/01")), Province) %>% 
  summarise(Total_Penjualan = sum(Sales))

# coba data
sample = penjualan_provinsi %>% 
  filter(Tanggal> '2012-07-01', 
         Province %in% c('Alberta','British Columbia')) 

# visualisasi sample
vis = ggplot(data=sample, mapping=aes(x=Tanggal, y=Total_Penjualan, colour=Province))
vis = vis+geom_point()
vis = vis+geom_line()
vis = vis+xlab("Bulan") + ylab("Jml Penjualan") + ggtitle("Jml Penjualan tiap Provinsi")
