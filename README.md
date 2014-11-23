README for run_analysis.R script
--------------------------------
Author - Guillaume Le Mener

Requirements:  
        * The directoty "/UCI HAR Dataset/" must be present in your working directory with the Samsung data  
        * A working connection to Internet to download the "stringr" package if need be    
        * Install the script in your working directory  

Notes:  
        * The Samsung data can downloaded here:
        https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip   
        * The new data set will be created in your working directory with the follwing name
        "GLEMENER_test_results.txt"  
        
How to use the script?  
        * The script should be started from your R Studio console with source("./run_analysis.R")
        
How the script is working?  
        * The script itself contains comments to help understand the work done.  
        * From high level, multiple steps are required:  
        * Checking if the stringr package is installed  
        * Setting the working directory  
        * Loading the various files (8 total)  
        * 2 cbind() calls are performed on the X train and test sets with the subject and activity  
        * 1 rbind() call is performed to merge the new train and test sets created above  
        * New column names are created from the feature files and 2 column names added (subject, activity)  
        * Then, a new vector is created that match column names with ?-mean() or ?-std()  
        * A subset of data is created by using this index of columns and create the data set  
        * Finally, a new data set is created by aggregating the columns subject and activiy using the aggreate() function  
        * The file is created using the write.table() function with row.names=FALSE to make it cleaner to use  
        
The final new data set contains only 180 rows wich is equal to 30 subjects x 6 activity. This match the following description from the initial README - "The experiments have been carried out with a group of **30** volunteers within an age bracket of 19-48 years. Each person performed **six** activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist."  

CODE BOOK
---------

The first 2 columns are subject and activity.  

**Subject** represents 30 volunteers from 1 to 30. 

**Activity** represents the 6 possible values such as (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The rest are **features** selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  

The set of variables that were estimated from these signals are:  

mean(): Mean value  
std(): Standard deviation  

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  

gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  
  
The complete list of variables of each feature vector is available here:  
"subject"  
"activity"  
"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"  
"tBodyAcc-mean()-Z"  
"tBodyAcc-std()-X"  
"tBodyAcc-std()-Y"  
"tBodyAcc-std()-Z"  
"tGravityAcc-mean()-X"  
"tGravityAcc-mean()-Y"  
"tGravityAcc-mean()-Z"  
"tGravityAcc-std()-X"  
"tGravityAcc-std()-Y"  
"tGravityAcc-std()-Z"  
"tBodyAccJerk-mean()-X"  
"tBodyAccJerk-mean()-Y"  
"tBodyAccJerk-mean()-Z"  
"tBodyAccJerk-std()-X"  
"tBodyAccJerk-std()-Y"  
"tBodyAccJerk-std()-Z"  
"tBodyGyro-mean()-X"  
"tBodyGyro-mean()-Y"  
"tBodyGyro-mean()-Z"  
"tBodyGyro-std()-X"  
"tBodyGyro-std()-Y"  
"tBodyGyro-std()-Z"  
"tBodyGyroJerk-mean()-X"  
"tBodyGyroJerk-mean()-Y"  
"tBodyGyroJerk-mean()-Z"  
"tBodyGyroJerk-std()-X"  
"tBodyGyroJerk-std()-Y"  
"tBodyGyroJerk-std()-Z"  
"tBodyAccMag-mean()"  
"tBodyAccMag-std()"  
"tGravityAccMag-mean()"  
"tGravityAccMag-std()"  
"tBodyAccJerkMag-mean()"  
"tBodyAccJerkMag-std()"  
"tBodyGyroMag-mean()"  
"tBodyGyroMag-std()"  
"tBodyGyroJerkMag-mean()"  
"tBodyGyroJerkMag-std()"  
"fBodyAcc-mean()-X"  
"fBodyAcc-mean()-Y"  
"fBodyAcc-mean()-Z"  
"fBodyAcc-std()-X"  
"fBodyAcc-std()-Y"  
"fBodyAcc-std()-Z"  
"fBodyAccJerk-mean()-X"  
"fBodyAccJerk-mean()-Y"  
"fBodyAccJerk-mean()-Z"  
"fBodyAccJerk-std()-X"  
"fBodyAccJerk-std()-Y"  
"fBodyAccJerk-std()-Z"  
"fBodyGyro-mean()-X"  
"fBodyGyro-mean()-Y"  
"fBodyGyro-mean()-Z"  
"fBodyGyro-std()-X"  
"fBodyGyro-std()-Y"  
"fBodyGyro-std()-Z"  
"fBodyAccMag-mean()"  
"fBodyAccMag-std()"  
"fBodyBodyAccJerkMag-mean()"  
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-mean()"  
"fBodyBodyGyroMag-std()"  
"fBodyBodyGyroJerkMag-mean()"  
"fBodyBodyGyroJerkMag-std()"  



        