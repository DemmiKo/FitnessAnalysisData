#Code Book

##Variables in the output

###subject:
The subject referes to the number assigned to each individual participant. they are numbered 1 - 30.

## activitytype:
This variable is associated with the type of activity the subject was performing while the measurements were being taken. This data came from the by taking the activitytype from the origanol data aplying the nameactivity function. It takes the number and converts it to a label describing the activity.

##All other Values: They are the measurments taken by the device and their accurate descriptions can be found in the origanol files located with the data that was used with this script. you can download it [here]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The values are a sub set of the measurments and have been filtered to contain only those that contain the text 'std', or 'mean'