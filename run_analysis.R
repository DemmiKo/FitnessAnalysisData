# A Script for analysis of data
library(dplyr)

#Reads in the files for analysis

XtextTestraw <- read.table("UCI HAR Dataset/test/X_test.txt")
YtextTestraw <- read.table("UCI HAR Dataset/test/Y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt") 
XtextTrainraw <- read.table("UCI HAR Dataset/train/X_train.txt")
YtextTrainraw <- read.table("UCI HAR Dataset/train/Y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt") 
variableNames <- read.table("UCI HAR Dataset/features.txt")
activityNames <- read.table("UCI HAR Dataset/activity_labels.txt")

# Names the Variables (make this a function that can be called with the train data as well
	nameandcombine <- function(x,y,z){
		
		namedXraw <- x
		namedYraw <- y
		namedSubjects <- z
		names(namedXraw) <- variableNames[,2]
		names(namedYraw) <- "activitytype"
		names(namedSubjects) <- "subject"
		xycombined <- cbind(namedXraw,namedYraw,namedSubjects)
		return(xycombined)
}
# Feed it xycombined$activitytype and replace all numbered values with the names in the list. To be used with lapply
	nameactivity <- function(x) {	
		if (x == 1){(x = as.character(activityNames[1,2]))}
		if (x == 2){(x = as.character(activityNames[2,2]))}
		if (x == 3){(x = as.character(activityNames[3,2]))}
		if (x == 4){(x = as.character(activityNames[4,2]))}
		if (x == 5){(x = as.character(activityNames[5,2]))}
		if (x == 6){(x = as.character(activityNames[6,2]))}
		x
}
#The below set of commands will read in both test and train data,name the variables, bind them together, and name the activity types.


table1 <- nameandcombine(XtextTestraw,YtextTestraw,subjectTest)
table2 <- nameandcombine(XtextTrainraw,YtextTrainraw,subjectTrain)
table3 <- rbind(table1,table2)
table3$activitytype <- sapply(table3$activitytype, nameactivity)
indexlist <- c(grep("mean",names(table3)),grep("std",names(table3)),grep("activitytype",names(table3)),grep("subject",names(table3)))
table4 <- table3[,indexlist]
tidytable <- group_by(table4, subject,activitytype)
#tidytable <- group_by(tidytable, subject)
tidytable <- summarise_all(tidytable, mean)

write.table(tidytable, file = "dataOutput.txt")