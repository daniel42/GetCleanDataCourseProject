To run the analysis on OS X (where I did my work), perform 
the following steps

1. Download and unzip the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Copy the run_analysis.R script to the *UCI HAR Dataset* directory (this was created when the dataset was unzipped.
3. Open R.
4. In the R console, use the *setwd()* function to set the working directory to the location of the *UCI HAR Dataset* directory.
5. In the R console, use *source("run_analysis.R")*

More information about the various files
* README.md: This file. Describes how to run the script to process the dataset.
* CodeBook.md: Describes the variables, the data, and any transformations or work to clean up the data 
* run_analysis.R: The script to process the dataset and generate the second tidy dataset as described by the course project
* second_dataset.txt: Output of the run_analysis.R script
