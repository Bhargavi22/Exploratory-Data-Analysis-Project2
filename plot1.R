NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
# extracting emissions based on year into a seperate dataframe
table1 <- aggregate(NEI[c('Emissions')], by=list(NEI$year), FUN=sum)
# converting emission into kilotons
table1$PM <- round(table1[,2]/1000,2)

#plotting the graph
png(filename='plot1.png')

barplot(table1$PM, names.arg=table1$Group.1, 
        main=expression('Total Emission of PM2.5 per year '),
        xlab='Year', ylab=expression(paste('PM2.5 in Kilotons')))

dev.off()

