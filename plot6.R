library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

CC%>%filter(grepl("[Vv]eh",CC$SCC.Level.Three ))%>%select(SCC)%>%inner_join(dat)%>%filter(fips %in% c("24510","06037"))%>%
    mutate(fips = factor(fips,labels = c("Los Angeles County","Baltimore City")))%>%group_by(year,fips)%>%
    summarise(total=sum(Emissions))%>%ggplot(aes(year,total,color=fips))+geom_line()+ylab("PM2.5, tons")+
    ggtitle("PM2.5 emission from motor vehicle sources")+scale_y_log10()
dev.copy(png, file = "plot6.png")
dev.off()
