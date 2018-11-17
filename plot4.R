library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

CC%>%filter(grepl("[Cc]oal",CC$SCC.Level.Three )&grepl("[Cc]omb",CC$SCC.Level.One ))%>%
    select(SCC)%>% inner_join(dat)%>%group_by(year)%>%summarise(total=sum(Emissions))%>%
    ggplot(aes(year,total))+geom_line()+ylab("PM2.5, tons")+ggtitle("PM2.5 emission from coal combustion-related sources")
dev.copy(png, file = "plot4.png")
dev.off() 