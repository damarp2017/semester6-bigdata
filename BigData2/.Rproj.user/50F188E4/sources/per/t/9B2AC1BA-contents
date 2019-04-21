karyawan = read.csv('chapter3/employees.csv', header = TRUE)
gaji = read.csv('chapter3/salaries.csv', header = TRUE)

names(karyawan)
names(gaji)

names(karyawan) = c("ID", "Tanggal Lahir", "Nama Depan", "Nama Belakang", "Jenis Kelamin", "Tanggal Mulai Kerja")
colnames(gaji) = c("ID", "Gaji", "Mulai Kerja", "Akhir Kerja")

str(karyawan)

karyawan$`Tanggal Lahir` = as.Date(karyawan$`Tanggal Lahir`)
karyawan$`Tanggal Mulai Kerja` = as.Date(karyawan$`Tanggal Mulai Kerja`)


karyawan$`Nama Depan` = as.character(karyawan$`Nama Depan`)
karyawan$`Nama Belakang` = as.character(karyawan$`Nama Belakang`)

karyawan$`Jenis Kelamin` = as.factor(karyawan$`Jenis Kelamin`)


str(gaji)

gaji$`Mulai Kerja` = as.Date(gaji$`Mulai Kerja`)
gaji$`Akhir Kerja` = as.Date(gaji$`Akhir Kerja`)


karyawan$`Tanggal Mulai Kerja`+30
karyawan$`Tanggal Mulai Kerja` - karyawan$`Tanggal Lahir`
difftime(karyawan$`Tanggal Mulai Kerja`, karyawan$`Tanggal Lahir`, units = "weeks")


install.packages("lubridate")
library(lubridate)

time_tahun = interval(ymd(karyawan$`Tanggal Lahir`), ymd(karyawan$`Tanggal Mulai Kerja`))
time_tahun = as.period(time_tahun)
year(time_tahun)
now()
usia = interval(ymd(karyawan$`Tanggal Lahir`), now())
usia = as.period(usia)
year(usia)


karyawan = rbind(karyawan, c(10011, "1990-06-28", "Budi", "Santoso", "M", "2019-01-01"))
karyawan = cbind(karyawan, Posisi = NA)
waktu = interval(ymd(karyawan$`Tanggal Lahir`), now())
waktu = as.period(waktu)
karyawan = cbind(karyawan, Usia=year(waktu))


head(karyawan, 3)
tail(karyawan, 4)
karyawan[4:6,]
karyawan[2:5, 2:4]
karyawan[c(2,5), c(1,3)]
karyawan[1:3, c("ID", "Nama Depan")]
karyawan[,-8]
karyawan[-1,]
karyawan[karyawan$`Jenis Kelamin` == 'M',]
gaji[gaji$Gaji >= 60000 & gaji$Gaji < 70000, ]
karyawan[substr(karyawan$`Nama Depan`,0,2)=="Be",]


karyawan$'Nama Karyawan' = paste(karyawan$`Nama Depan`, karyawan$`Nama Belakang`)
karyawan_gaji = merge(karyawan, gaji, by="ID")


a = c(5,1,4,3,2,6,3)
sort(a)
sort(a, decreasing = TRUE)

order(a)
order(a, decreasing = TRUE)
sortir_gaji = gaji[order(gaji$Gaji, decreasing = TRUE),]
sortir_gaji2 = gaji[order(gaji$Gaji, gaji$`Mulai Kerja`, decreasing = TRUE),]


install.packages("reshape2")
library(reshape2)

gaji_pertahun = dcast(gaji, ID ~ year(ymd(`Mulai Kerja`)), value.var = "Gaji")



gaji_pertahun2 = dcast(karyawan_gaji, ID + 'Nama Karyawan' ~ year(ymd(`Mulai Kerja`)), value.var = "Gaji")
balik_gajiPertahun = melt(gaji_pertahun, id.vars = c("ID"), variable.name = "Tahun Mulai Kerja", value.name = "Gaji")
balik_gajiPertahun_noNA = na.omit(balik_gajiPertahun)


gaji[gaji$`Akhir Kerja` > "2100-01-01",]
gaji[gaji$`Akhir Kerja` > "2100-01-01", "Akhir Kerja"] = NA

is.na(gaji$`Akhir Kerja`)
sum(is.na(gaji$`Akhir Kerja`))
sum(is.na(gaji$`Akhir Kerja`))/length(gaji$`Akhir Kerja`)


