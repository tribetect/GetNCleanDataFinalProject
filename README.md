#UCI Smartphone Data: Tidying Script

## AIM: What does the script do?
[run_analysis.R](run_analysis.R) 

1. Tidies the human activity data '[UCI Human Activity Recognition by Smartphone] 
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)' by combining readings in different files, and retaining mean and standard deviation measures of features. **tidy_meanSD_yymmdd_hhmm.txt**

2. Analysis the tidy data set above summarizing means of observations by subject and activity type: **tidy_means_of_meanSD_yymmdd_hhmm.txt**

## INSTRUCTIONS: How do I use it?
1. Download the data files from the [UCI lab server]
(http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) or [Coursera Get-and-Clean Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Unzip the files in your working directory. A typically unzips to a folder *UCI HAR Dataset*
3. Download [run_analysis.R](run_analysis.R) to the working directory.
(Ensures both [run_analysis.R](run_analysis.R) and the source data folder *UCI HAR Dataset* are at the same level.)
5. Source the R script in R or RStudio to produce the tidy the data set, and the summary data set of means.

## ANALYSIS STEPS: How does it tidy the data?
- PRE-FLIGHT CHECKS: Ensure the UCI data is unzipped in the working directory, loads required libraries
- STEP 1: **Merge test and trials data** folders into a single data frame, use **descriptive activity names**, **one variable per column**, and **one observation per row**
- STEP 2: Subset the merged data to keep only the **means and standard deviation** variables
- STEP 3: Replace variable (column) names with **human readable variable names**
- FINISH-UP: **Generate tidy data text file** with data/time in the filename.  

## Codebook: Data dictionary and definition
[See the accompanying codebook here](CodeBook.md)

## Notes
The script has been tested in RStudio with *R version 3.2.0 'Full of Ingredients'*
Packages: *plyr, dplyr, reshape2* must be installed
