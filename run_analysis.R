library(reshape2)
#Read Data
TrainSet <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\X_train.txt")
TrainLabel <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\y_train.txt", col.names="label")
TestSet <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\X_test.txt")
TestLabel <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\y_test.txt", col.name="label")

#Merge Training and test data
TrainTestSet2 <- rbind(TrainSet,TestSet)

#Extract only mean and standard deviation from the full set
Features <- read.table("D:\\RStudio\\UCI HAR Dataset\\features.txt")
NumColunmMean <- grep("mean()",Features$V2)
NameColunmMean <- grep("mean()",Features$V2, value=TRUE)
NumColunmStd <- grep("std()",Features$V2)
NameColunmStd <- grep("std()",Features$V2, value =TRUE)
DataMeanStd <- TrainTestSet2[,c(NumColunmMean,NumColunmStd)]
names(DataMeanStd) <- c(NameColunmMean,NameColunmStd)

#Combination of subject and activity to create tidy data
TrainTestLabel2 <- rbind(TrainLabel,TestLabel)
DataLabel3 <- cbind(DataMeanStd,TrainTestLabel2)
ActLabel <- read.table("D:\\RStudio\\UCI HAR Dataset\\activity_labels.txt")
SubjectTr <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\subject_train.txt")
SubjectTe <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\subject_test.txt")
Subject <- rbind(SubjectTr,SubjectTe)
names(Subject) <- "subject"
Data <- cbind(DataLabel3,Subject)
names(ActLabel) <- c("label","action")
MergeData = merge(Data, ActLabel, by.x="label",by.y="label",all=TRUE)
MergeData$label<- NULL
MeltData <-melt(MergeData, id=c("subject", "action"))
TidyData <- dcast(MeltData, ...~ variable, mean)
#Saved the tidy data
write.table(TidyData, "Samsung_Dataset.txt", sep="\t")
