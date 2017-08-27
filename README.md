Overview
===========
This repo contains the R code used to transform the initial data set "Human Activity Recognition Using Smartphones Dataset", available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and described [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), into a tidy dataset containing measurments on means and standard deviation of each measurement.

This repo contains the folowing files :
* This file (README.md) describing how the script works.  
* The R script file run_analysis.R which implements the required transformation on the original data set.
* The code book which describes the variables.

How does the script work ?
===========
The run_analysis script performs the following steps :
1. Reads the raw data from both training and test sets.
2. Merges the two data sets
3. Reads the feature names from features.txt file.
4. Searchs for features concerning mean and standard deviation measurements.
5. Extracts only the measurements on the mean and standard deviation for each measurement.
6. Adds the activity name to each measurement using names from 'activity_labels.txt'.
7. Appropriately labels the data set with descriptive variable names using 'features.txt'.
8. Adds a subject column using 'subject_train.txt' and 'subject_test.txt' files to obtain a first tidy data set.
9. From the data set in step 8, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
