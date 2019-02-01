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