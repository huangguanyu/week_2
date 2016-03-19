complete <- function(directory,id = 1:332) {
  
  files<-list.files(directory, pattern ='*.csv',full.names = TRUE)
  
  obs_num <- vector(length=length(id),mode='numeric')
  
  #print(obs_num)
  
  
  for (i in 1:length(id)) {
    
    file <- files[id[i]]
    #print(file)
    
    single_obs<-read.csv(file,stringsAsFactors = FALSE,dec=".", as.is =  TRUE, sep =",")
    
    
    obs_num[i] <- sum(complete.cases(single_obs[,2:3]))
    

    
    #print(single_obs[,2]!= "NA"
    #print(obs_num[i])


  }
  
  
  data.frame(id, obs_num)

}