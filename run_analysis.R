## Load required libraries
library(dplyr)

## Initialize file paths
activityLabelsFile <- "./UCI HAR Dataset/activity_labels.txt"
variablesVectorFile <- "./UCI HAR Dataset/features.txt"
testDataFile <- "./UCI HAR Dataset/test/X_test.txt"
testLabelNumberFile <- "./UCI HAR Dataset/test/y_test.txt"
testSubjectNumberFile <- "./UCI HAR Dataset/test/subject_test.txt"
trainDataFile <- "./UCI HAR Dataset/train/X_train.txt"
trainLabelNumberFile <- "./UCI HAR Dataset/train/y_train.txt"
trainSubjectNumberFile <- "./UCI HAR Dataset/train/subject_train.txt"

## Read data from files
## Main folder files
activityLabels <- read.table(activityLabelsFile)
variables <- read.table(variablesVectorFile)

## Test folder files
testData <- read.table(testDataFile)
testLabelNumbers <- read.table(testLabelNumberFile)
testSubjectNumbers <- read.table(testSubjectNumberFile)

## Train folder files
trainData <- read.table(trainDataFile)
trainLabelNumbers <- read.table(trainLabelNumberFile)
trainSubjectNumbers <- read.table(trainSubjectNumberFile)
## Data has been read.

## Associate variables names with data
colnames(testData) <- variables[,2]
colnames(trainData) <- variables[,2]

## Give column names for other data sets too to facilitate merging
colnames(testLabelNumbers) <- "labelNumber"
colnames(trainLabelNumbers) <- "labelNumber"
colnames(testSubjectNumbers) <- "subjectNumber"
colnames(trainSubjectNumbers) <- "subjectNumber"
colnames(activityLabels) <- c("labelNumber", "activityLabel")

## Begin merging data together
## Test data
testLabelNumbers <- merge(testLabelNumbers, activityLabels, by.x = "labelNumber", by.y = "labelNumber", all = TRUE, sort = FALSE)
testSubjectLabel <- cbind(testSubjectNumbers, testLabelNumbers)
testData <- cbind(testSubjectLabel, testData)
## Test data merged
## Train data
trainLabelNumbers <- merge(trainLabelNumbers, activityLabels, by.x = "labelNumber", by.y = "labelNumber", all = TRUE, sort = FALSE)
trainSubjectLabel <- cbind(trainSubjectNumbers, trainLabelNumbers)
trainData <- cbind(trainSubjectLabel, trainData)
## Train data merged

## Merge all data into one data frame.
testTrainData <- rbind(testData, trainData)

## Pick column indices for variables where patterns mean() or std() appear. Also include the first and third column which contain subject number and activity label
columnIndices <- c(1,3,grep("mean\\(\\)|std\\(\\)", names(testTrainData)))
meanStdData <- select(testTrainData, columnIndices)

## Create a summary of the data that is first grouped by subject number and then by activity label, and then summarised by taking an average of each variable.
summary <- meanStdData %>% group_by(subjectNumber, activityLabel) %>% summarise(across(.fns = mean))

## Write the data into a file
write.table(summary, file = "tidyDataSet.txt", row.names = FALSE)

## PROCESS COMPLETE