# FitnessAnalysisData
A script used to clean the data collected from smartphones while people conduct different activities.

The data it conducts this analysis on has several files, describing what measurement belongs to what subject, which activity they were performing, and the associated measurments. This data is located at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script will bind together all the subject, activity, and measurement data into one tidy dataset. It has been filtered to only include the measurment variables that are either a mean or a standard deviation. 

An output sample of the data is provided in dataOutput.txt