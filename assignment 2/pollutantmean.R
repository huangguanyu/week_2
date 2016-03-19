pollutantmean <- function(directory, pollutant, id =1:332){
#read files
  files<-list.files(directory, pattern ='*.csv',full.names = TRUE)
  
  
  for (i in id) {
    
    single_data<-read.csv(files[i],stringsAsFactors = FALSE,dec=".", as.is =  TRUE, sep =",")
    
    pol <-(colnames(single_data) == pollutant)
    
    single_obs <- single_data[!is.na(single_data[,pol]),pol]
    
    
    if (i == id[1]) {
      
      total_obs <- single_obs
      
    }
    
    if (i > id[1]) {
      
      total_obs<- c(total_obs,single_obs)
    }
    

  }
   
  mean(total_obs)


}
  