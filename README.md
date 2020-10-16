This script combines data from various sources into a one single data frame, picks required data from it, performs computation on it and saves the result. The script assumes that the folder named UCI HAR Dataset is placed in working directory along with its included files in the following manner.
./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/features.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/y_test.txt
./UCI HAR Dataset/test/subject_test.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/y_train.txt
./UCI HAR Dataset/train/subject_train.txt
The output of the script is saved in the working directory as 'tidyDataSet.txt'

Script explanation
The script first combines data in each folder (test and train) into a single data frame and associates each with proper variable names. It also includes more proper names for the activities in the data frame instead of the number codes. Having done this for each of the folder, the big test and train datasets are combined into a huge single dataset. From this the required variables denoted by -mean() and -std() are picked alongside with subjects' numbers and activity labels, that are used in the last analysis. Lastly from this picked dataset a summarised dataset is created by grouping together values according to the subject numbers and activities and aggregated by mean values. This data set is saved into a file in the current working directory.