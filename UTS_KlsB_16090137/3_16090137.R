install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(dplyr)
library(lubridate)

melihat = fread("purchase_view.tab", header = TRUE, sep = "\t")
pesan = fread("purchase_order.tab", header = TRUE, sep = "\t")

Frek_Produk_dibeli = pesan[,.(Frek_dibeli = length(Action)), by=Product]
Frek_produk_dilihat = melihat[,.(Frek_dilihat = length(Action)), by = Product]
data_gabung = na.omit(merge(Frek_Produk_dibeli, Frek_produk_dilihat, by="Product", all = TRUE))
presentase_barang_dibeli = cbind(data_gabung, Persentase=(data_gabung$Frek_dibeli/data_gabung$Frek_dilihat*100))

write.xlsx(presentase_barang_dibeli, file = "prosentasproduk_16090137.xlsx")

pesan$Time = as.Date(pesan$Time)
pesanan_user_tiap_tanggal = dcast(pesan, User + (Product = pesan$Product) ~ day(ymd(pesan$Time)), value.var = "Time")
pesanan_user_tiap_tanggal[pesanan_user_tiap_tanggal==0]<-"-"

write.xlsx(pesanan_user_tiap_tanggal, file = "tanggalbeli_16090137.xlsx")
