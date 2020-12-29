# Code Book

The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

1. ## Download the dataset
- Dataset downloaded and extracted under the folder called UCI HAR Dataset:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

2. ## Assign each data to variables
- <code>features <- features.txt</code> : 561 rows, 2 columns<br>
  The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
- <code>activities <- activity_labels.txt</code> : 6 rows, 2 columns<br>
  List of activities performed when the corresponding measurements were taken and its codes (labels)
- <code>subject_test <- test/subject_test.txt</code> : 2947 rows, 1 column<br>
  Contains test data of 9/30 volunteer test subjects being observed
- <code>x_test <- test/X_test.txt</code> : 2947 rows, 561 columns<br>
  Contains recorded features test data
- <code>y_test <- test/y_test.txt</code> : 2947 rows, 1 columns<br>
  Contains test data of activities’code labels
- <code>subject_train <- test/subject_train.txt</code> : 7352 rows, 1 column<br>
  Contains train data of 21/30 volunteer subjects being observed
- <code>x_train <- test/X_train.txt</code> : 7352 rows, 561 columns<br>
  Contains recorded features train data
- <code>y_train <- test/y_train.txt</code> : 7352 rows, 1 columns<br>
  Contains train data of activities’code labels

3. ## Merges the training and the test sets to create one data set
- <code>X</code> (10299 rows, 561 columns) is created by merging <code>x_train</code> and <code>x_test</code> using <code>rbind()</code> function
- <code>Y</code> (10299 rows, 1 column) is created by merging <code>y_train</code> and <code>y_test</code> using <code>rbind()</code> function
- <code>Subject</code> (10299 rows, 1 column) is created by merging <code>subject_train</code> and <code>subject_test</code> using <code>rbind()</code> function
- <code>Merged_Data</code> (10299 rows, 563 column) is created by merging <code>Subject</code>, <code>Y</code> and <code>X</code> using <code>cbind()</code> function

4. ## Extracts only the measurements on the mean and standard deviation for each measurement
- <code>TidyData</code> (10299 rows, 88 columns) is created by subsetting <code>Merged_Data</code>, selecting only columns: <code>subject</code>, <code>code</code> and the measurements on the <code>mean</code> and standard deviation (<code>std</code>) for each measurement

5. ## Uses descriptive activity names to name the activities in the data set
- Entire numbers in code column of the <code>TidyData</code> replaced with corresponding activity taken from second column of the <code>activities</code> variable

6. ## Appropriately labels the data set with descriptive variable names
- Code column in <code>TidyData</code> renamed into <code>activities</code>
- All <code>Acc</code> in column’s name replaced by <code>Accelerometer</code>
- All <code>Gyro</code> in column’s name replaced by <code>Gyroscope</code>
- All <code>BodyBody</code> in column’s name replaced by <code>Body</code>
- All <code>Mag</code> in column’s name replaced by <code>Magnitude</code>
- All start with character <code>f</code> in column’s name replaced by <code>Frequency</code>
- All start with character <code>t</code> in column’s name replaced by <code>Time</code>

7. ## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
- <code>FinalData</code> (180 rows, 88 columns) is created by sumarizing <code>TidyData</code> taking the means of each variable for each activity and each subject, after groupped by subject and activity.
- Export FinalData into <code>FinalData.txt</code> file.
