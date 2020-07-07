# Getting and Cleaning Data: Quiz 1 

# download file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL,destfile = "./datasets/natural_gas_acquisition.xlsx",method="curl")

# read file
library("readxl")
df <- read_excel("./datasets/natural_gas_acquisition.xlsx")
df

# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
dat <- df[17:22,6:14]
names(dat) <- as.matrix(dat[1, ])
dat <- dat[-1, ]
dat[] <- lapply(dat, function(x) type.convert(as.character(x)))
sum(dat$Zip*dat$Ext,na.rm=T)
