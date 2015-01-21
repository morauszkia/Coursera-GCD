## Create directory and download the zip file
if (!file.exists("courseproject")) {
        dir.create("courseproject")
}
setwd("./courseproject/")
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile="data.zip")
## unzip the files and read them
unzip("data.zip")
## Read training data files
training <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainsub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainvar <- read.table("./UCI HAR Dataset/train/Y_train.txt")
## Read test data files
testing <- read.table("./UCI HAR Dataset/test/X_test.txt")
testsub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testvar <- read.table("./UCI HAR Dataset/test/Y_test.txt")
## Merge training and test data
traindata <- cbind(trainsub, trainvar, training)
testdata <- cbind(testsub, testvar, testing)
data <- rbind(traindata, testdata)
## Add variable names (using provided features.txt)
variables <- read.table("./UCI HAR Dataset/features.txt")
varnames <- c("Subject", "Activity", as.character(variables[,2]))
names(data) <- varnames
## Create indeces for subsetting
indexmean <- grep("*-mean(*", x=varnames)
indexstd <- grep("*-std(*", x=varnames)
## Subset
data <- data[,sort(c(1, 2, indexmean, indexstd))]
## Adding labels to activity variable from activity_labels.txt
act <- read.table("./UCI HAR Dataset/activity_labels.txt")
data$Activity <- factor(data2$Activity, levels=1:6, labels=act[,2])
## Compute the average of each variable for each subject and activity
library(dplyr)
by_subact <- group_by(data, Subject, Activity)
tidydata <- by_subact %>% summarise_each(funs(mean))