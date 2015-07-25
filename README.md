# UCI_HAR_analysis
Course Project for Getting and Cleaning Data course on Coursera
## Setting up a working directory
Download UCI HAR dataset from this [link.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description of this data is available at [this website.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download run_analysis.R into the folder containing the UCI HAR dataset and set the folder as your working directory in R.

## Running the script
Source run_analysis.R into console

A data frame, X_features_mean will be created in your Global Environment which is a tidy data set with the average of each variable on the mean and standard deviation for each measurement (Yo Dawg!) for each activity and each subject in the training and testing data sets.

## What do the column names mean?
Check out CodeBook.md for variable description and procedure of how they were obtained.

## How exactly was the tidy data set obtained?
Here were the rough steps that were followed:

1. Training and testing data sets were combined into a single data frame.
2. Extracted columns that stored measurements on mean and standard deviation for each measurement (this includes measurements on meanFreq and angle function).
3. The data frame was arranged according to subject and the activities performed. Each subject performed all 6 activities once.
4. The average of each variable was calculated for each activity performed by each subject.
