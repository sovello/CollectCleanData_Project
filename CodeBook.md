Human Activity Recognition Using Smartphones Data Set
=======================================================
The experiments have been carried out with a group of 30 volunteers (Subject as referred to in the dataset) within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were recorded at a constant rate of 50Hz. This data is being presented as averages of the different measurements both original and for some calculated variables.

This data is saved in a text file with a csv format. So, any spreadsheet processor can open this, however pay attention to different encodings. UTF-8 should open the file without any issues.

**There are currently 88 variables being reported in this data set**
Since these data (including the calculated variables) are centered certain manually measured variables, then a 
general definition is provided here for some of the variables to make it easy when you go through.

## General variables
**Below are definitions that would help you understand the different variables in the data as you are working on it.**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals 
* time_Acc-XYZ

* time_Gyro-XYZ 

These time domain signals (prefixed with 'time_') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

The acceleration signal was then separated into body and gravity acceleration signals 
* time_BodyAcc-XYZ 

* time_GravityAcc-XYZ

This was done using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (all variables with *Jerk*
* time_BodyAccJerk-XYZ and 

* time_BodyGyroJerk-XYZ

Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm 
* time_BodyAccMag 

* time_GravityAccMag 

* time_BodyAccJerkMag and

* time_BodyGyroJerkMag 

Fast Fourier Transform (FFT) was applied to some of these signals producing these variables prefixed with *frequency_*
* frequency_BodyAcc-XYZ
* frequency_BodyAccJerk-XYZ
* frequency_BodyGyro-XYZ
* frequency_BodyAccJerkMag
* frequency_BodyGyroMag
* frequency_BodyGyroJerkMag

These signals were used to estimate variables of the feature vector for each pattern:  

* Activity: This is the activity that was recorded for each volunteer

* Subject: This is an identifier for the volunteer who performed the different experiment

* angle: Angle between to vectors.

* meanFreq: Weighted average of the frequency components to obtain a mean frequency

*_XYZ* is used to denote 3-axial signals in the X, Y and Z directions and these signals and measurements were estimated using the mean and their standard deviation.

*mean* denotes a variable that was estimated using the mean() function and

*std* denotes a variable that was estimated using the std() function

* time_BodyodyAcc_XYZ
* time_GravityAcc_XYZ
* time_BodyodyAccJerk_XYZ
* time_BodyodyGyro_XYZ
* time_BodyodyGyroJerk_XYZ
* time_BodyAccMag
* time_GravityAccMag
* time_BodyAccJerkMag
* time_BodyGyroMag
* time_BodyGyroJerkMag
* frequency_BodyodyAcc_XYZ
* frequency_BodyodyAccJerk_XYZ
* frequency_BodyodyGyro_XYZ
* frequency_BodyodyAccMag
* frequency_BodyodyAccJerkMag
* frequency_BodyodyGyroMag
* frequency_BodyodyGyroJerkMag


These additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* time_BodyAccMean
* time_BodyAccJerkMean
* time_BodyGyroMean
* time_BodyGyroJerkMean
