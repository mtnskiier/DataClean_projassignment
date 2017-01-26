run_analysis <- function() {
        ## PURPOSE: Perform the basic data acquisition and cleaning of the "Human Activity Recognition
        ##      Using Smartphone" dataset from the University of California Irvine. 
        ##
        ## INPUTS: Data sets from: 
        ##      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
        ##      Datasets are available in the "./data" directory relative to the R script
        ##
        ## OUTPUTS: 
        ##      Tidy data set of a merged training and test data sets
        ##      A secondary summary tidy data set containing the averages for each valiable, by 
        ##      activity and subject.
        ##
        
        ## set up environment and load datasets
        library(dplyr)
        library(Hmisc)
        
        ## load activity_labels
        activities <- read.table("./data/activity_labels.txt")
        
        ## load and merge the test and train data sets
        test_data <- read.table("./data/test/X_test.txt")
        test_act <- read.table("./data/test/y_test.txt")
        test_subject <- read.table("./data/test/subject_test.txt")
        
        train_data <- read.table("./data/train/X_train.txt")
        train_act <- read.table("./data/train/y_train.txt")
        train_subject <- read.table("./data/train/subject_train.txt")
        
        all_test <- cbind(test_subject, test_act, test_data)
        all_train <-  cbind(train_subject, train_act, train_data)

        all_data <- rbind(all_test, all_train)
        
        ## determine which variable are of interest (mean and std only)
        
        feature_list <- read.table("./data/features.txt", stringsAsFactors = FALSE)
        
        select_features <- grep("*mean\\(\\)*|*std\\(\\)*", feature_list$V2, ignore.case = TRUE)
        
        ## Subset the data and offset by 2 to account for subject and activity index
        
        seldata <- all_data[ , c(1:2, select_features+2)]
        
        ## assign meaningful column names
        
        names(seldata) <- c("subject", "activity", feature_list$V2[select_features])
        newnames <- gsub("\\(\\)", "", names(seldata))
        names(seldata) <- gsub("\\-", "", newnames)
        
        ## Make subject names factors
        seldata$subject <- factor(seldata$subject, 
                                  levels = c(1:30),
                                  labels = paste0("Subject", 1:30), 
                                  ordered = TRUE)
        

        ## Make activty names factors
        seldata$activity <- factor(seldata$activity, 
                                levels = c(1:6),
                                labels = c("walking", "walkingupstairs", "walkingdownstairs", 
                                            "sitting", "standing", "laying"), 
                                ordered = TRUE)

        head(seldata)
        str(seldata)
        
        ## create summary - avg of each var by activity 
        act_avg <- seldata %>% group_by(activity) %>% summarize_all( mean ) %>% 
                select( -subject ) 
        names(act_avg)[1] <- "Averaged By"
   
        ## create summary - avg of each var by subject
        sub_avg <- seldata %>% group_by(subject) %>% summarize_all( mean ) %>% 
                select( -activity ) 
        names(sub_avg)[1] <- "Averaged By"
        average_summary <- rbind(act_avg, sub_avg)

        ## save tidy dataset
        write.csv(average_summary, "./UCI_summary_dataset.csv", row.names = FALSE)
        
       
}