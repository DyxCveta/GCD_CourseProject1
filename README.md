# Getting and Cleaning Data Course Project

## Intro

From the project description:

>  The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. [...]

>  One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
>  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

>  Here are the data for the project: 
>  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

>  You should create one R script called run_analysis.R that does the following. 

>  1.  Merges the training and the test sets to create one data set.
>  1.  Extracts only the measurements on the mean and standard deviation for each measurement. 
>  1.  Uses descriptive activity names to name the activities in the data set
>  1.  Appropriately labels the data set with descriptive variable names. 
>  1.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## About this project

This course project contains:

1.  Original .zip-archive and unpacked files for analysis.
1.  **run_analysis.R** - code with minimum of comments.
1.  **CodeBook** .md/.Rmd/.html - Code Book with full description of code.
1.  **README** .md/.Rmd/.html - this file with project description.
1.  **tidy.set** .txt/.Rdata - Independent tidy data set with the average of each variable for each activity and each subject, according 5th stage in project description.

**CodeBook** contains all code and description, so you can open and execute it in RStudio. Dont forget to check active directory before start CodeBook.Rmd or run_analysis.R, because they need "UCI HAR Dataset" folder in active directory. If folder doesnt exist, script will automatically download it and unpack to active directory.
