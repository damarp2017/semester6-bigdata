install.packages("dplyr")
install.packages("rvest")
install.packages("purrr")
library(dplyr)
library(rvest)
library(purrr)
url_kompas = "https://news.kompas.com/search/2019-04-09"
berita_kompas = map_df(1:10, function(i){
  page = read_html(sprintf(url_kompas, i))
  data.frame(Judul=html_text(html_nodes(page, ".article__link")), Waktu=html_text(html_nodes(page, ".article__date")))
})

berita_kompas$Waktu = as.character(berita_kompas$Waktu)
berita_kompas$Waktu = substr(berita_kompas$Waktu, 13, 21)


berita_detik = map_df(1:10, function(i){
  page = read_html(sprintf("https://news.detik.com/indeks/all/%i?date=04/09/2019", i))
  data.frame(Judul=html_text(html_nodes(page, "h2")), Waktu=html_text(html_nodes(page, ".mb5")))
})

berita_detik$Waktu = as.character(berita_detik$Waktu)
berita_detik$Waktu = substr(berita_detik$Waktu, 22, 31)

waktu_detik = berita_detik$Waktu
waktu_kompas = berita_kompas$Waktu

install.packages("plyr")
library(plyr)
gabung=join(berita_detik, berita_kompas, by="Waktu")
