library(reshape2)
#Read Data
train_set <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\X_train.txt")
train_label <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\y_train.txt", col.names="label")
test_set <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\X_test.txt")
test_label <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\y_test.txt", col.name="label")

#Merge Training and test data
train_test_set2 <- rbind(train_set,test_set)

#Extract only mean and standard deviation from the full set
features <- read.table("D:\\RStudio\\UCI HAR Dataset\\features.txt")
num_colunmmean <- grep("mean()",features$V2)
name_colunmmean <- grep("mean()",features$V2, value=TRUE)
num_colunmstd <- grep("std()",features$V2)
name_colunmstd <- grep("std()",features$V2, value =TRUE)
data_mean_std <- train_test_set2[,c(num_colunmmean,num_colunmstd)]
names(data_mean_std) <- c(name_colunmmean,name_colunmstd)

#Combination of subject and activity to create tidy data
train_test_label2 <- rbind(train_label,test_label)
Data_label3 <- cbind(data_mean_std,train_test_label2)
act_label <- read.table("D:\\RStudio\\UCI HAR Dataset\\activity_labels.txt")
subject_tr <- read.table("D:\\RStudio\\UCI HAR Dataset\\train\\subject_train.txt")
subject_te <- read.table("D:\\RStudio\\UCI HAR Dataset\\test\\subject_test.txt")
subject <- rbind(subject_tr,subject_te)
names(subject) <- "subject"
Data <- cbind(Data_label3,subject)
names(act_label) <- c("label","action")
mergeData = merge(Data, act_label, by.x="label",by.y="label",all=TRUE)
mergeData$label<- NULL
meltData <-melt(mergeData, id=c("subject", "action"))
tidy_Data <- dcast(meltData, ...~ variable, mean)

#Saved the tidy data
write.table(tidy_Data, "Samsung_Dataset.txt", sep="\t")

