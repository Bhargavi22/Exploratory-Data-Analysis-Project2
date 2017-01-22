NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
# extracting emissions in Baltimore City, Maryland (fips == "24510") in a seperate dataframe
df1 <- subset(NEI,fips =="24510")

# extracting emissions from df1 based on year into a seperate dataframe
df2 <- aggregate(df1[c('Emissions')], by=list(Year=df1$year), FUN=sum)


#plotting the graph
png(filename='plot2.png')

barplot(df2$Emissions, names.arg=df2$Year, 
        main=expression('Total Emission of PM2.5 in Baltimore per year '),col=8,
        xlab='Year', ylab=expression(paste('PM2.5 Emission in tons')))

dev.off()

