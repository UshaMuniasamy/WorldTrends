#load data
getwd()
setwd("G:/R programming/dataframe")
getwd()

data <- read.csv("WorldTrends.csv")
data
head(data)      
tail(data, n=7) 
str(data)     
summary(data)

#insight into the next session

data$Year
temp <- factor(data$Year)
temp
levels(temp)


#filter the data frame
data1960  <- data[data$Year == 1960,]
data2013  <- data[data$Year == 2013,]


#check row counts
nrow(data1960) #187
nrow(data2013) #187 row equal split


#creat the additioanal data frames
add1960  <- data.frame(Code=Country_Code, Life.Exp= Life_Expectancy_At_Birth_1960)
add2013  <- data.frame(Code = Country_Code, Life.Exp = Life_Expectancy_At_Birth_2013)


#checkSummarize
summary(add1960)
summary(add2013)

#merge the pairs of dataframes
merged1960  <- merge(data1960, add1960, by.x ="Country.Code", by.y="Code")
merged2013  <- merge(data2013, add2013, by.x="Country.Code", by.y ="Code")


#check the new structure
str(merged1960)
str(merged2013)

#Delete columns

merged1960$Year  <-NULL
merged2013$Year  <-2013

#visualization time
library(ggplot2)

#visualize the data1960 
qplot(data=merged1960, x= Fertility.Rate, y=Life.Exp, colour= Region,
      size=I(3),  alpha=I(0.6),main ="Life Expecatancy vs Fertility(1960)")
qplot(data=merged2013, x= Fertility.Rate, y=Life.Exp, colour= Region, size=I(3), 
      alpha=I(0.6),
      main ="Life Expecatancy vs Fertility(2013)")
