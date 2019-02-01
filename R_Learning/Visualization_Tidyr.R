library(dplyr);library(readr);library(tidyr);library(ggplot2)

# Read in csv file
surveys <-  read_csv("portal_data_joined.csv")

#View the data as it looks like in spreadsheet
View(surveys)

# Select columns
select(surveys,plot_id,species_id,weight) # from dplyr
select(surveys,-species_id,-weight) # from dplyr except species and weight
select(surveys,month:sex)

# Select rows just like pandas filtering rows
filter(surveys,year==1995) # display rows with year == 1995

surveys2 <- filter(surveys,weight<5)
surveys_sml <- select(surveys2,species_id,sex,weight)
View(surveys2)

#Pipes
pipes_view<- surveys %>% 
    filter(weight<5) %>% 
    select(species_id,sex,weight)

View(pipes_view)

View(surveys %>% 
         filter(year<1995) %>% 
         select(year,sex,weight))

#Mutate columns -> Create new columns based on eisting columns
 
View(surveys %>% mutate(weight_kg=weight/1000))

surveys %>% filter(!is.na(weight)) %>% 
    mutate(weight_kg=weight/1000) %>% 
    head()

surveys %>% group_by(sex) %>% 
         summarize(mean_weight=mean(weight,na.rm=TRUE))

# Sort by column

surveys %>% arrange(desc(weight)) %>% head() ## desc for descending 

surveys %>% group_by(sex) %>% 
    summarize(count=n())

surveys %>% 
    count(sex,sort=TRUE)

# Reshaping data

surveys_gw <- surveys %>% 
    filter(!is.na(weight)) %>% 
    group_by(genus,plot_id) %>% 
    summarize(mean_weight=mean(weight))

View(surveys_gw)

surveys_spread <- surveys_gw %>% 
    spread(key=genus, value = mean_weight)

View(surveys_spread)

##Gather back again

surveys_gather<- surveys_spread %>% 
    gather(key = genus,value = mean_weight,-plot_id)

View(surveys_gather)


# Exporting data

surveys_complete <- surveys %>% 
    filter(!is.na(hindfoot_length),
           !is.na(weight),
           !is.na(sex))

species_counts <- surveys_complete %>% 
    count(species_id) %>% 
    filter(n>=50)

surveys_common <- surveys_complete %>% 
    filter(species_id %in% species_counts$species_id)

View(species_counts)
View(surveys_common)    

write.csv(surveys_common,file="surveys_complete.csv")


# Data Visualization with ggplot2
library(ggplot2)

surveys_complete <- read.csv("surveys_complete.csv")

ggplot(data=surveys_complete,
       mapping = aes(x=weight,y=hindfoot_length))+geom_point()
