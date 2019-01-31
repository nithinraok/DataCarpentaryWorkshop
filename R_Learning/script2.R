download.file(url="https://ndownloader.figshare.com/files/2292169",destfile = "~/MyFiles/MS/USC/Spring_2019/DataCarpentaryWorkshop/R_Learning/portal_data_joined.csv")
setwd("~/MyFiles/MS/USC/Spring_2019/DataCarpentaryWorkshop/R_Learning/")
surveys <- read.csv("portal_data_joined.csv")
str(surveys)
dim(surveys) # Dimensions of data frame
surveys[1,]
surveys[2:3,]
head(surveys)
tail(surveys)

surveys[-1,] #Removes first row and returns 

aa=head(surveys)
aa[-1,2] # Removes first row and print 2 colums items

aa[,-c(1:2)]

head(surveys$month) # Selects column by name month


#Fcators

sex <-  factor(c("male","female","female","male"))
sex

levels(sex)

nlevels(sex)

summary(surveys)

plot(surveys$sex)

levels(surveys$sex)[1]

levels(surveys$sex)[1] <- "Undetermined"

plot(surveys$sex)
