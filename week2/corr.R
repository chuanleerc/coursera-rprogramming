# Chuan Lee
# R Programming course by Johns Hopkins University
# Coursera https://www.coursera.org/learn/r-programming/
# January 2017 Session
# Programming assignment 1: Air Pollution
# Week 2 - Part 3

# Write a function that takes a directory of data files and a threshold
# for complete cases and calculates the correlation between sulfate and
# nitrate for monitor locations where the number of completely observed
# cases (on all variables) is greater than the threshold. The function
# should return a vector of correlations for the monitors that meet the
# threshold requirement. If no monitors meet the threshold requirement,
# then the function should return a numeric vector of length 0. A
# prototype of this function follows:

# 'directory' is a character vector of length 1 indicating
# the location of the CSV files
  
# 'threshold' is a numeric vector of length 1 indicating the
# number of completely observed observations (on all
# variables) required to compute the correlation between
# nitrate and sulfate; the default is 0
  
# Return a numeric vector of correlations
# NOTE: Do not round the result!

corr <- function(directory, threshold = 0) {
  liste<-paste0(directory,"/",list.files(directory))

  df_cc<-complete(directory)
  nobs<-df_cc$nobs
  id_nobs<-df_cc$id[nobs>threshold]

  correlation <- c()
  for (i in id_nobs){
    df1<-read.csv(liste[i],header=TRUE)
    correlation <- c(correlation,cor(df1$sulfate,df1$nitrate,use="complete.obs"))
  }

correlation

}


#source("corr.R")
#source("complete.R")
#cr <- corr("specdata", 150)
#head(cr)
## [1] -0.01896 -0.14051 -0.04390 -0.06816 -0.12351 -0.07589
#summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.2110 -0.0500  0.0946  0.1250  0.2680  0.7630
#cr <- corr("specdata", 400)
#head(cr)
## [1] -0.01896 -0.04390 -0.06816 -0.07589  0.76313 -0.15783
#summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -0.1760 -0.0311  0.1000  0.1400  0.2680  0.7630
#cr <- corr("specdata", 5000)
#summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
#length(cr)
## [1] 0
#cr <- corr("specdata")
#summary(cr)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## -1.0000 -0.0528  0.1070  0.1370  0.2780  1.0000
#length(cr)
## [1] 323
