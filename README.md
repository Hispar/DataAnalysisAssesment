In this analysis the first done is retrieve the different types of data:

- Features names
- Activities labels
- Test data
- Train data

Test and Train data is divided in 3 diferent data sets each. 
This data sets are merged to end with 1 set for test and another one for train.

Having done that, Test and Train sets are merged, ending with one set of data.

After that using the features set and appending to it the names of two added columns, the names set is created.
This names set is added to the data frame.

The required data need to be filtered with the required params, in this case is filtered by column name.
The regular expresion used, filtered the names searching for standar deviations, means and the two added columns 
for subjects and activity.

In this phase of the analysis, the data2 data.frame, contains the filtered data.
In the filtered data.frame, the activities ids are replaced with their names.
Having done that, the subjects ids are converted into factors, to facilitate iterate over their values.

The final phase of this analysis, consists in iterate over the data2 data.frame.
The iteration is done first over subjects, and for each subject another iteration over activity, with the 
data obtained with this filter, a new temporal data frame is created, with only the means of the provided values.
The temporal data frame is joined to the final data frame once for each subject-activity.

The final set has one row for each subject - activity with the average of the values.

Last thing done is writing the result to a txt file.
