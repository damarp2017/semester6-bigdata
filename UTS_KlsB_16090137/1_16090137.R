karyawan = read.table('employees.csv', sep = ",")
gaji = read.table('salaries.csv', sep = ",")

install.packages("xlsx")
library(xlsx)

write.xlsx(karyawan, file = "karyawan_16090137.xlsx")
write.xlsx(gaji, file = "gaji_16090137.xlsx")

data_pesanan = read.xlsx("Sample - Superstore.xls", sheetIndex = 1, startRow = 1)
write.xlsx(data_pesanan, file = "datapesanan_16090137.xlsx")

datapesanan_16090137_baru = datapesanan_16090137[datapesanan_16090137$Keuntungan < 0 & datapesanan_16090137$`Lama Pesan` > 3,]

write.xlsx(datapesanan_16090137_baru, file = "produkrugi_16090137.xlsx")
