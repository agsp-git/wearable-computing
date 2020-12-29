# Getting and Cleaning Data Course Project
This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

## wearable-computing
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.

### Instruction
1. Download and unzip the data file into your R working directory.
2. Download the R source code into your R working directory.
3. Execute R source code to generate tidy data file.

### Dataset
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
2. Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"
3. Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor
4. Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package

### Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. The variable in the data Y indicates activity type the subjects performed during recording.

### Code explaination
The code combined training dataset and test dataset, and extracted partial variables to create another dataset with the averages of each variable for each activity.

### New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation. Each row of the dataset is an average of each activity type for all subjects.

