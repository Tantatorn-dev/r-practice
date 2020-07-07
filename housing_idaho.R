# Getting and Cleaning Data: Quiz 1 

# download file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL,destfile = "./datasets/housing_idaho.csv",method="curl")

# read file
df <- read.csv("./datasets/housing_idaho.csv")
df

# How many properties are worth $1,000,000 or more?
# VAL must be 24
answer <- nrow(subset(df,VAL == 24))
answer
