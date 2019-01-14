# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set as part of the course ["Getting and Cleaning Data"](https://www.coursera.org/learn/data-cleaning/home/welcome) by Johns Hopkins University on Coursera. The project involves cleaning a data set of measurements taken using a smartphone during different activities. For details of the variables in the resulting cleaned data sets, please refer to `Codebook.md`.

## The data set

The data set (not included in this repository) can be obtained from the UC Irvine Machine Learning Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

The data set contains measurements taken from 30 volunteers as they performed 6 activities (laying, sitting, standing, walking, walking_downstairs, or walking_upstairs) whilst wearing a smartphone (Samsung Galaxy S II), using the smartphone's embedded accelerometer and gyroscope. More information about the data is available from [the UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) where the data can be obtained.

## The data cleaning script

`run_analysis.R` is the data cleaning script. It reads the following files from the `UCI HAR Dataset/` folder:

* `features.txt`
* `train/y_train.txt`
* `train/subject_train.txt`
* `train/X_train.txt`
* `test/y_test.txt`
* `test/subject_test.txt`
* `test/X_test.txt`
* `activity_labels.txt`

### Features
`features.txt` contains the 561 variables names for the `X_test.txt` and `X_train.txt` data sets. `run_analysis.R` cleans these variable names with some text processing to remove hyphens and typos and change the names from camel case to lower case separated by underscores. These variable names (`features`) are later used as column names for reading the `X_test.txt` and `X_train.txt` data sets.

### Training and test data sets
For both training and test data sets, there are 3 files:

* `y_test.txt`,`y_train.txt`: data set with 1 column providing activity number data
* `subject_test.txt`,`subject_train.txt`: data set with 1 column providing subject data
* `X_test.txt`,`X_train.txt`: data set with 561 columns providing measurement data

`run_analysis.R` combines these three files to create one dataframe for training data sets (`train_data`) and test data sets (`test_data`) respectively. These 2 dataframes are combined to create one dataframe (`comb_data`) for additional processing.

### Activity labels
`activity_labels.txt` provides descriptive activity names for the activity numbers in the combined data. `activity_labels` and `comb_data` are merged by the `activity_num` variable to create an updated `comb_data` with a descriptive activity name.

### Extracting the mean and standard deviation for each measurements
In order to extract only the the mean and standard deviation for each measurement, `run_analysis.R` subsets the variable names in `comb_data` to those containing `mean()` or `_std()`. This new vector of variable names (`sel_colnames`) is used to subset the dataframe producing the the first tidy dataframe requested by the exercise: `sel_comb_data`. The dataframe is written to file as `sel_comb_data.txt`.

### Creating a data set with the mean of each variable for each activity and subject
In order to create the second data set with the mean of each variable for each activity and each subject, `run_analysis.R` takes sel_comb_data, groups by subject and activity name, and then uses `summarise_all()` to get the mean of each column, resulting the tidy dataframe requested by the exercise: `sel_comb_data_means`. The dataframe is written to file as `sel_comb_data_means.txt`.