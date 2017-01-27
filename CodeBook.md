# Code Book for University of California Irvine Human Activity Recognition Using Smartphones Data Set

## Processing of data
	* The original data came from here: 
	  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
	* Data was downloaded and extracted from the .zip file provided:
	  (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	* Datasets from the 'test' and 'train' directories are combined
	* Variables are extracted from the merged dataset that are mean or standard deviations 
	  (denoted by mean() or std() in the column name)
	* Parenthesis and dashes are removed from variable names for ease of typing and brevity.
	* Activities and subject numbers are converted to factors for readability
	* Mean values are computed by activity and subject then merged into a single table
	* Data is formatted as tidy "wide" data. The observations are the subjects performing the activity. The variables
	  include all the data collected in that observation and are likely to be all interdependent.
	* Resulting data saved as a .txt file. Retrieve using: read.table("./UCI_summary_dataset.txt", header = TRUE )

## Understanding the variables
	* The variable names are composite names. Names are decoded in the provided .zip file in 
	  the 'features_info.txt' file.
	* Parenthesis and dashes are removed for ease of typing and brevity.
	* 'AveragedBy' is the name of the observation 
	* Variables included in the summary include: 
		AveragedBy
		tBodyAccmeanX
		tBodyAccmeanY
		tBodyAccmeanZ
		tBodyAccstdX
		tBodyAccstdY
		tBodyAccstdZ
		tGravityAccmeanX
		tGravityAccmeanY
		tGravityAccmeanZ
		tGravityAccstdX
		tGravityAccstdY
		tGravityAccstdZ
		tBodyAccJerkmeanX
		tBodyAccJerkmeanY
		tBodyAccJerkmeanZ
		tBodyAccJerkstdX
		tBodyAccJerkstdY
		tBodyAccJerkstdZ
		tBodyGyromeanX
		tBodyGyromeanY
		tBodyGyromeanZ
		tBodyGyrostdX
		tBodyGyrostdY
		tBodyGyrostdZ
		tBodyGyroJerkmeanX
		tBodyGyroJerkmeanY
		tBodyGyroJerkmeanZ
		tBodyGyroJerkstdX
		tBodyGyroJerkstdY
		tBodyGyroJerkstdZ
		tBodyAccMagmean
		tBodyAccMagstd
		tGravityAccMagmean
		tGravityAccMagstd
		tBodyAccJerkMagmean
		tBodyAccJerkMagstd
		tBodyGyroMagmean
		tBodyGyroMagstd
		tBodyGyroJerkMagmean
		tBodyGyroJerkMagstd
		fBodyAccmeanX
		fBodyAccmeanY
		fBodyAccmeanZ
		fBodyAccstdX
		fBodyAccstdY
		fBodyAccstdZ
		fBodyAccJerkmeanX
		fBodyAccJerkmeanY
		fBodyAccJerkmeanZ
		fBodyAccJerkstdX
		fBodyAccJerkstdY
		fBodyAccJerkstdZ
		fBodyGyromeanX
		fBodyGyromeanY
		fBodyGyromeanZ
		fBodyGyrostdX
		fBodyGyrostdY
		fBodyGyrostdZ
		fBodyAccMagmean
		fBodyAccMagstd
		fBodyBodyAccJerkMagmean
		fBodyBodyAccJerkMagstd
		fBodyBodyGyroMagmean
		fBodyBodyGyroMagstd
		fBodyBodyGyroJerkMagmean
		fBodyBodyGyroJerkMagstd



