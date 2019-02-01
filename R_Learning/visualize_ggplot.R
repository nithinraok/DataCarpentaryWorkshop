# Data Visualization with ggplot2
library(ggplot2)

surveys_complete <- read.csv("surveys_complete.csv")

surveys_plot <- ggplot(data=surveys_complete,
                       mapping = aes(x=weight,y=hindfoot_length))
surveys_plot+geom_point()
surveys_plot+geom_point(alpha=0.1,color='hotpink')
surveys_plot+geom_point(alpha=0.1,aes(color=species_id))


surveys_plot <- ggplot(data=surveys_complete,
                       mapping = aes(x=weight,y=species_id,color=plot_id))
surveys_plot+geom_point()

plot <- ggplot(data=surveys_complete,aes(x=species_id,y=weight))
plot+geom_jitter(alpha=0.1,color='red')+
    geom_boxplot(alpha=0.1)+
    ylab("Weight in grams")+
    xlab("Species IDs")+
    theme_bw()

plot <- ggplot(data=surveys_complete,aes(x=species_id,y=hindfoot_length))
plot+geom_jitter(alpha=0.1,color='red')+
    geom_violin(alpha=0.1)+scale_y_log10()+
    ylab("Weight in grams")+
    xlab("Species IDs")+
    labs(title="This is Survey Plot")+
    theme_bw()

surveys_complete$plot_id <- as.factor(surveys_complete$plot_id)
plot <- ggplot(data=surveys_complete,aes(x=species,y=hindfoot_length))
plot+
    geom_jitter(aes(color=plot_id))+
    geom_boxplot()
    

surveys_complete %>% 
    count(year,species_id) %>% 
    ggplot(aes(x=year,y=n))+
    geom_line()+
    facet_wrap(~species_id)
