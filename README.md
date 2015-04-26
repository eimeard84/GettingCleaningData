---
title: "README.md"
output: html_document
date: "04/26/2015"
author: eimeard84
---
This README document describes the functionality of the run_analysis.R script included in eimeard84/GettingCleaningData repository. 

This script should be in the same script as the data files found in the UCI HAR dataset. A zip file containing these data can be found at https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI%20HAR%20Dataset.zip. If necessary, line 2 of run_analysis.R can be uncommented to unzip the data set. 

The following files are used in creating a clean data set: 

- X_test.txt
- X_train.txt

The sets of measurements made during the test and during the training period. To extract only the mean and standard deviation of each measurement, only columns 1-6 (MeanXAccel, MeanYAccel, MeanZAccel, StdXAccel, StdYAccel, StdZAccel) and 121-126 (MeanXGyro, MeanYGyro, MeanZGyro, StdXGyro, StdYGyro, StdZGyro) are extracted. 

- y_test.txt
- y_train.txt

A record of which activity from a list of 6 (Walking, WalkingUpStairs, WalkingDownStairs, Sitting, Standing, Laying) a subject was engaged in when a particular measurement was made. 

- subject_test.txt
- subject_train.txt

A record of the subject ID to which each measurement relates. 

The data are processed to create six tables (one per activity type) with 30 rows (one per subject) and 12 columns (one per mean/standard deviation measurement type). These tables give the mean values of each mean/standard deviation measurement type for each subject and activity. 

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
