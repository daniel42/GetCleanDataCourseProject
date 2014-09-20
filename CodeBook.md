# Data
The test and training data sets provided by Samsung contain 3 files that must
be intepreted together. For the test dataset, these are
* test/X_test.txt (X file)
* test/y_test.txt (y file)
* test/subject_test.txt (subject file)
The training dataset is similar except replace "test" with "train".

For more information about the data, please reference the README.txt file contained with the [zipped dataset file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# Transformation / Work
The X file is read in first. This makes up the bulk of the data. The subject file is read
next. Each line in the subject file corresponds to same line in the X file and references the subject (i.e. person) whose measurements we took. For the y file, the same approach is used except instead of subject, it describes the activity that was being performed at the time the measurements were taken.

Both the test and training datasets are read into R. The individual datasets are processed individually and then combined together into one big dataset.

Next, we use a regular expression to identify columns within the larger data that we are interested in. These are columns that are standard deviation and mean of the measurements. We use R logical vectors to extract these from the big dataset. This data is subsequently merged with activity label data so that we have descriptive identifiers for activities (e.g. WALKING, WALKING_UPSTAIRS, ....). We then do a clean up of various variables names (remove extra '.'s among other things).

Finally we use the reshape2 R library for melt() and dcast() functions to shape the dataset into a second independant tidy dataset. This dataset is written out to the current directory as **second_dataset.txt**

# Variables
This is a description of the various variables found in the **second_dataset.txt**
The short hand notation used is from regular expressions. (mean|std) = means the variable name will either contain the string "mean" or "std". Similar with (X|Y|Z) means the variable name will contain "X" or "Y" or "Z"

* label_name: Activity Label. Values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
* subject: Person whose measuresments we are taking. Value ranges from 1 - 30 since we had 30 subjects observed.
* tBodyAcc.(mean|std).(X|Y|Z): Standard deviation and mean of body acceleration time signals in 3 dimensions (X, Y, Z).
* tGravityAcc.(mean|std).(X|Y|Z): Standard deviation and mean of gravity acceleration time signals in 3 dimensions (X, Y, Z).
* tBodyAccJerk.(mean|std).(X|Y|Z):  Standard deviation and mean of body linear acceleration  time signals in 3 dimensions (X, Y, Z). 
* tBodyGyro.(mean|std).(X|Y|Z): Standard deviation and mean of body gyroscopic time signals in 3 dimensions (X,Y,Z).
* tBodyGyroJerk.(mean|std).(X|Y|Z): Standard deviation and mean of body angular velocity time signals in 3 dimensions (X,Y,Z).
* tBodyAccMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body acceleration time signals.
* tGravityAccMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for gravity acceleration time signals.
* tBodyAccJerkMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body linear acceleration time signals.
* tBodyGyroMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body gyroscopic time signals.
* tBodyGyroJerkMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body angular velocity time signals.
* fBodyAcc.(mean|std).(X|Y|Z): Standard deviation and mean of body acceleration frequency signals in 3 dimensions (X, Y, Z).
* fBodyAccJerk.(mean|std).(X|Y|Z): Standard deviation and mean of body linear acceleration  frequency signals in 3 dimensions (X, Y, Z). 
* fBodyGyro.(mean|std).(X|Y|Z): Standard deviation and mean of body gyroscopic frequency signals in 3 dimensions (X,Y,Z).
* fBodyAccMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body acceleration frequency signals.
* fBodyAccJerkMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body linear acceleration frequency signals.
* fBodyGyroMag.(mean|std): Standard deviation and mean of magnitude of three-dimensional signals for body gyroscopic frequency signals.
* fBodyGyroJerkMag.(mean|std):  Standard deviation and mean of magnitude of three-dimensional signals for body angular velocity frequency signals.
_


