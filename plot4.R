library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Selecting source type having "Coal" owrd in it
df1<- SCC[grepl("Coal" , SCC$Short.Name), ]

#merging NEI and SCC datasets based on value of SCC
merge1 <- merge(x=NEI, y=df1, by='SCC')

#finding aggregate of Emission based on Year
df2<-  aggregate(merge1[c('Emissions')], by=list(Year=merge1$year), FUN=sum)

#plotting the graph
png(filename='plot4.png')

qplot(Year,Emissions,data=df2,geom=c('line','point'),color=Year)+
        theme_bw()+
        ggtitle("Total Emmisions from coal combustion-related sources")+
        xlab("Year") + ylab("Emissions in US")+
        scale_colour_gradient(low='red', high='green')
     

dev.off()



