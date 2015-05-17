##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#THIS FILE: run_analysis.R
#ABOUT: This script makes this dataset tidy: UCI Machine Learning Dataset with Smartphone Accelerometer & gyrometer data
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Data citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
## A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, 
## Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
#Data source: Data, license, & description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Prep: Download and unzip dataset in your working directory: UCI HAR Dataset.zip
#      A folder should appear "UCI HAR Dataset"
#      Run this script from the working directory
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#PREFLIGHT Checks: Check if key files are reachable; If yes, set working directory to dataset root folder
key_file1 <- ("activity_labels.txt" %in% dir("UCI HAR Dataset"))
key_file2 <- ("features.txt" %in% dir("UCI HAR Dataset"))
key_folder1 <- ("test" %in% dir("UCI HAR Dataset"))
key_folder2 <- ("train" %in% dir("UCI HAR Dataset"))
initialWD <- getwd()

if(key_file1 && key_file2 && key_folder1 && key_folder2) 
  {
    print("Key files and folders located")
    setwd("UCI HAR Dataset")
  } else {
    e = "Key Files Missing \n Make sure the data set is unzipped correctly \n  See run_analysis.R script for detailed Prep instructions."
    stop(e) #key files/folders missing
  }

#PREFLIGHT Steps: load required libraries
library(dplyr)
library(plyr)
library(reshape2)

##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Analyis Steps
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#STEP 1: MERGING Test and Trials Data; use descriptive activity names
#STEP 2: MeansSDData: Retain just the mean/standard deviation variables
#STEP 3: Make Variable Names Readable
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

#STEP 1: MERGING Test and Trials Data; use descriptive activity names:

#1.1 Get activity labels, and variable shortnames
activity_labels <- read.table("activity_labels.txt", header = FALSE, col.names = c("activity_id", "activity"))
xvariablenames <- read.delim("features.txt", header = FALSE, quote = "", col.names = c("variable"))
xvariablenames <- colsplit(xvariablenames$variable, pattern = " ", names = c("variable_id", "variable"))
xvariablenames <- as.character(xvariablenames[,2])

#1.1.1 Get test data
#-------------------
#Get subject identities: 2947 observations
subjecttest <- read.table("test/subject_test.txt", col.names = c("subject")) #subject identity
#.
# Get activity data & make human readable
ytest <- read.table("test/Y_test.txt", col.names = c("activity_id"))
ytest <- join(ytest, activity_labels, by = "activity_id")

#read the x data with the column names obtained from the features.txt file:
#xvariablenames were converted to a simple string vector for assignment to col.names:
xtest <- read.table("test/X_test.txt")
colnames(xtest) <-  xvariablenames 

#create readable dataframe of test data
readable_test_data <- cbind(subjecttest, ytest, trialtype = "test", xtest)
#View(readable_test_data) #2947 observations, #565 variables

#1.1.2 Get training data
#-----------------------
#Get subject identities: 7352 observations
subjecttrain <- read.table("train/subject_train.txt", col.names = c("subject")) #subject identity
#.
# Get activity data & make human readable
ytrain <- read.table("train/Y_train.txt", col.names = c("activity_id"))
ytrain <- join(ytrain, activity_labels, by = "activity_id")

#read the x data with the column names obtained from the features.txt file:
#xvariablenames were converted to a simple string vector for assignment to col.names:
xtrain <- read.table("train/X_train.txt")
colnames(xtrain) <-  xvariablenames 

#create readable train data frame
readable_train_data <- cbind(subjecttrain, ytrain, trialtype = "train", xtrain)
#View(readable_train_data) #2947 observations, #565 variables

#1.1.3 Merge test and train data
#----------------------------------
dataTrialTest <- rbind(readable_test_data, readable_train_data)
#10,299 Observations of 565 Variables

##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#STEP 2: Extract only mean and standard deviation variables
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# Extract column names, detect indices where "mean" and "std" occur
#
dataColumns <- names(dataTrialTest)
MeansIndex <- grep("mean", dataColumns, ignore.case = TRUE)
SDIndex <- grep("std", dataColumns, ignore.case = TRUE)
MeansSDIndex <- c(1:4, MeansIndex,SDIndex) #First 4 Columns + 86 Xvariables, either means or st.deviation measures
#
# Use the index of desired columns to subset down from 550+ variables
# MeansSDData: Subset of dataTrialTest using MeanSDIndex vector
MeansSDData <- dataTrialTest[MeansSDIndex]
#10,299 Observations of 90 Variables; if all goes correctly
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
#
#
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#STEP 3: Human Readable Names/Variables
#---- .1 read the features.txt file to get variable names
#---- .2 keep just the mean and st.dev variables 
#---- .3 create longform names with gsub
#---- .4 replace column names with new fangled longform names
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
#
#---- 3.1 read the features.txt file to get variable names
variables <- read.table("features.txt", col.names=c("variable_id", "variable"), header = FALSE)
#
#---- 3.2 select only mean and st.dev variables indices
ColMeansIndex <- grep("mean", variables$variable, ignore.case = TRUE)
ColSDIndex <- grep("std", variables$variable, ignore.case = TRUE)
ColMeansSDIndex <- c(ColMeansIndex,ColSDIndex) 
#
variables <- variables[ColMeansSDIndex,] #subset variable names list
variables <- cbind(variables, variable_name = variables$variable) #duplicate the variable name column for expansion
variables <- variables[c("variable_id", "variable", "variable_name")] #re-arrange column order after cbind operation
#  
#---- 3.3 create longform names with gsub
variables$variable_name <- #expansion 1: TIME measures
  gsub(x = variables$variable_name, pattern = "^t", replacement = "time_", ignore.case = FALSE) %>%   
  gsub(pattern = "\\(t", replacement = "(time_", ignore.case = FALSE) %>%  
  
  #expansion 2: FREQUENCY measures
  gsub(pattern = "^f", replacement = "frequency_", ignore.case = FALSE) %>%
  gsub(pattern = "\\(f", replacement = "(frequency_", ignore.case = FALSE) %>%
  
  #expansion 3: DEVICE indicators
  gsub(pattern = "Acc", replacement = "Accelerometer_", ignore.case = FALSE) %>%
  gsub(pattern = "Gyro", replacement = "Gyroscope_", ignore.case = FALSE) %>%
  
  #expansion 4: dataSOURCE indicators body vs. gravity
  gsub(pattern = "Body", replacement = "Body_", ignore.case = FALSE) %>%
  gsub(pattern = "Gravity", replacement = "Gravity_", ignore.case = FALSE) %>%
  
  #expansion 5: AXIS
  gsub(pattern = "X", replacement = "XAxis", ignore.case = FALSE) %>%
  gsub(pattern = "Y", replacement = "YAxis", ignore.case = FALSE) %>%
  gsub(pattern = "Z", replacement = "ZAxis", ignore.case = FALSE) %>%
  
  #expansion 5: MEASUREMENT type
  gsub(pattern = "Jerk", replacement = "Jerk_", ignore.case = FALSE) %>%
  gsub(pattern = "Mag", replacement = "Magnitude_", ignore.case = FALSE) %>%
  
  #expansion 6: SUMMARYSTATISTIC type
  gsub(pattern = "-std\\(\\)", replacement = "StandardDeviation_", ignore.case = FALSE) %>%
  gsub(pattern = "-meanFreq\\(\\)", replacement = "MeanFrequency_", ignore.case = FALSE) %>%
  gsub(pattern = "-mean\\(\\)", replacement = "Mean_", ignore.case = FALSE) %>%
  
  #expansion cleanups: remove dashes "-" and trailing underscores "_"
  gsub(pattern = "-", replacement = "") %>%
  gsub(pattern = "_$", replacement = "") #%>%

#--- STEP 3.4: Join human readable variable names (variables) to subset of means & std.deviations data (MeansSDData)
colnames(MeansSDData) <- c("subject", "activity_id", "activity", "trial_type", variables$variable_name)
MeansSDData <- MeansSDData[,-2] #eliminate activity_id, as redundant information; 
#89 Variables; 10,299 observations
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#
#FINISHING UP: generate the tidy data csv file; reset working directory 
##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#View(MeansSDData) #View results in RStudio tabular view
filename <- paste0("tidy_data_", format(Sys.time(), "%y%m%d_%H%M"), ".txt") #timestamped filename
write.table(MeansSDData, filename, quote = TRUE, row.names = FALSE, fileEncoding = "UTF-8", sep = "\t")
setwd(initialWD) # Back to the folder one level above
