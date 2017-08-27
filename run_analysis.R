library(dplyr)

# Read feature names and activity labels
features <- read.table("features.txt")
activities_labels <- read.table("activity_labels.txt")

# Read training and test data set and merging them.
xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")
x <- union_all(xtrain, xtest)

# Read activities for each dataset record (from training and test datasets)
ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt") 
y <- union_all(ytrain,ytest)

# Read subjects correspondance for each record 
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
subjects <- union_all(subject_train,subject_test)

# Select features which corresponding to means and standard deviations.
MeanVars <- grep(".*mean\\(\\)",features[,2])
StdVars <- grep(".*std\\(\\)", features[,2])

# Create first tidy dataset
firstDataSet <- x[,union(MeanVars, StdVars)]

# Update colums names
colLabels <- as.character(features[union(MeanVars, StdVars),2])
names(firstDataSet) <- colLabels

# Add subject and activity columns
firstDataSet <- mutate(firstDataSet,activity = activities_labels[y$V1,2],subject = subjects$V1)

# Create final dataset with mean by activity and subject
finalDataSet <- firstDataSet %>% group_by(subject, activity)%>%
  summarise_all(mean)

# Write final dataset into a text file 
write.table(x = finalDataSet, file="meanMeasurements.txt", row.names = FALSE)
