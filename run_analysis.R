# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms 
# to attract new users. The data linked to from the course website represent data collected 
# from the accelerometers from the Samsung Galaxy S smartphone. A full description is available 
# at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# You should create one R script called run_analysis.R that does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with 
#    the average of each variable for each activity and each subject.

# load required package
library(dplyr)

# get files
filename <- "Data/UCI-HAR-Dataset.zip"

# Checking if archieve already exists.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  

# Checking if folder exists
if (!file.exists("Data/UCI HAR Dataset")) { 
        unzip(filename, exdir="Data") 
}

# assigning all data frames
features <- read.table("Data/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("Data/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("Data/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("Data/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("Data/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("Data/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("Data/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("Data/UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Step 1: Merges the training and the test sets to create one data set. 
# Use command rbind to combine training and test set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
# Use grep command to get column indexes for variable name contains "mean()" or "std()"
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# Step 3: Uses descriptive activity names to name the activities in the data set 
# Convert activity labels to characters and add a new column as factor
TidyData$code <- activities[TidyData$code, 2]

# Step 4: Appropriately labels the data set with descriptive variable names. 
# Give the selected descriptive names to variable columns
names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# Step 5: From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject. 
# Use pipeline command to create a new tidy dataset with command group_by 
# and summarize_each in dplyr package
Final_TidyData <- TidyData %>%
        group_by(subject, activity) %>%
        summarise_all(list(mean))
write.table(FinalData, "Data/Final_TidyData.txt", row.name=FALSE)

# Checking variable names and the the final data
str(Final_TidyData)
Final_TidyData
