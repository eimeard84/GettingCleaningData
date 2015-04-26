---
title: "CodeBook"
author: "eimeard84"
date: "04/26/2015"
output: html_document
---

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The measurements from the training and experimental periods were read in from X_train.txt and X_test.txt. These data were combined into a single data set, from which the following variables were extracted (number indicates column within the combined data set): 

- 1 tBodyAcc-mean()-X
- 2 tBodyAcc-mean()-Y
- 3 tBodyAcc-mean()-Z
- 4 tBodyAcc-std()-X
- 5 tBodyAcc-std()-Y
- 6 tBodyAcc-std()-Z
- 41 tGravityAcc-mean()-X
- 42 tGravityAcc-mean()-Y
- 43 tGravityAcc-mean()-Z
- 44 tGravityAcc-std()-X
- 45 tGravityAcc-std()-Y
- 46 tGravityAcc-std()-Z
- 121 tBodyGyro-mean()-X
- 122 tBodyGyro-mean()-Y
- 123 tBodyGyro-mean()-Z
- 124 tBodyGyro-std()-X
- 125 tBodyGyro-std()-Y
- 126 tBodyGyro-std()-Z

The extracted data set was then split into a list of six data frames, one for each type of activity (Walking, Walking Up Stairs, Walking Down Stairs, Sitting, Standing, Laying). The mean value of each extracted measurement was calculated for each of the 30 test subjects. Six tables were then printed to the "CleaningDataProject.txt" file, one for each activity type. Each of these tables had 30 rows (one per test subject) and 18 columns (one per extracted measurement). 

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

Portions of this CodeBook have been reproduced from documents which can be found in the aforementioned data set. Please see README.md for information on how to acquire the data set used in this study. 