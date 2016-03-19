corr <- function(directory, threshold =1) {
  
  
  obs <- complete(directory,id= 1:332)
  
  cor_id <- obs[,1]
  obs_num <- obs[,2]
  pass_num <- sum(obs_num > threshold )
  
  print(pass_num)
  files<-list.files(directory, pattern ='*.csv',full.names = TRUE)
  
  if (pass_num > 0 ) {
    
    cr <- vector(mode = 'numeric', length = pass_num)
    
    
    aa <- cor_id[obs_num > threshold]
    
    for (i in 1:length(aa)) {
      
      single_obs<-read.csv(files[aa[i]],stringsAsFactors = FALSE,dec=".", as.is =  TRUE, sep =",")
      
      no <- single_obs[,2]
      so <- single_obs[,3]
      #print(no[!is.na(no)])
      cr[i] <- cor(no,so, use="complete.obs")
      
    }
    
    
    
  } else {
    
    cr <- vector('numeric',length =0)
  }
  
  
  cr
}