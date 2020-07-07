# Getting and Cleaning Data: Quiz 1 

# download file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileURL,destfile = "./datasets/weekly_sst.for",method="curl")

# read file
x <- read.fwf(
  file="./datasets/weekly_sst.for",
  skip=4,
  widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4))
head(x)

sum(x$V4)
