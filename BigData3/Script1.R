install.packages("data.table")
library(data.table)
melihat = read.table("purchase_view.tab", header = TRUE, sep = "\t")
pesan = read.table("purchase_order.tab", header = TRUE, sep = "\t")
melihat2 = fread("purchase_order.tab", header = TRUE, sep = "\t")
pesan2 = fread("purchase_order.tab", header = TRUE, sep = "\t")

system.time(melihat<-read.table("purchase_view.tab", header = TRUE, sep = "\t"))
system.time(melihat2<-fread("purchase_view.tab", header = TRUE, sep = "\t"))

str(melihat)
str(melihat2)

melihat_transform = as.data.table(melihat)

head(melihat[1:3])
head(melihat2[1:3])

melihat[1:3, "User"]
melihat2[1:3, User]

melihat[1:3, c("User", "Product")]
melihat2[1:3,.(User, Product)]

pesan[pesan$Price>80000, "Price"]
pesan2[Price>80000, Price]

pesan2_tnp_NA[,Rt2_Price:=Price/Quantity]


identical(pesan, pesan2)


pesan2[,mean(Price)]

pesan2[,mean(na.omit(Price))]

rata2pesan_user = pesan2[,mean(na.omit(Price)), User]

rata2pesan_user = pesan2[,.(mean_belanja = mean(na.omit(Price))), User]

rata2pesan_hari = pesan2[,.(mean_pemasukan = mean(na.omit(Price))), by=as.Date(Time)]

jml_belanja_pemesan = pesan2[,.(jml_pemasukan = sum(na.omit(Price)), jml_pemesan = length(unique(User))), by = as.Date(Time)]

rata2_belanja_hari = pesan2[,.(rata2pemasukan_peruser = sum(na.omit(Price))/uniqueN(User)), by = as.Date(Time)]

rata2pemasukan_produk = pesan2[,.(total_pemasukan = na.omit(sum(Price*Quantity))), by = .(as.Date(Time), Product)]

Frek_Produk_dibeli = pesan2[,.(Frek_dibeli = length(Action)), by=Product]
Frek_produk_dilihat = melihat2[,.(Frek_dilihat = length(Action)), by = Product]
data_gabung = merge(Frek_Produk_dibeli, Frek_produk_dilihat, by="Product")
data_gabung_full = merge(Frek_Produk_dibeli, Frek_produk_dilihat, by="Product", all = TRUE)
