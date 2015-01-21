---
title: "CodeBook"
author: "András Morauszki"
date: "Monday, January 19, 2015"
output: html_document
---

For the tidy data I used the following .txt files from the zip package:
UCI HAR Dataset/test/subject_test.txt - to identify the subjects
                     X_test.txt - these are the measurements themselves
                     Y_test.txt - the activities
UCI HAR Dataset/train/subject_train.txt - the subject variable
                      X_train.txt - the measurements
                      Y_train - the activities performed

I named the variables using /UCI HAR Dataset/features.txt
I labeled the activities using /UCI HAR Dataset/activity_labels.txt

I merged the txt files in the test and train folder first using the *cbind* command, to merge the subject, performed activity and the measurements. Then using *rbind* I merged the training and testing data frame.

I named the variables using features.txt, as I've found it descriptive. The first two variables were named 'Subject' and 'Activity'.

The tidy dataset contains the means for all mean and std measurements for every subject and activity. I used the 'dplyr' packade for grouping the data frame based on the subject id and activity and then to summarize (calculate the mean) each column. There are six rows for each subject - one for each activity. E.g. Subject=1, Activity=Walking means, that this row contains the mean measurements for subject No.1 for walking.

The names of the variables consist of the following parts:
*t* or *f* for indicating, it it's measuring time domain or frequency signals
*Body* or *Gravity* to separate Body acceleration and Gravity acceleration signals
*Acc* and *Gyro*  shows if the measurement comes from the accelerometer or the gyroscope
*Jerk* denotes that the variable measures Jerk signals
*X*, *Y* or *Z* indicate on which axis the measurement was taken
*-mean()-* indicates, that the variable is the averaging of the mean values
*-std()-* indicates, that the variable measures the average of the standard deviation values

For more info see /UCI HAR Dataset/features_info.txt!



