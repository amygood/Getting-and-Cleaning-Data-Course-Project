library(tidyverse)

# Appropriately label the data set with descriptive variable names ----
features <- read_delim("UCI HAR dataset/features.txt", # read features
                       col_names = c("row", "feature"),
                       delim = " ")
features <- pull(features, feature) # get character vector of features
features <- str_replace_all(features, "-", "_") # replace hyphen with underscore
features <- str_remove(features, "_$") # remove trailing underscores
features <- gsub('([a-z])([A-Z])', '\\1_\\2', features) # insert underscore between camel casing
features <- tolower(features) # make lowercase
features <- gsub('body_body', 'body', features) # replace body_body with body (is typo according to coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project/discussions/threads/yD2gtalxEeelRgqEwi0dZA/replies/tKU-ZKr_EeeANQrOhBtvUA)

# Training data ----
train_labels <- read_table("UCI HAR dataset/train/y_train.txt", # read training labels
                          col_names = "activity_num")
train_subjs <- read_table("UCI HAR dataset/train/subject_train.txt", # read training subject info
                         col_names = "subject")
train_data <- read_table("UCI HAR dataset/train/X_train.txt", # read training measurements
                         col_names = features) # column names from features
train_data <- cbind(train_labels, train_data) # combine training labels with measurements
train_data <- cbind(train_subjs, train_data) # combine subject info with combined training data
train_data$subject <- as.factor(train_data$subject) # make subject factor

# Test data ----
test_labels <- read_table("UCI HAR dataset/test/y_test.txt", # read test labels
                          col_names = "activity_num")
test_subjs <- read_table("UCI HAR dataset/test/subject_test.txt", # read test subject info
                         col_names = "subject")
test_data <- read_table("UCI HAR dataset/test/X_test.txt", # read test measurements
                        col_names = features)
test_data <- cbind(test_labels, test_data) # combine test labels with measurements
test_data <- cbind(test_subjs, test_data) # combine subject info with combined test data
test_data$subject <- as.factor(test_data$subject) # make subject factor

# Merge the training and the test sets to create one data set ----
comb_data <- rbind(test_data, train_data) # combines training and test data

# Use descriptive activity names to name the activities in the data set ----
activity_labels <- read_table("UCI HAR dataset/activity_labels.txt", # read activity names
                              col_names = c("activity_num", "activity_name"))
comb_data <- merge(comb_data, activity_labels, by = "activity_num") # merge activity names with combined data (by activity number)
comb_data$activity_name <- tolower(comb_data$activity_name) # make activity_name lower case
comb_data$activity_name <- as.factor(comb_data$activity_name) # make activity_name factor

# Extract only the measurements on the mean and standard deviation for each measurement ----
sel_colnames <- subset(colnames(comb_data),
                               str_detect(colnames(comb_data),
                                          "mean\\(|std\\(")) # subset column names of combined data to mean and std
sel_comb_data <- select(comb_data, c(sel_colnames, # subset comb_data to sel_colnames, subject, and activity_name
                                       "subject",
                                       "activity_name"))
all(duplicated(sel_comb_data) == FALSE) # check for duplicate rows
summary(sel_comb_data) # first data set
write.table(sel_comb_data, # write to file
            "sel_comb_data.txt",
            row.names = FALSE)

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
sel_comb_data_means <- sel_comb_data %>% 
  group_by(subject, activity_name) %>%
  summarise_all(funs(mean))
summary(sel_comb_data_means) # second data set
write.table(sel_comb_data_means, # write to file
          "sel_comb_data_means.txt",
          row.names = FALSE)