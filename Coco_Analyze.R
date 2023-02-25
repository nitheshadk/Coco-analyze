library(dplyr)
library(ggplot2)
library(lattice)
library(readr)
library(plyr)

df = read_csv("flavors_of_cacao.csv")
colSums(is.na(df))

#coloumns
n <- length(colnames(df))
vec1 <- c(1:n)
data.frame(vec1, colnames(df))

#rename coloumns
colnames(df)=c("company","origin_bar","reviews","review_date","coco_per","location","rating","bean_type","bean_origin")
head(df)

#filling empty strings
df["bean_type"][is.na(df["bean_type"])] <- "Unknown" 
df["bean_origin"][is.na(df["bean_origin"])] <- "Unknown" 
count(df,"bean_type")

#summary
summary(df)
histogram(~reviews,df)

#choco percent
df2= subset(df, coco_per >=80)

#rating of a choco
df3= subset(df2,rating>=3.75)
count(df3,"location")

ggplot(data = df3, aes(x = location, y=rating)) + 
  geom_bar(stat="summary", aes(fill=coco_per))


ggplot(data = df3, aes(x = bean_type, y=rating)) + 
  geom_bar(stat="summary", aes(fill=coco_per))


