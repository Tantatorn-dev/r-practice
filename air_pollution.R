# first programming assignment

# part 1
pollutantmean <- function(directory, pollutant, id=1:332) {
  
  sum <- 0
  count <- 0

  # loop through all ids
  for (i in id) {
    # create full path to csv 
    filepath <- sprintf("%s%03d.csv",directory,i)

    # read that csv
    df <- read.csv(filepath)
    col <- na.omit(df[pollutant])
   
    # update value
    sum <- sum + sum(col)
    count <- count + nrow(col)
    
  }
  
  print(sum/count)
  
}

# part 2
complete <- function(directory, id=1:332) {
  
  # empty nobs vector
  nobs <- c()
  
  # loop through all ids
  for (i in id) {
    # create full path to csv 
    filepath <- sprintf("%s%03d.csv",directory,i)
    
    # read that csv
    df <- read.csv(filepath)
    df <- na.omit(df)
    
    # append value
    nobs <- c(nobs,nrow(df))
    
  }
  
  df <- data.frame(id,nobs)
  df <- setNames(df,c("id","nobs"))
  df
  
}

# part 3
corr <- function(directory, threshold = 0) {
  
  id <- 1:332
  corr_vec <- c()
  
  # loop through all ids
  for (i in id) {
    
    if ( complete(directory,i)['nobs'] > threshold ) {
      # create full path to csv 
      filepath <- sprintf("%s%03d.csv",directory,i)
      
      # read that csv
      df <- read.csv(filepath)
      df <- na.omit(df)
      sulfate <- df['sulfate']
      nitrate <- df['nitrate']
      
      # compute correlation
      corr <- cor(sulfate,nitrate)
      corr_vec <- c(corr_vec,corr)
      
    }
    
  }
  
  corr_vec
  
}

pollutantmean("./datasets/specdata/","nitrate",23) 
complete("./datasets/specdata/",30:25) 
cr <- corr("./datasets/specdata/", 400)
head(cr)
summary(cr)
