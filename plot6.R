library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
#subsetting data for Baltimore city
df1 <- subset(NEI,fips == "24510" & type=="ON-ROAD")
df1_1 <- aggregate(df1[c('Emissions')], by=list(Year=df1$year), FUN=sum)
df1_1$City <- "Baltimore City, MD"

#subsetting data for LA
df2<- subset(NEI,fips=="06037" & type=="ON-ROAD")
df2_1 <- aggregate(df2[c('Emissions')], by=list(Year=df2$year), FUN=sum)
df2_1$City <- "Los Angeles County, CA"

#combining the 2 dataframe into a single DF
df3=rbind(df1_1,df2_1)

#plotting the graph
png(filename='plot6.png')

ggplot(data=df3,aes(x=factor(Year), y=Emissions,fill=Year,label=round(Emissions,0)))+
        geom_bar(stat="identity")+
        facet_grid(City~.,scales="free")+
        ggtitle('Total Emissions of Motor Vehicle Sources\nBaltimore Vs LA')+
        xlab("Year") + ylab("Emissions")+
        geom_label(aes(fill = Year),colour = "white", fontface = "bold")
dev.off()

        

