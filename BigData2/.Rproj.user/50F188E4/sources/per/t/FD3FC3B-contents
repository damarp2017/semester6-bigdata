install.packages("dplyr")
install.packages("rvest")
install.packages("purrr")
library(dplyr)
library(rvest)
library(purrr)
url_kompas = "https://news.kompas.com/search/2019-03-20"
berita_kompas = map_df(1:4, function(i){
  page = read_html(sprintf(url_kompas, i))
  data.frame(Judul=html_text(html_nodes(page, ".article__link")), Waktu=html_text(html_nodes(page, ".article__date")))
})

