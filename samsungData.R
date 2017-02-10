samsungData <- function(){
        train_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset/train"
        labels_dir <- "~/Desktop/Coursera/Cleaning Data/wearable_tech/UCI HAR Dataset"
        
        train_subs <- read.table(paste(train_dir, "subject_train.txt", sep = "/"))
        train_set <- read.table(paste(train_dir, "X_train.txt", sep = "/"))
        train_lab <- read.table(paste(train_dir, "y_train.txt", sep = "/"))
        
        features <- read.table(paste(labels_dir, "features.txt", sep = "/"))
        activities <- read.table(paste(labels_dir, "activity_labels.txt", sep = "/"))
        
        colnames(train_subs) <- "subject"
        colnames(train_lab) <- "activity"
        colnames(train_set) <- features[,2]
        
        library(dplyr)
        samsungData <- tbl_df(do.call("cbind", c(train_subs, train_lab, train_set)))
        
        samsungData <- samsungData %>%
                mutate(activity = plyr::mapvalues(activity,
                                                  from = c(1:6), 
                                                  to = as.character(activities[,2])),
                       activity = tolower(gsub("_", "", activity)))
                
        samsungData
}