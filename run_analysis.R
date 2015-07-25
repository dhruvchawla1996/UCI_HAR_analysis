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
X_mean_std <- X[,c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228, 240, 241, 253, 254, 266:271, 294:296, 345:350, 373:375, 424:429, 452:454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552, 555:561)]

## Get the list of subjects
subject_test <- read.table("test/subject_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject <- rbind(subject_test, subject_train)
names(subject) <- c("Subject")

## Add activities and subjects to X
X_with_activity <- cbind(subject, y, X_mean_std)

## Melt the data frame X
X_melted <- melt(X_with_activity, id = c("Subject", "Activity"), measure.vars = colnames(X_with_activity[,3:88]))

## dcast taking mean of the features
X_features_mean <- dcast(X_melted, Subject+Activity ~ variable, mean)

## Return wide-form tidy data frame of feature means
X_features_mean
