9/26/2015

This readme file goes with the analysis.R program

The program starts with the data from the Samsung experiment where the took 30 volunteers and had each perform six activities  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

This program takes the test and training data sets. To each set the activity and the person are added to the data set. The two data sets are then combined into a single data set. A new data set is then created which contains only to measurements of which are standard devations or means.  

The data set is then melted so that the means of all measurements can be calculated for each measurement by person and activity. 
The output of that data set is then written to a file