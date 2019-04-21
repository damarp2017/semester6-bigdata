install.packages("xlsx")
library(xlsx)
data_pesanan = read.xlsx('Sample - Superstore.xls', sheetIndex = 1, startRow = 1)
filter_16090137 = data_pesanan[,c("Row.ID", "Order.Date", "Customer.Name")]
write.xlsx(filter_16090137, file = "filter_16090137.xlsx")
