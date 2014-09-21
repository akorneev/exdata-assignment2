plot5 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  SCC <- readRDS("data/Source_Classification_Code.rds")
  vehSCC <- SCC[grep("Vehicle", SCC$EI.Sector, ignore.case=TRUE), ]
  vehiclesInBaltimore <- NEI[NEI$SCC %in% vehSCC$SCC & NEI$fips == "24510",] 
  summary <- aggregate(vehiclesInBaltimore$Emissions, by=list(year=vehiclesInBaltimore$year), FUN=sum)
  names(summary)[2] = "emissions"
  qplot(year, emissions, data=summary) + geom_smooth()
}