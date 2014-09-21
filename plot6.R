library(ggplot2)

plot6 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  vehSCC <- SCC[grep("Vehicle", SCC$EI.Sector, ignore.case=TRUE), ]
  vehicles <- NEI[NEI$SCC %in% vehSCC$SCC,]
  baltimoreAndLA <- vehicles[vehicles$fips %in% c("24510", "06037"), ]
  baltimoreAndLA$area[baltimoreAndLA$fips == "24510"] <- "Baltimore City"
  baltimoreAndLA$area[baltimoreAndLA$fips == "06037"] <- "Los Angeles County"
  str(baltimoreAndLA)
  summary <- aggregate(baltimoreAndLA$Emissions, by=list(year=baltimoreAndLA$year, area=baltimoreAndLA$area), FUN=sum)
  names(summary)[3] = "emissions"
  qplot(year, emissions, data=summary, facets=.~area) + geom_smooth()
}