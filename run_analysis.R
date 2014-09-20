# This file needs to be run inside the UCI HAR Dataset directory.

# Read in the list of features that can be found
features <- read.table("features.txt", col.names=c("feature_id","feature_name"))
# Read in the list of activity labels
activity_labels <- read.table("activity_labels.txt", col.names=c("label_id", "label_name"))

# Read a data set and all associated information
# into a data.frame
read_dataset <- function(type) {
        # Figure out what the files names are
        X_filename <- paste(type, "/", "X_", type, ".txt", sep="")
        y_filename  <- paste(type, "/", "y_", type, ".txt", sep="")
        subject_filename <- paste(type, "/", "subject_", type, ".txt", sep="")

        # Read in the data file. Should have 561 variables
        X_file <- read.table(X_filename, col.names=features$feature_name)
        # Combine subject
        subject_file <- read.table(subject_filename, col.names=c("subject"))
        X_file$subject = subject_file$subject
        # Combine labels
        y_file <- read.table(y_filename, col.names=c("label_id"))
        X_file$label_id = y_file$label_id
        return(X_file)
}

# 1. Merges the training and the test sets to create one data set.
test_dataset <- read_dataset("test")
train_dataset <- read_dataset("train")
all_dataset <- rbind(test_dataset, train_dataset)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# Find mean and std columns to be extracted
extracted_col_logical <- grepl("(std|mean)\\(\\)", features$feature_name)
# Extract dataset
extracted_dataset <- all_dataset[,extracted_col_logical]

# 3. Uses descriptive activity names to name the activities in the data set
act_lbl_dataset <- merge(extracted_dataset, activity_labels)

# 4. Appropriately labels the data set with descriptive variable names. 
# Removing extra .
n <- names(act_lbl_dataset)
n <- gsub("\\.{2}", "", n)
# Removing extra Body
n <- gsub("BodyBody", "Body", n)
colnames(act_lbl_dataset) <- n

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
library(reshape2)
melt_df <- melt(act_lbl_dataset, id=c("subject", "label_id", "label_name"))
second_dataset <- dcast(melt_df, label_name + subject ~ variable, mean)

# Write out the results
write.table(second_dataset, file="second_dataset.txt", row.name=FALSE)