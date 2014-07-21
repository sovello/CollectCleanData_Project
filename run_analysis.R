##first part: load and merge the data sets

#load the train data
trainData <- read.table("train/X_train.txt")

#load the traind data labels
trainDataLabels <- read.table("train/y_train.txt")

#give a descriptive name to labels
colnames(trainDataLabels) <- c("Activity")

#label the traindata
labelledTrainData <- cbind(trainDataLabels,trainData)

#load the test data
testData <- read.table("test/X_test.txt")

#load the test data labels
testDataLabels <- read.table("test/y_test.txt")

#give a descriptive name to labels
colnames(testDataLabels) <- c("Activity")

#label the traindata
labelledTestData <- cbind(testDataLabels,testData)

#merge the two data sets into one
mergedActivityDataSet <- rbind(labelledTrainData, labelledTestData)

##end of first part

##second part: extract the measurements for mean and standard deviation

#labeling all the variables
##first we load the features
features <- read.table("features.txt", colClasses="character")

#change the column names for the mergedActivityDataSet to codified descriptive names from features
colnames(mergedActivityDataSet) <- c("Activity", features$V2)

##extract features that record mean
meanFeatures <- grep("mean",features$V2, value=T, ignore.case=T)

##extract features that record standard deviation
stdFeatures <- grep("std",features$V2, value=T, ignore.case=T)

##combine the column/variable names we need from the merged data
allFeatures <- c("Activity", meanFeatures, stdFeatures)

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
meanSTDActivityDataSet


#end of third part