## Load required packages
library(reshape2)
library(plyr)
library(dplyr)

## Open Testing Set
X_test <- read.table("test/X_test.txt")

## Open Training Set
X_train <- read.table("train/X_train.txt")

## Clip Testing and Training sets
X <- rbind(X_test, X_train)

## Get testing and training activities
y_test <- read.table("test/y_test.txt")
y_train <- read.table("train/y_train.txt")

## And clip them together
y <- rbind(y_test, y_train)

## Convert activity to factor
y$V1 <- factor(y$V1)
levels(y$V1) <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

## Add variable name to activities
names(y) <- c("Activity")

## Get feature names for columns of X
features <- read.table("features.txt")

## Assign column names of X according to feautures
names(X) <- as.character(features[[2]])

## Select variables of X representing mean and standard deviation of features
X <- X[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555:561)]

## Get the list of subjects
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject <- rbind(subject_test, subject_train)
names(subject) <- c("Subject")

## Add activities and subjects to X
X <- cbind(subject, y, X)

## Melt the data frame X
X <- melt(X, id = c("Subject", "Activity"), measure.vars = colnames(X[,3:88]))

## dcast taking mean of the features
X_features_mean_wide <- dcast(X, Subject+Activity ~ variable, mean)

## Convert data to narrow form for readability
X_features_mean_narrow <- melt(X_features_mean_wide, id = c("Subject", "Activity"), measure.vars = colnames(X_features_mean_wide[,3:88]))
names(X_features_mean_narrow) <- c("Subject", "Activity", "Features", "Mean")
X_features_mean_narrow <- arrange(X_features_mean_narrow, Subject, Activity)

## Write narrow form data into a text file
write.table(X_features_mean_narrow, file = "X_average.txt", row.names = FALSE)

## Remove unnecessary global variables
rm("features")
rm("subject")
rm("subject_test")
rm("subject_train")
rm("X")
rm("X_test")
rm("X_train")
rm("y")
rm("y_test")
rm("y_train")
