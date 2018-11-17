library(tidyverse)
dat <- read_rds("./data/summarySCC_PM25.rds")
CC <- read_rds("./data/Source_Classification_Code.rds")

dat%>%group_by(year)%>%summarise(total=sum(Emissions)/10^6)->Q1 
with(Q1, plot(year,total, type = "l", ylab = "PM2.5, mln tons", main = "Total PM2.5 emission"))
dev.copy(png, file = "plot1.png")
dev.off()