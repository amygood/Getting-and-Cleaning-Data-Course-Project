# Code book 

## Description

*The following description is a modified version of the description available in `features_info.txt` accompanying the original data set available from [the UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).*

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals `t_acc_x/y/z` and `t_gyro_x/y/z`. These time domain signals (prefix `t_` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`t_body_acc_x/y/z` and `t_gravity_acc_x/y/z`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`t_body_acc_jerk_x/y/z` and `t_body_gyro_jerk_x/y/z`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`t_body_acc_mag`, `t_gravity_acc_mag`, `t_body_acc_jerk_mag`, `t_body_gyro_mag`, `t_body_gyro_jerk_mag`). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `f_body_acc_x/y/z`, `f_body_acc_jerk_x/y/z`, `f_body_gyro_x/y/z`, `f_body_acc_jerk_mag`, `f_body_gyro_mag`, `f_body_gyro_jerk_mag`. (Note the `f_` to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern (`_x/y/z` is used to denote 3-axial signals in the X, Y and Z directions). Mean and standard deviation measures for each signal are included (indicated with `_mean()` and `_std()` suffixes).

## Variable names

Non-measurement variables:

* `subject`: volunteer number
* `activity_name`: name of activity (`laying`, `sitting`, `standing`, `walking`, `walking_downstairs`, `walking_upstairs`)

The following suffixes are used for measurement variables:

* `_mean()`: mean
* `_std()`: standard deviation
* `_x/y/z`: X, Y, or Z axial direction

The following prefixes are used for measurement variables:

* `t_`: time
* `f_`: frequency

Measurement variables:
 
* `body_acc`: body acceleration signal
* `gravity_acc`: gravity acceleration signal
* `body_acc_jerk`: body acceleration jerk signal
* `body_gyro`: body gyroscope signal
* `body_gyro_jerk`: body gyroscope jerk signal
* `body_acc_mag`: body acceleration magnitude signal
* `gravity_acc_mag`: gravity acceleration magnitude signal
* `body_acc_jerk_mag`: body acceleration jerk magnitude signal
* `body_gyro_mag`: body gyroscope magnitude signal
* `body_gyro_jerk_mag`: body gyroscope jerk magnitude signal