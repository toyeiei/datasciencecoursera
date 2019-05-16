# CodeBook

This is a codebook for the final result - result.txt

## Background

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

This means the final result will have 30 volunteers x 6 activities = 180 records and 68 columns (subject_id, activity, and 66 average statistics). We'll discuss this dataset below.

## Variables

#### Column1: subject_id

subject_id contains integer between 1-30, represent 30 volunteers in this experiment.

#### Column2: activity

The activity variable (factor) contains six actions as presented in the below table.

|id |	activity |
| --- | --- |
| 1	| WALKING |
| 2	| WALKING_UPSTAIRS |
| 3	| WALKING_DOWNSTAIRS |
| 4	| SITTING |
| 5	| STANDING |
| 6	| LAYING |

#### Column3-68: features that contain mean, std statistics

I used regular expressions to detect the columns that contains mean or std as discussed in detail the README.md. There are 66 columns that meet this criterion. I also cleaned variable names using `make.names()`, replace "-" with "." and remove "(" and ")". Below are the final features included in our analysis.

| feature | 
| --- |
| tbodyacc.mean.x |
| tbodyacc.mean.y |
| tbodyacc.mean.z |
| tgravityacc.mean.x |
| tgravityacc.mean.y |
| tgravityacc.mean.z |
| tbodyaccjerk.mean.x |
| tbodyaccjerk.mean.y |
| tbodyaccjerk.mean.z |
| tbodygyro.mean.x |
| tbodygyro.mean.y |
| tbodygyro.mean.z |
| tbodygyrojerk.mean.x |
| tbodygyrojerk.mean.y |
| tbodygyrojerk.mean.z |
| tbodyaccmag.mean |
| tgravityaccmag.mean |
| tbodyaccjerkmag.mean |
| tbodygyromag.mean |
| tbodygyrojerkmag.mean |
| fbodyacc.mean.x |
| fbodyacc.mean.y |
| fbodyacc.mean.z |
| fbodyaccjerk.mean.x |
| fbodyaccjerk.mean.y |
| fbodyaccjerk.mean.z |
| fbodygyro.mean.x |
| fbodygyro.mean.y |
| fbodygyro.mean.z |
| fbodyaccmag.mean |
| fbodybodyaccjerkmag.mean |
| fbodybodygyromag.mean |
| fbodybodygyrojerkmag.mean |
| tbodyacc.std.x |
| tbodyacc.std.y |
| tbodyacc.std.z |
| tgravityacc.std.x |
| tgravityacc.std.y |
| tgravityacc.std.z |
| tbodyaccjerk.std.x |
| tbodyaccjerk.std.y |
| tbodyaccjerk.std.z |
| tbodygyro.std.x |
| tbodygyro.std.y |
| tbodygyro.std.z |
| tbodygyrojerk.std.x |
| tbodygyrojerk.std.y |
| tbodygyrojerk.std.z |
| tbodyaccmag.std |
| tgravityaccmag.std |
| tbodyaccjerkmag.std |
| tbodygyromag.std |
| tbodygyrojerkmag.std |
| fbodyacc.std.x |
| fbodyacc.std.y |
| fbodyacc.std.z |
| fbodyaccjerk.std.x |
| fbodyaccjerk.std.y |
| fbodyaccjerk.std.z |
| fbodygyro.std.x |
| fbodygyro.std.y |
| fbodygyro.std.z |
| fbodyaccmag.std |
| fbodybodyaccjerkmag.std |
| fbodybodygyromag.std |
| fbodybodygyrojerkmag.std |

## Download this dataset

The dataset is freely available for research on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Final Clean Result

Please see the final clean result heer https://github.com/toyeiei/datasciencecoursera/blob/master/getting_and_cleaning_data/result.csv. (CSV looks nicer on github :))
