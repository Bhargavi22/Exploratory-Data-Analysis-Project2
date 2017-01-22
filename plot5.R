library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
# subset to get only motor vehicle sources in Baltimore city

df1 <- subset(NEI,fips =="24510" & type=="ON-ROAD")
#Aggregate based on year
df2<-aggregate(df1[c('Emissions')],by=list(Year=df1$year),FUN=sum)

#plotting the graph
png(filename='plot5.png')

ggplot(data=df2,aes(x=factor(Year), y=Emissions,fill=Year,label=round(Emissions,0)))+
        geom_bar(stat="identity")+
        ggtitle('Total Emissions from motor vehical sources in Baltimore')+
        xlab("Year") + ylab("Emissions")+
        geom_label(aes(fill = Year),colour = "white", fontface = "bold")
dev.off()    
       
   
    



