# Getting and Clearning Data Course Project

Hello friends, this is my repo for the final course project of Getting and Clearning Data by Johns Hopkins University. I performed five steps to clean this dataset http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

1. Merges the training and the test sets to create one data set.
2. Appropriately labels the data set with descriptive variable names.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Note - First, I merged datasets (train, test, subject) and labelled them before extracting target columns with regular expressions.

## Software

R version 3.5.2 and RStudio version 1.1.456

## Package Installation

Two main packages I used for this assignment - dplyr and stringr. Both are very powerful for data & string manipulation.

## Brief Explanation

The first step is just read all the datasets into RStudio using read.table(). Then I cleaned the feature names using the code below, removing "()" and replacing "-" with ".".

```
## clean feature names
featureNames <- read.table(file = "features.txt")
featureNames <- tolower(featureNames$V2)
featureNames <- c("subject_id", featureNames, "activity")
featureNames <- str_replace_all(featureNames, pattern = "-", ".")
featureNames <- str_replace_all(featureNames, pattern = "\\(", "")
featureNames <- str_replace_all(featureNames, pattern = "\\)", "")
featureNames <- make.names(featureNames)
names(full_data) <- featureNames
```

I used base R function grep() to extract matched pattern using regular expressions. The code below extract columns that end with ".mean", ".std", "mean.x", "mean.y", "mean.z", "std.x", "std.y", or "std.z".

```
(mean_cols <- grep(pattern = "(\\.mean$)|(mean\\.[xyz])$", x = featureNames, 
                  ignore.case = T, value = T))
(std_cols <- grep(pattern = "(\\.std$)|(std\\.[xyz])$", x = featureNames, 
                 ignore.case = T, value = T))
(mean_std_cols <- c("subject_id", "activity", mean_cols, std_cols))
clean_data <- full_data[, mean_std_cols]
```

The final step is very easy using dplyr::summarise_all() function. Just group the dataset by column subject_id and activity before summarise_all() and we will get the desired result.

```
summary_avg_data <- clean_data %>%
  group_by(subject_id, activity) %>%
  summarise_all(.funs = mean) %>% as.data.frame()
```

## Final Result

The final result (csv file) was also uploaded on this repo. You can check it here https://github.com/toyeiei/datasciencecoursera/blob/master/getting_and_cleaning_data/result.csv.

## Date Submitted

16 May 2019 by Kasidis Satangmongkol :)
