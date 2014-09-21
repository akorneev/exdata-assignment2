plot4 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  coalSCC <- SCC[grep("Coal", SCC$EI.Sector, ignore.case=TRUE), ]
  coal <- NEI[NEI$SCC %in% coalSCC$SCC,] 
  summary <- aggregate(coal$Emissions, by=list(year=coal$year), FUN=sum)
  names(summary)[2] = "emissions"
  qplot(year, emissions, data=summary) + geom_smooth()
}