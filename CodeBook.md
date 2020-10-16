The tidy data set contains a summary of average values of various variables aggregated according to variable 'subjectNumber'
that indicates the number of test subject, and according to variable 'activityLabel' that indicates the kind of activity
performed while the data was gathered.

Variables:
subjectNumber   (1-30)
activityLabel   WALKING
                WALKING_UPSTAIRS
                WALKING_DOWNSTAIRS
                SITTING
                STANDING
                LAYING
                
Each of the next variables are followed by -mean() or -std() in the tidy data set to indicate the variables that were estimated
from the original source of signals producing the data. Variables denoted by '-XYS' are further broken down into three variables
each indicating different directional axis: X-axis, Y-axis, and Z-axis. The values of the next variables range between -1 and 1.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag