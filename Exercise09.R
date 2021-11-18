
###Write a function that takes a directory name as an argument called dir plus any other arguments requried to
####accomplish the specified task.
#####function should read data from each file in the specified directory and calculate the coefficient of variation
####(standard deviation divided by the mean) for a user specified column
####These values should be returned as a vector.
##### Give warningif 50 observations are not present in a file.

file = function(dir,c){
  
  path1=list.files(dir)
  ### define return vector
  answer = vector(mode="numeric", length(path1))
  
  ## initializing loop to read data from each file of user specified directory
  for(i in 1: length(path1)){
  
  file_name= paste(dir, path1[i], sep="/") #### concatenating file path address
  ### read data from file
  data=read.table(file_name,header = TRUE, sep = ",",stringsAsFactors = FALSE)
     
  
  if (length(data[,c])>50){
    answer[i]= (sd(data[,c])/mean(data[,c]))*100 ## calculating coefficient of variation
    
  }else{
    
    print(paste0("Error: This file ",path1[i],"  has less then 50 observation"))
   return() ### return function output
  }

    
  }
return(answer) ### return function output
  }



#### getting input from users about directory and coloum no

print("Enter the directory address")
dirA<- readline(prompt="Enter the directory address") 
  
##a="C:/Users/Tahir Irshad/Desktop/dir" ### sample directory address

print("Enter column no for which you want to calculate the coefficient of variation")
input<- readline(prompt=" Coloum No") 

y=file(dirA,strtoi(input)) ### output from function





