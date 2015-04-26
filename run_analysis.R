 run_analysis <- function(){
  #unzip("UCI HAR dataset.zip",junkfiles=TRUE)
  
  file.remove("CleaningDataProject.txt")
  library(plyr)
  
  test_activity <- read.table("y_test.txt")
  train_activity <- read.table("y_train.txt")
  # Label of activity 1-6
  test_id <- read.table("subject_test.txt")
  train_id <- read.table("subject_train.txt")
  # Label of subject 1-30
  test_data <- read.table("X_test.txt")
  train_data <- read.table("X_train.txt")
  # Table of data
  
  #Combine the test and training data into a single data set
  combined_activity <- rbind(test_activity,train_activity)
  combined_id <- rbind(test_id,train_id)
  combined_data <- rbind(test_data,train_data)
  
  table_names <- c("Walking","WalkingUpStairs",
                   "WalkingDownStairs","Sitting","Standing","Laying")
  # Make a factor out of the activity ID, with accurate labels
  factor_id <- factor(combined_activity$V1,labels=table_names)
  
  # Select only the mean and standard deviation values of each measurement
  variable_indices <- c(1,2,3,4,5,6,41,42,43,44,45,46,121,122,123,124,125,126)
  variable_labels <- c("MeanXAccel","MeanYAccel","MeanZAccel","StdXAccel",
                       "StdYAccel","StdZAccel","MeanXGrav","MeanYGrav",
                       "MeanZGrav","StdXGrav","StdYGrav","StdZGrav","MeanXGyro",
                       "MeanYGyro","MeanZGyro","StdXGyro","StdYGyro","StdZGyro")
  extracted_data <- combined_data[,variable_indices]
  names(extracted_data) <- variable_labels
  # Add the ID tags for the activity (factor_id) and the subject (subject_id)
  extracted_data$factor_id <- combined_activity$V1
  extracted_data$subject_id <- combined_id$V1
  
  # Sort the data according to the activity being carried out
  sorted_data <- arrange(extracted_data,factor_id)
  
  # Split the sorted data into a list of six new data frames based on 
  # the activity being carried out
  activity_tables <- split(sorted_data,sorted_data$factor_id)
  
  for (i in 1:6){
    final <- data.frame(c(1:30))
    names(final) <- c("subject_id")
    # Pull the table for the ith activity from the list and group it by subject ID
    c <- activity_tables[i]
    d <- group_by(c[[as.character(i)]],subject_id)
    for (j in 1:18){
      # Create a command which will summarise the jth variable in the grouped
      # data frame based on subject ID, and save the mean value of that 
      # variable in a new data frame
      b = paste("intermediate <- ddply(d,.(subject_id),summarize,",variable_labels[j],
               "=mean(",variable_labels[j],"))",sep='')
     eval(parse(text=b))
     # Add each of the columns in turn to the tidy data set
     final <- merge(final,intermediate,by="subject_id")
     }
    
    # Print tidy data set to text file
    write(table_names[i],"CleaningDataProject.txt",append=TRUE)
    write.table(format(final,digits=4),"CleaningDataProject.txt",append=TRUE,row.names=FALSE,
                col.names=TRUE, quote=FALSE, sep="\t")
    write("\n","CleaningDataProject.txt",append=TRUE)
  }

}