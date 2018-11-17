library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

dat%>%filter(fips=="24510")%>%group_by(year, type)%>%summarise(total=sum(Emissions))%>%ggplot(aes(year,total, color=type))+ 
    geom_line()+ylab("PM2.5, tons")+ggtitle("PM2.5 emission in the Baltimore City by the type")
dev.copy(png, file = "plot3.png")
dev.off()