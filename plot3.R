library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
# extracting emissions in Baltimore City, Maryland (fips == "24510") in a seperate dataframe
df1 <- subset(NEI,fips =="24510")

#calculating total emissions per year in Baltimore
df2 <- aggregate(df1[c('Emissions')], by=list(Year=df1$year,Type=df1$type), FUN=sum)

#plotting the graph
png(filename='plot3.png')

qplot(Year,Emissions,data=df2,color=Type,geom="line")+
        ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + 
        xlab("Year") + ylab("PM2.5 Emissions")    

dev.off()

