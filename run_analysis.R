# directory name with all data
filename = "UCI HAR Dataset"
# if directory with data doesnt exist, download archive and unzip it
if(!(filename %in% dir())){
    download.file(
        "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
        destfile = paste(filename,".zip",sep = ""), 
        method = "curl"
    )
    unzip(filename)
}

# load all training data (dataset, activity and subjects)
training.set <- read.table(
    file = paste(filename, "/train/X_train.txt", sep=""), header = F
)
training.activity <- read.table(
    file = paste(filename, "/train/y_train.txt", sep=""), header = F
)
training.subject <- read.table(
    file = paste(filename, "/train/subject_train.txt", sep=""), header = F
)
# connect activity and subject to dataset
# V1, V2, ... => subject, activity, V1, V2, ...
training.set <- cbind(training.subject, training.activity, training.set)
    

# load all test data (dataset, activity and subjects)
test.set <- read.table(
    file = paste(filename, "/test/X_test.txt", sep=""), header = F
)
test.activity <- read.table(
    file = paste(filename, "/test/y_test.txt", sep=""), header = F
)
test.subject <- read.table(
    file = paste(filename, "/test/subject_test.txt", sep=""), header = F
)
# connect activity and subject to dataset
# V1, V2, ... => subject, activity, V1, V2, ...
test.set <- cbind(test.subject, test.activity, test.set)

# create new dataset from training and test datasets
new.set <- rbind(training.set, test.set)

# load column names from features.txt
features.set <- read.table(
    file = paste(filename, "/features.txt", sep=""), header = F,
    stringsAsFactors = F
)
features.set <- features.set[,2]
# connect "subject" and "activity" as first two column names
features.set <- c("subject", "activity", features.set)

# set new names to dataset
names(new.set) <- features.set
# select only columns where names are "subject", "activity" or contains "mean()" or "std()"
new.set <- new.set[
    names(new.set)=="subject" |
    names(new.set)=="activity" |
    grepl(names(new.set), pattern = "mean\\(\\)") | 
    grepl(names(new.set), pattern = "std\\(\\)")
]

# factorize "activity" and "subject" columns
new.set[["activity"]] <- factor( new.set[["activity"]] )
new.set[["subject"]] <- factor( new.set[["subject"]] )

# calculate mean values group by (activity, subject)
tidy.set <- aggregate(. ~ activity + subject, data=new.set, FUN=mean)

# save dataset to .Rdata and create table to .txt
save(list = c("new.set"), file = "tidy.set.Rdata")
write.table(x = tidy.set, file="tidy.set.txt", row.names = F)