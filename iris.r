#Maninpulating Data sets into a different sizing orientation
#setwd("/Users/ehizojiealli/Documents/practice-r/Data manipulation")
#getwd()

df <- read.csv("iris.csv")
head(df)
summary(df)

#structure of data
str(df)


library(tidyverse)

#Including only groups 1 - 4.
df1 = select(df, 1:4)
head(df1)

#Filtering the Species column for only setosa.
df_setosa = filter(df,Species == "setosa")
head(df_setosa)

#Gathering/Grouping of data from .csv file containing
#Column titles for columns 1 - 4 are organized into 1 and titled Measurement
#Numerical values underneath the 4 previous columns are labeled under length
#The filter created in df_setosa 'Species' remains.
df_long = gather(df,Measurement, length, 1:4)
head(df_long)

#Organizing data (df_long) by species
df_summarized = group_by(df_long,Species)
head(df_summarized)

#Added new parameters to grouping, now by Species and Measurement
df1_summarized = group_by(df_long,Species,Measurement)
head(df1_summarized)

#Apply mean and standard deviation and place within table
df1_summarized = group_by(df_long,Species,Measurement) 
head(df1_summarized,mean = mean(length), sd = sd(length))

