library(stringr)
library(dplyr)
library(reshape2)
##read in all required data
Test <- read.table("X_test.txt")
Train <- read.table("X_train.txt")
TestActivity <- read.table("Y_Test.txt")
TrainActivity <- read.table("Y_Train.txt")
features <- read.table("features.txt")
ActivityLabels <- read.table("Activity_Labels.txt")
TestSubject <- read.table("subject_test.txt")
TrainSubject <- read.table("subject_train.txt")
colnames(ActivityLabels) = c("ID", "Activity")

## Set the column names for both data sets
colnames(Test) <- features$V2
colnames(Train) <- features$V2
##Add the Activity Type
Test$ActivityID <- TestActivity$V1 
Train$ActivityID <- TrainActivity$V1
Test$Type <- "Test"
Train$Type <- "Train"

## combine both test and training data 
AllData <- rbind(Train,Test)
##subset on only the mean and standard devation columns (plus identifiers)
SubsetData <- AllData[, grep("Subject|ActivityID|mean|std", names(AllData))]
## add in the activity name
SubsetData2 <- merge(SubsetData,ActivityLabels, by.x="ActivityID", by.y="ID")

#remove the original ID it is no longer needed 
SubsetData3 <- select(SubsetData2,-matches("ID"))

               
               
## Melt the data set so means can be easily calculated               
melted <- melt(SubsetData3,id = c("Activity","Subject"),measures.vars = c(ActivityLabels$Activity))

x <- dcast(melted,Activity+Subject ~ variable, mean)
## write out the summary table
write.table(x,"tidydata.txt",row.names = FALSE)

              