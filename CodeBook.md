# Code Book
## Narrow and Wide data frames
There are two data frames generated after running run_analysis.r, in the global enironment. Their names are ````X_features_mean_narrow```` and ````X_features_mean_wide````. They both represent the same data but are in different shapes (narrow and wide according to their names).

Both the data frames have the first two columns (Subject and Activity) in common.

## Subject and Activity columns
Subject is a numeric column containing the IDs of the test and training subjects, which go from 1 to 30. These were extracted from ````test/subject_test.txt```` and ````train/subject_train.txt````. These were matched to their respective observations in the data frame.

Activity is a factor column of 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING), describing the activity performed by the user during which the data was collected. Each subect performed each activity once. The levels of the activities performed by the subjects were exctracted from ````test/y_test.txt```` and ````train/y_train.txt```` and their levels were matched to their descriptions in ````activity_labels.txt````. These were matched to their respective observations in the data frame.

## Features column
