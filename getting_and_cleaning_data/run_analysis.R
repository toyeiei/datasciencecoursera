## Getting and Cleaning Data - Course Project
## Script Created on 16 May 2019
## run_analysis.R to perform data cleaning

## check working directory
getwd()
setwd("C:\\Users\\T906827\\Documents\\UCI HAR Dataset")

## read data into RStudio
subject_train <- read.table(file = ".\\train\\subject_train.txt") ## 7352 rows
x_train <- read.table(file = ".\\train\\X_train.txt") ## 7352 rows 561 columns
y_train <- read.table(file = ".\\train\\y_train.txt") ## 7352 rows
subject_test <- read.table(file = ".\\test\\subject_test.txt") ## 2947 rows
x_test <- read.table(file = ".\\test\\X_test.txt") ## 2947 rows 561 columns
y_test <- read.table(file = ".\\test\\y_test.txt") ## 2947 rows
  
## dplyr and stringr are two main packages for data manipulation in R
library(dplyr)
library(stringr)

## [1] Merges the training and the test sets to create one data set.
train_data <- subject_train %>% bind_cols(x_train) %>% bind_cols(y_train)
test_data <- subject_test %>% bind_cols(x_test) %>% bind_cols(y_test)
full_data <- train_data %>% bind_rows(test_data)
dim(full_data) ## 10299 563

## [2] Appropriately labels the data set with descriptive variable names.
featureNames <- read.table(file = "features.txt")
featureNames <- tolower(featureNames$V2)
featureNames <- c("subject_id", featureNames, "activity")
featureNames <- str_replace_all(featureNames, pattern = "-", ".")
featureNames <- str_replace_all(featureNames, pattern = "\\(", "")
featureNames <- str_replace_all(featureNames, pattern = "\\)", "")
featureNames <- make.names(featureNames)
names(full_data) <- featureNames

## [3] Extracts only the measurements on the mean and standard deviation for each measurement.
(mean_cols <- grep(pattern = "(\\.mean$)|(mean\\.[xyz])$", x = featureNames, 
                  ignore.case = T, value = T))
(std_cols <- grep(pattern = "(\\.std$)|(std\\.[xyz])$", x = featureNames, 
                 ignore.case = T, value = T))
(mean_std_cols <- c("subject_id", "activity", mean_cols, std_cols))
clean_data <- full_data[, mean_std_cols]

## [4] Uses descriptive activity names to name the activities in the data set
clean_data %>% count(activity) ## 1722 1544 1406 1777 1906 1944
clean_data$activity <- factor(clean_data$activity, 
                              levels = c(1,2,3,4,5,6),
                              labels = c("WALKING", 
                                         "WALKING_UPSTAIRS",
                                         "WALKING_DOWNSTAIRS",
                                         "SITTING",
                                         "STANDING",
                                         "LAYING"))

clean_data %>% count(activity) ## check the labels are correct

## [5] From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
summary_avg_data <- clean_data %>%
  group_by(subject_id, activity) %>%
  summarise_all(.funs = mean) %>% as.data.frame()

## check the final result
glimpse(summary_avg_data)

## export csv file
write.csv(summary_avg_data, "result.csv")

## -------------- DONE -------------- ##
