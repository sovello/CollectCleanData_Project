##first part: load and merge the data sets

#load the train data
trainData <- read.table("train/X_train.txt")

#load the train data labels
trainDataLabels <- read.table("train/y_train.txt")

#load the train subjects
trainSubjects <- read.table("train/subject_train.txt")
colnames(trainSubjects) <- c("Subject")

#give a descriptive name to labels
colnames(trainDataLabels) <- c("Activity")

#label the traindata
labelledTrainData <- cbind(trainDataLabels,trainSubjects, trainData)

#load the test data
testData <- read.table("test/X_test.txt")

#load the test data labels
testDataLabels <- read.table("test/y_test.txt")


#load the test subjects
testSubjects <- read.table("test/subject_test.txt")
colnames(testSubjects) <- c("Subject")

#give a descriptive name to labels
colnames(testDataLabels) <- c("Activity")

#label the traindata
labelledTestData <- cbind(testDataLabels,testSubjects, testData)

#merge the two data sets into one
mergedActivityDataSet <- rbind(labelledTrainData, labelledTestData)

##end of first part

##second part: extract the measurements for mean and standard deviation
##this takes part of the fourth part, since we are giving the descriptive names (features)
##which are also required for part four of this assignment

#labeling all the variables
##first we load the features
features <- read.table("features.txt", colClasses="character")

#change the column names for the mergedActivityDataSet to codified descriptive names from features
colnames(mergedActivityDataSet) <- c("Activity", "Subject", features$V2)

##extract features that record mean
meanFeatures <- grep("mean",features$V2, value=T, ignore.case=T)

##extract features that record standard deviation
stdFeatures <- grep("std",features$V2, value=T, ignore.case=T)

##combine the column/variable names we need from the merged data
allFeatures <- c("Activity", "Subject", meanFeatures, stdFeatures)

#Extracting only the measurements on the mean and standard deviation for each measurement.
meanSTDActivityDataSet <- mergedActivityDataSet[, allFeatures ]

##end of second part

##third part: labelling the activities

#read in the activity_labels (V1: indices, V2: descriptions)
activity_labels <- read.table("activity_labels.txt", header=F, colClasses="character")

#create a counter to loop through all the Activities
counter <- 1:length(meanSTDActivityDataSet$Activity)

#loop through each of the activity and change their value to descriptive
for(i in counter){
  #meanSTDActivityDataSet$Activity[i] is a number such as 4, 2, or 1 
  ##and so activity_labels[4,2] returns the descriptive activity
  meanSTDActivityDataSet$Activity[i] <- activity_labels[meanSTDActivityDataSet$Activity[i],2]
  i <- i+1 #increment the counter
}
##after here: meanSTDActivityDataSet has both descriptive activity names and descriptive variable names.
##the definitions for the variables will be in the codebook
#end of third part

##part five: Creating an independent tidy data set with the average of each variable for each activity and each subject.
#coalesce all the rows into the 6 distinctive activities
#for tidy data: variables are unique (which already are, observations are unique, need to bring these to six)
#extract data for each of the activities as separate data frames

headers <- allFeatures[3:length(allFeatures)]
##wide is tidy
tidyActivityMeanSTDData <- aggregate(meanSTDActivityDataSet[,headers], 
                                     by=list(meanSTDActivityDataSet$Subject,meanSTDActivityDataSet$Activity),
                                     data=meanSTDActivityDataSet, 
                                     FUN=mean)

##let's format the variable names:
tidyHeaders <- c()
for(header in allFeatures){
  nobracket <- gsub("[()]", "", header)
  nobodybody <- gsub("BodyBody","Body", nobracket)
  nodash <- gsub("-","_",nobodybody)
  not <- gsub("^t","time_",nodash)
  nof <- gsub("^f","frequency_",not)
  tidyHeaders <- c(tidyHeaders, nof)
}
#rename column names
colnames(tidyActivityMeanSTDData) <- tidyHeaders
#write the data
write.table(tidyActivityMeanSTDData,file="tidyActivityData.txt", sep=",")