library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

dat%>%filter(fips=="24510")%>%group_by(year)%>%summarise(total=sum(Emissions)/10^3)->Q2 
with(Q2, plot(year,total, type = "l", ylab = "PM2.5, thsd tons", main = "PM2.5 emission in the Baltimore City"))
dev.copy(png, file = "plot2.png")
dev.off()