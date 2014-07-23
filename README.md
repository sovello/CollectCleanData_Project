## Getting and Cleaning Data Course Project
This project is about cleaning data gathered through wearable computing devices.
The source data can be accessed from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
and the description about the data and all related information can be accessed from here. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data cleanup process is carried out by the R script *run_analysis.R* which manipulates the data and finally 
produces a data set that is saved in a separate file.

**run_analysis.R** does the following:
- Reads in the row data from the different source files and combines all these pieces into one large data set.

- Fetches out data that reports about the means for the different measurements including calculated measurements 
such as frequency.

- Gives meaningful labels for the activities that were involved in the study such as Walking, and Seating,

- Provides variables with descriptive names. These are names for the measurements being reported

- Since the variable names are kind of 'messy', then these are cleaned up into a format that is format for further processing

- The final cleaned data set is saved with the name *tidyActivityData.txt*

- The final cleaned data contains data about the for each observations per activity and the subject (the person who recorded this)
 
The codebook for the cleaned data is provided along with the script.
