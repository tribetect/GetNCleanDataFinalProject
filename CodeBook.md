#Codebook
##UCI Human Activity Recognition
### Merged & Tidy Dataset, Summary Data Set of Means by Subject/Activity

###About
This codebook describes the single, tidy dataset obtained by combining data files from the [UCI Human Activity Recognition Using Smartphones Data Set](https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) using the [run_analysis.R](run_analysis.R) script.

###Citation
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013

### Summary Attribute Information:
#### For each record in the dataset the following is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment
 

#### UCI Human Activity Recognition Data

The features selected for this database come from the accelerometer and gyroscope's means of 3-axial raw signals. These time domain signals (variable name component 'time' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise (variabe name component 'frequency'. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (variable names with 'accelerometer') using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration ('accelerometer' in variable name) and angular velocity ('gyroscope' in variable name) were derived in time to obtain Jerk signals (jerk in variable name). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm ('magnitude' in variable name). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing ('frequency' in variable name indicates frequency domain). e.g. frequency_body_accelerometer_mean_xaxis, etc.

These signals were used to estimate variables of the feature vector for each pattern:  
'xaxis, yaxis, zaxis' is used to denote 3-axial signals in the X, Y and Z directions. e.g. frequency_body_accelerometer_meanfrequency_xaxis, time_body_accelerometer_mean_xaxis, etc.

##The tidy data of mean and standard deviation variables 

### Identifier variables in tidy data sets

| Identifier Variables      | Type         | Description                          |
|:------------- |:-------------| :------------------------------------|
| **subject**       | numeric      | Test and trial subject identifier    |
| **activity**      | character    | Activity being performed by **subject**  |
|                   |             | WALKING               |
|                   |             | WALKING_UPSTAIRS               |
|                   |             | WALKING_DOWNSTAIRS               |
|                   |             | SITTING     |
|                   |             | STANDING               |
|                   |             | LAYING              |


## Mean variables of mean and standard deviation of features (Column 3 - last) 
### In summary data set of means of (mean and standard deviation variables) only 
#### Final output/step 5 of course project
##### Feature means: Numeric measurements from accelerometer and gyroscope
mean_time_body_accelerometer_mean_xaxis
mean_time_body_accelerometer_mean_yaxis
mean_time_body_accelerometer_mean_zaxis
mean_time_gravity_accelerometer_mean_xaxis
mean_time_gravity_accelerometer_mean_yaxis
mean_time_gravity_accelerometer_mean_zaxis
mean_time_body_accelerometer_jerk_mean_xaxis
mean_time_body_accelerometer_jerk_mean_yaxis
mean_time_body_accelerometer_jerk_mean_zaxis
mean_time_body_gyroscope_mean_xaxis
mean_time_body_gyroscope_mean_yaxis
mean_time_body_gyroscope_mean_zaxis
mean_time_body_gyroscope_jerk_mean_xaxis
mean_time_body_gyroscope_jerk_mean_yaxis
mean_time_body_gyroscope_jerk_mean_zaxis
mean_time_body_accelerometer_magnitude_mean
mean_time_gravity_accelerometer_magnitude_mean
mean_time_body_accelerometer_jerk_magnitude_mean
mean_time_body_gyroscope_magnitude_mean
mean_time_body_gyroscope_jerk_magnitude_mean
mean_frequency_body_accelerometer_mean_xaxis
mean_frequency_body_accelerometer_mean_yaxis
mean_frequency_body_accelerometer_mean_zaxis
mean_frequency_body_accelerometer_meanfrequency_xaxis
mean_frequency_body_accelerometer_meanfrequency_yaxis
mean_frequency_body_accelerometer_meanfrequency_zaxis
mean_frequency_body_accelerometer_jerk_mean_xaxis
mean_frequency_body_accelerometer_jerk_mean_yaxis
mean_frequency_body_accelerometer_jerk_mean_zaxis
mean_frequency_body_accelerometer_jerk_meanfrequency_xaxis
mean_frequency_body_accelerometer_jerk_meanfrequency_yaxis
mean_frequency_body_accelerometer_jerk_meanfrequency_zaxis
mean_frequency_body_gyroscope_mean_xaxis
mean_frequency_body_gyroscope_mean_yaxis
mean_frequency_body_gyroscope_mean_zaxis
mean_frequency_body_gyroscope_meanfrequency_xaxis
mean_frequency_body_gyroscope_meanfrequency_yaxis
mean_frequency_body_gyroscope_meanfrequency_zaxis
mean_frequency_body_accelerometer_magnitude_mean
mean_frequency_body_accelerometer_magnitude_meanfrequency
mean_frequency_body_body_accelerometer_jerk_magnitude_mean
mean_frequency_body_body_accelerometer_jerk_magnitude_meanfrequency
mean_frequency_body_body_gyroscope_magnitude_mean
mean_frequency_body_body_gyroscope_magnitude_meanfrequency
mean_frequency_body_body_gyroscope_jerk_magnitude_mean
mean_frequency_body_body_gyroscope_jerk_magnitude_meanfrequency
mean_angle_time_body_accelerometer_mean_gravity

## Mean and standard deviation of features (Column 3 - last) 
### In intermediate tidy data set of mean and standard deviation variables only (Step 4 of course project)
####Type: factor
trial_type: 2 level factor variable; Values: **test or trial**

####Type: numeric
time_body_accelerometer_mean_xaxis
time_body_accelerometer_mean_yaxis
time_body_accelerometer_mean_zaxis
time_gravity_accelerometer_mean_xaxis
time_gravity_accelerometer_mean_yaxis
time_gravity_accelerometer_mean_zaxis
time_body_accelerometer_jerk_mean_xaxis
time_body_accelerometer_jerk_mean_yaxis
time_body_accelerometer_jerk_mean_zaxis
time_body_gyroscope_mean_xaxis
time_body_gyroscope_mean_yaxis
time_body_gyroscope_mean_zaxis
time_body_gyroscope_jerk_mean_xaxis
time_body_gyroscope_jerk_mean_yaxis
time_body_gyroscope_jerk_mean_zaxis
time_body_accelerometer_magnitude_mean
time_gravity_accelerometer_magnitude_mean
time_body_accelerometer_jerk_magnitude_mean
time_body_gyroscope_magnitude_mean
time_body_gyroscope_jerk_magnitude_mean
frequency_body_accelerometer_mean_xaxis
frequency_body_accelerometer_mean_yaxis
frequency_body_accelerometer_mean_zaxis
frequency_body_accelerometer_meanfrequency_xaxis
frequency_body_accelerometer_meanfrequency_yaxis
frequency_body_accelerometer_meanfrequency_zaxis
frequency_body_accelerometer_jerk_mean_xaxis
frequency_body_accelerometer_jerk_mean_yaxis
frequency_body_accelerometer_jerk_mean_zaxis
frequency_body_accelerometer_jerk_meanfrequency_xaxis
frequency_body_accelerometer_jerk_meanfrequency_yaxis
frequency_body_accelerometer_jerk_meanfrequency_zaxis
frequency_body_gyroscope_mean_xaxis
frequency_body_gyroscope_mean_yaxis
frequency_body_gyroscope_mean_zaxis
frequency_body_gyroscope_meanfrequency_xaxis
frequency_body_gyroscope_meanfrequency_yaxis
frequency_body_gyroscope_meanfrequency_zaxis
frequency_body_accelerometer_magnitude_mean
frequency_body_accelerometer_magnitude_meanfrequency
frequency_body_body_accelerometer_jerk_magnitude_mean
frequency_body_body_accelerometer_jerk_magnitude_meanfrequency
frequency_body_body_gyroscope_magnitude_mean
frequency_body_body_gyroscope_magnitude_meanfrequency
frequency_body_body_gyroscope_jerk_magnitude_mean
frequency_body_body_gyroscope_jerk_magnitude_meanfrequency
angle_time_body_accelerometer_mean_gravity
angle_time_body_accelerometer_jerk_mean__gravitymean
angle_time_body_gyroscope_mean_gravitymean
angle_time_body_gyroscope_jerk_mean_gravitymean
angle_xaxis_gravitymean
angle_yaxis_gravitymean
angle_zaxis_gravitymean
time_body_accelerometer_standarddeviation_xaxis
time_body_accelerometer_standarddeviation_yaxis
time_body_accelerometer_standarddeviation_zaxis
time_gravity_accelerometer_standarddeviation_xaxis
time_gravity_accelerometer_standarddeviation_yaxis
time_gravity_accelerometer_standarddeviation_zaxis
time_body_accelerometer_jerk_standarddeviation_xaxis
time_body_accelerometer_jerk_standarddeviation_yaxis
time_body_accelerometer_jerk_standarddeviation_zaxis
time_body_gyroscope_standarddeviation_xaxis
time_body_gyroscope_standarddeviation_yaxis
time_body_gyroscope_standarddeviation_zaxis
time_body_gyroscope_jerk_standarddeviation_xaxis
time_body_gyroscope_jerk_standarddeviation_yaxis
time_body_gyroscope_jerk_standarddeviation_zaxis
time_body_accelerometer_magnitude_standarddeviation
time_gravity_accelerometer_magnitude_standarddeviation
time_body_accelerometer_jerk_magnitude_standarddeviation
time_body_gyroscope_magnitude_standarddeviation
time_body_gyroscope_jerk_magnitude_standarddeviation
frequency_body_accelerometer_standarddeviation_xaxis
frequency_body_accelerometer_standarddeviation_yaxis
frequency_body_accelerometer_standarddeviation_zaxis
frequency_body_accelerometer_jerk_standarddeviation_xaxis
frequency_body_accelerometer_jerk_standarddeviation_yaxis
frequency_body_accelerometer_jerk_standarddeviation_zaxis
frequency_body_gyroscope_standarddeviation_xaxis
frequency_body_gyroscope_standarddeviation_yaxis
frequency_body_gyroscope_standarddeviation_zaxis
frequency_body_accelerometer_magnitude_standarddeviation
frequency_body_body_accelerometer_jerk_magnitude_standarddeviation
frequency_body_body_gyroscope_magnitude_standarddeviation
frequency_body_body_gyroscope_jerk_magnitude_standarddeviation
