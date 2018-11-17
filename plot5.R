library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

CC%>%filter(grepl("[Vv]eh",CC$SCC.Level.Three ))%>%select(SCC)%>%inner_join(dat)%>%filter(fips=="24510")%>%
    group_by(year)%>%summarise(total=sum(Emissions))%>%ggplot(aes(year,total))+
    geom_line()+ylab("PM2.5, tons")+ggtitle("PM2.5 emission from motor vehicle sources in Baltimore City")
dev.copy(png, file = "plot5.png")
dev.off()