## run_analysis.R - Class 3
## Author - Guillaume Le Mener (glemener)
## Merge the training and the test sets to create one data set.

## IMPORTANT - requires stringr package

## PLEASE SETUP THE 2 DIRECTORIES HERE
working_dir <- "~/R/Class3/Results/"
data_dir <- "~/R/Class3/UCI HAR Dataset/"

## Check if the data directory is set and available
if (!file.exists(data_dir)) {
        stop("The data directory is not available.")
}        
## Setting file names variables
X_train_data_file <- str_c(data_dir,"train/X_train.txt")
y_train_labels_file <- str_c(data_dir, "train/y_train.txt")
subject_train_file <- str_c(data_dir, "train/subject_train.txt")

X_test_data_file <- str_c(data_dir,"test/X_test.txt")
y_test_labels_file <- str_c(data_dir, "test/y_test.txt")
subject_test_file <- str_c(data_dir,"test/subject_test.txt")

activity_labels_file <- str_c(data_dir, "activity_labels.txt")
features_file <- str_c(data_dir, "features.txt")

## Check if a working directoru that will contain the results is ready
## or set a new one instead
if (!file.exists(working_dir)) {
        dir.create(working_dir)
}

## PART 0 - Reading all the files required

## Reading the training set (resutls, subjects and labels)
if (file.exists(X_train_data_file)) {
        X_train_data <- read.table(X_train_data_file, sep="")
} else {
        stop(str_c("Missing file: ", X_train_data_file))
}

if (file.exists(y_train_labels_file)) {
        y_train_labels <- read.table(y_train_labels_file, sep="")
} else {
        stop(str_c("Missing file: ", y_train_lables_file))
}

if (file.exists(subject_train_file)) {
        subject_train <- read.table(subject_train_file, sep="")
} else {
        stop(str_c("Missing file: ", subject_train_file))        
}



## Reading the test set (resutls, subjects and labels)
if (file.exists(X_test_data_file)) {
        X_test_data <- read.table(X_test_data_file, sep="")
} else {
        stop(str_c("Missing file: ", X_test_data_file))
}

if (file.exists(y_test_labels_file)) {
        y_test_labels <- read.table(y_test_labels_file, sep="")
} else {
        stop(str_c("Missing file: ", y_test_lables_file))
}

if (file.exists(subject_test_file)) {
        subject_test <- read.table(subject_test_file, sep="")
} else {
        stop(str_c("Missing file: ", subject_test_file))        
}

## Reading the activity labels and features
## as.is = TRUE is critical here. Otherwise, there is a conversion to factors
if (file.exists(activity_labels_file)) {
        activity_labels <- read.table(activity_labels_file, sep="", as.is=TRUE)
} else {
        stop(str_c("Missing file: ", activity_labels_file))
}

if (file.exists(features_file)) {
        features <- read.table(features_file, sep="", as.is=TRUE)
} else {
        stop(str_c("Missing file: ", features_file))
}


## PART 1 - Merging the training and test sets
## First, adding the subjects and activity labels to each test and train data sets
test_data <- cbind(subject_test, y_test_labels, X_test_data)
train_data <- cbind(subject_train, y_train_labels, X_train_data)

## Then, merging both in one data set
data <- rbind(test_data, train_data)

## END OF PART 1
## -----------------------------------------


## PART 2 - Extracts ONLY the measurements on the mean and std deviation for each measurement
## First, need to rename the column name
## The first 2 columns are Subject and Label

colnames(data) <- c("subject", "activity", features[,2])

## IMPORTANT - the assumption here is that we are looking for features with ?-mean()? or ?-std()?
## in other words, any feature columns name that match a mean() or std() in their name is good

## building the vector of the right columns
mean_std_columns <- grep("\\-mean\\(\\)*|\\-std\\(\\)*", colnames(data))

## subset the data
## c(1:2) is here to keep the first 2 columns
data <- data[, c(1:2, mean_std_columns)]

## END OF PART 2
## -----------------------------------------

## PART 3 - Uses descriptive activty names to name the activity in the data
data[,2] <- activity_labels[data[,2],2]

## END OF PART 3
## -----------------------------------------

## PART 4 - Appropriately labels the data set with descriptive variable names
## in fact, it was done in the first part of Part 2 (see colnames() )

## END OF PART 4
## -----------------------------------------

## PART 5 - from the previous data set, create a second independant tidy data set
## with the average of each variable for each activity, and each subject
## Using Aggregate to compute the mean on each column expect for the 2 dimensions required
## Only the columns from 3:68 are variables - can be find with ncol(data)

new_data <- aggregate(x=data[,3:68], by=list(subject=data$subject, activity=data$activity), FUN=mean)

## this new data set should only have 180 rows = 30 subjects x 8 activity

## END OF PART 5
## -----------------------------------------

## Writing the new data set on file
write.table(new_data, file=str_c(working_dir,'GLEMENER_test_results.txt'), row.names=FALSE)



