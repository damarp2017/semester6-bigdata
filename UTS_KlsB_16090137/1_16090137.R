karyawan = read.table('employees.csv', sep = ",")
gaji = read.table('salaries.csv', sep = ",")

install.packages("xlsx")
library(xlsx)

write.xlsx(karyawan, file = "karyawan_16090137.xlsx")
write.xlsx(gaji, file = "gaji_16090137.xlsx")

data_pesanan = read.xlsx("Sample - Superstore.xls", sheetIndex = 1, startRow = 1)
write.xlsx(data_pesanan, file = "datapesanan_16090137.xlsx")


