install.packages("data.table")
install.packages("dplyr")
library(data.table)
library(dplyr)
library(lubridate)

melihat = fread("purchase_view.tab", header = TRUE, sep = "\t")
pesan = fread("purchase_order.tab", header = TRUE, sep = "\t")

#nomer 1
Frek_Produk_dibeli = pesan[,.(Frek_dibeli = length(Action)), by=Product]
Frek_produk_dilihat = melihat[,.(Frek_dilihat = length(Action)), by = Product]
data_gabung = na.omit(merge(Frek_Produk_dibeli, Frek_produk_dilihat, by="Product", all = TRUE))
presentase_barang_dibeli = cbind(data_gabung, Persentase=(data_gabung$Frek_dibeli/data_gabung$Frek_dilihat*100))




#nomer 2
pesan$Time = as.Date(pesan$Time)
pesanan_user_tiap_tanggal = dcast(pesan, User + (Product = pesan$Product) ~ day(ymd(pesan$Time)), value.var = "Time")
pesanan_user_tiap_tanggal[pesanan_user_tiap_tanggal==0]<-"-"

#nomer 3
melihat$Time = as.Date(melihat$Time)
user_melihat_tiap_tanggal = dcast(melihat, User + (Product = melihat$Product) ~ day(ymd(melihat$Time)), value.var = "Time")
user_melihat_tiap_tanggal[user_melihat_tiap_tanggal==0]<-"-"


#nomer 4
melihat2 = melihat[,.(User, Time, Product), by = User]
Frek_user_beli = pesan[,.(User,Frek_beli = length(Action)), by=Product]
Frek_user_lihat = melihat[,.(User,Frek_lihat = length(Action)), by = Product]
datamerge = merge(Frek_user_lihat, Frek_user_beli, by="Product", all=TRUE)
datamerge[is.na(datamerge)]<-0
perilaku_user = merge(melihat2, datamerge, by = "User", all = TRUE)
perilaku_user = perilaku_user[perilaku_user$Frek_dilihat>=10 & perilaku_user$Frek_dibeli==0]


