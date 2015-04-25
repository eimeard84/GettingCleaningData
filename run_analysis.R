run_analysis <- function(){
  #unzip("UCI HAR dataset.zip",junkfiles=TRUE)
  
  file.remove("CleaningDataProject.txt")
  library(dplyr)
  
  test_activity <- read.table("y_test.txt")
  train_activity <- read.table("y_train.txt")
  # Label of activity 1-6
  test_id <- read.table("subject_test.txt")
  train_id <- read.table("subject_train.txt")
  # Label of subject 1-30
  test_data <- read.table("X_test.txt")
  train_data <- read.table("X_train.txt")
  # Table of data
  
  combined_activity <- rbind(test_activity,train_activity)
  combined_id <- rbind(test_id,train_id)
  combined_data <- rbind(test_data,train_data)
  
  table_names <- c("Walking","WalkingUpStairs",
                   "WalkingDownStairs","Sitting","Standing","Laying")
  
  factor_id <- factor(combined_activity$V1,labels=table_names)
  
  variable_indices <- c(1,2,3,4,5,6,121,122,123,124,125,126)
  variable_labels <- c("MeanXAccel","MeanYAccel","MeanZAccel","MeanXGyro",
  "MeanYGyro","MeanZGyro","StdXAccel","StdYAccel","StdZAccel","StdXGyro",
  "StdYGyro","StdZGyro")
  extracted_data <- combined_data[,variable_indices]
  names(extracted_data) <- variable_labels
  extracted_data$factor_id <- combined_activity$V1
  extracted_data$subject_id <- combined_id$V1
  
  sorted_data <- arrange(extracted_data,factor_id)
  
  activity_tables <- split(sorted_data,sorted_data$factor_id)
  
  for (i in 1:6){
    final <- data.frame(c(1:30))
    names(final) <- c("subject_id")
    c <- activity_tables[i]
    d <- group_by(c[[as.character(i)]],subject_id)
    for (j in 1:12){
      b = paste("intermediate <- ddply(d,.(subject_id),summarize,",variable_labels[j],
               "=mean(",variable_labels[j],"))",sep='')
     eval(parse(text=b))
    final <- merge(final,intermediate,by="subject_id")
     }
    
    write(table_names[i],"CleaningDataProject.txt",append=TRUE)
    write.table(format(final,digits=4),"CleaningDataProject.txt",append=TRUE,row.names=FALSE,
                col.names=TRUE, quote=FALSE, sep="\t")
    write("\n","CleaningDataProject.txt",append=TRUE)
  }

}