# Code Book
All file locations are with respect to the *UCI HAR dataset* folder.
## Narrow and Wide data frames
There are two data frames generated after running run_analysis.r, in the global enironment. Their names are ````X_features_mean_narrow```` and ````X_features_mean_wide````. They both represent the same data but are in different shapes (narrow and wide according to their names).

Both the data frames have the first two columns (Subject and Activity) in common.

## Subject and Activity columns
Subject is a numeric column containing the IDs of the test and training subjects, which go from 1 to 30. These were extracted from ````test/subject_test.txt```` and ````train/subject_train.txt````. These were matched to their respective observations in the data frame.

Activity is a factor column of 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), describing the activity performed by the user during which the data was collected. Each subect performed each activity once. The levels of the activities performed by the subjects were exctracted from ````test/y_test.txt```` and ````train/y_train.txt```` and their levels were matched to their descriptions in ````activity_labels.txt````. These were matched to their respective observations in the data frame.

## Features column
The features column is a factor with 86 levels. This factor contains the list of features extracted from ````features.txt```` whose name contains either "mean" or "std". Therefore, these features correpsond to measurements on mean and standard deviation for each measurement. In the case of the wide format data, these features are the names of the columns from 3 to 88. 

A description of their names are available in ````features_info.txt````.

## Mean column
The mean column is a numeric column and contains the average of their corresponding features by each subject and each variable. As the original measurements were normalized, the values in mean column lie in the range of [-1, 1]. These measurements were extracted from ````test/X_test.txt```` and ````train/X_train.txt```` and matched with their corresponding features, subjects and activities. They were then averaged out by each subject and each activity and stored in the mean column. In the case of the wide format data, these values are stored as observations under their corresponding feature columns and matched by their subjects and activities. 
