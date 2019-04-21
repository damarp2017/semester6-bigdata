install.packages("xlsx")
library(xlsx)
data_pesanan = read.xlsx('Sample - Superstore.xls', sheetIndex = 1, startRow = 1)
filter_data = data_pesanan[,c(2,3,4,6,7,9,10,14,15,16,21)]
names(filter_data) = c("ID Pesanan", "Tgl Pesanan", "Tgl Pengiriman", "ID Pemesan", "Nama Pemesan", "Negara", "Kota", "ID Produk", "Kategori", "Sub-Kategori", "Keuntungan")
str(filter_data)
lama_pesan = filter_data$`Tgl Pengiriman` - filter_data$`Tgl Pesanan`
filter_data = cbind(filter_data, "Lama Pesanan" = lama_pesan)
filter_data_2 = filter_data[,c("ID Produk", "Kategori", "Sub-Kategori", "Keuntungan", "Lama Pesanan")]
filter_data_2 = filter_data_2[filter_data_2$Keuntungan < 0 & filter_data_2$`Lama Pesanan` > 3,]
str(filter_data_2)
filter_data_2$Kategori = as.character(filter_data_2$Kategori)
filter_data_3 = filter_data_2[filter_data_2$Kategori == "Furniture",]
