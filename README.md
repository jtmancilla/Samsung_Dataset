Samsung_Dataset
===============

Samsung Data set analysis.  Project of Getting and Cleaning Data

The script run_analysis.R, gets and cleans a dataset of Human Activity Recognition Using Smarthones Dataset.
The script-out is a tidy data with the average of only the mean and standar deviation measurements for each activity and subject.

The variables using in the script are:

- TrainSet to read the X_train.txt (file with training experiment measurements) 
- TrainLabel to read the y_train.txt (file with number of the labels of the activitis in the training experiment)
- TestSet to read the X_test.txt (file with test experiment measurements)
- TestLabel to read the y_test.txt (file with number of the labels of the activitis in the test experiment)
- TrainTestSet2 to paste the row of TestSet in TrainSet
- Features to read the features.txt (file with all feature names of the experiments)
- NumColunmMean to extrac the column number of only features with "mean()" in its name
- NameColunmMean to extrac the full name of only features with "mean()" in its name
- NumColunmStd to extrac the column number of only features with "std()" in its name
- NameColunmStd to extrac the full name of only features with "std()" in its name
- DataMeanStd to extrac  "mean()" and "std()" measurement
- TrainTestLabel2 to paste the row of TestLabel in TrainLabel
- DataLabel3 to paste the colunm of TrainTestLabel2 in DataMeanStd
- ActLabel to read the activit_labels (file with activity names)
- SubjectTr to read the subject_train.txt (file with training subject)
- SubjectTe to read the subject_test.txt (file with test subject)
- Subject to paste the row of SubjectTe in SubjectTr
- Data to paste the colunm of Subject in DataLabel3
- MergeData to merge Data with ActLabel with id "label"
- MeltData to melt subject and action variables of MergeData
- TidyData to optain a new dataset with only the average of mean() and std() of each subject and activity
