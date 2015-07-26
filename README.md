# UCI_HAR_analysis
Course Project for Getting and Cleaning Data course on Coursera
## Setting up a working directory
Download UCI HAR dataset from [this link.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description of this data is available at [this website.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download ````run_analysis.R```` into the folder containing the UCI HAR dataset and set the folder as your working directory in R.

## Running the script
__Check that *reshape2*, *plyr* and *dplyr* packages are installed.__

Source ````run_analysis.R```` into console.

A data frame, ````X_features_mean_narrow```` will be created in your Global Environment which is a tidy data frame with the average of each variable on the mean and standard deviation for each measurement <sup>(Yo Dawg!)</sup> for each activity and each subject in the training and testing data frames. A text file ````X_average.txt```` will be created in your working directory which will the store the same data frame.

Another data frame ````X_features_mean_wide```` will be created in your Global Environment having the representing the same data as ````X_features_mean_narrow```` but will be in a wide format (more columns, less rows). However, only the narrow data frame is stored in a text file to facilitate readability.  

## What do the features mean?
Check out *CodeBook.md* for feature description and procedure of how they were obtained.

## How exactly was the tidy data set obtained?
Here were the rough steps that were followed:

1. Training and testing data frames were combined into a single data frame.
2. Extracted columns that stored measurements on mean and standard deviation for each measurement (this includes measurements on ````meanFreq```` and ````angle()```` function).
3. The data frame was arranged according to subject and the activities performed. Each subject performed all 6 activities once.
4. The average of each variable was calculated for each activity performed by each subject.
5. The data frame was melted into a narrow data frame.
6. The data frame was stored as a text file in the working directory.
