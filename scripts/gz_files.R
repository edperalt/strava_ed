library(R.utils)
#gunzip("file.gz", remove=FALSE)

setwd("raw_data/Strava_data_Jan_2021/activities/")
# file_list <- list.files(path="raw_data/Strava_data_Jan_2021/activities/")
archivos<-  list.files(path = ".", pattern = ".gz")



i<-1

for ( val in archivos) {
gunzip(archivos[i])
  i<- i+1
}
