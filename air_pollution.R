pollutantmean <- function(directory, pollutant, id=1:332) {
  
  sum <- 0
  count <- 0

  # loop through all ids
  for (i in id) {
    # create full path to csv 
    filepath <- sprintf("%s%03d.csv",directory,i)

    # read that csv
    df <- na.omit(read.csv(filepath))
   
    # update value
    sum <- sum + sum(df[pollutant])
    count <- count + length(df[pollutant])
    
  }
  
  print(sum/count)
  
}

pollutantmean("./datasets/specdata/","nitrate",70:72) 
