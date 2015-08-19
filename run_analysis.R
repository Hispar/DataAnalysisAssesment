# Reading features data
features <- read.table('features.txt')
# Reading labels data
activity_labels <- read.table('activity_labels.txt')

# Reading test data
xtest <- read.table('test/X_test.txt')
ytest <- read.table('test/y_test.txt')
subjecttest <- read.table('test/subject_test.txt')

# Merging test data
test <- cbind(xtest, ytest, subjecttest)

# Reading train data
xtrain <- read.table('train/X_train.txt')
ytrain <- read.table('train/y_train.txt')
subjecttrain <- read.table('train/subject_train.txt')

# Merging train data
train <- cbind(xtrain, ytrain, subjecttrain)

# Joining test and train data
data <- rbind(test, train)

# Adding names to columns
name_features <- factor(append(as.character(features$V2),"activity"))
name_features <- factor(append(as.character(name_features),"subject"))
names(data) <- name_features

# Filtering the data for standar deviations and means, including also ssubjects and activity
data2 <- data[, grepl("[Ss]td|[Mm]ean|subject|activity", names(data))]

# Replacing activities with their labels
for (val in activity_labels$V1){
    data2$activity <- replace(data2$activity, data2$activity==val, as.character(activity_labels$V2[val]))
}

# Converting subjects into factors
data2$subject <- factor(data2$subject)

# Create final data frame
final <- data.frame()

# iterate over subjects
for (subject in levels(data2$subject)){
    # iterate over activities
    for (val in activity_labels$V2){
        # extract values for each subject and activity
        activity_subject <- data2[data2$activity == val & data2$subject==subject,]
        # Create a temporal data frame for each row
        activity_means = data.frame(subject = subject, activity = val)
        # iterate over activities extracting the means
        for (feature in names(activity_subject)) {
            # only calculate means if is a numeric value
            if (is.numeric(activity_subject[[feature]])){
                activity_means[[feature]] <- mean(activity_subject[[feature]])
            }
        }
        # merge temporal data frame with final one
        final <- rbind(final, activity_means)
    }
}

# save the assesment file
write.table(final, file="assesment.txt", row.names = FALSE)

