### Getting and Cleaning Data Course Project

In this analysis the first done is retrieve the different types of data:

  - Features names
  - Activities labels
  - Test data
  - Train data

Test and Train data is divided in 3 diferent data sets each.

#### Preparation
* Merging test data sets into one named *test*
* Merging train data sets into one named *train*
* Merging *train* and *test* into one data set *data*
* Create names set
* Add names set to *data*

#### Manipulation
* Filtering data by column name, resulting data stored into *data2*
* Replace activities ids with their names.
* Converting subjects ids as factors. (Is easy to iterate over them)
* Iterate over subjects and activities.
* For each subject-activity, calculate the average values and append in the *final* data frame.
* Write *final* data frame to *assesment.txt*
