datapesanan_16090137 = data_pesanan[,c(2,3,4,6,7,9,10,14,15,16,21)]

colnames(datapesanan_16090137) = c("ID Pesanan", "Tgl Pesanan", "Tgl Pengiriman", "ID Pemesan", "Nama Pemesan", "Negara", "Kota", "ID Produk", "Kategori", "Sub-Kategori", "Keuntungan")

datapesanan_16090137 = cbind(datapesanan_16090137, 'Lama Pesan' = (datapesanan_16090137$`Tgl Pengiriman` - datapesanan_16090137$`Tgl Pesanan`))

datapesanan_16090137_baru = datapesanan_16090137[datapesanan_16090137$Keuntungan < 0 & datapesanan_16090137$`Lama Pesan` > 3,]

write.xlsx(datapesanan_16090137_baru, file = "produkrugi_16090137.xlsx")