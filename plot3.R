library(ggplot2)

plot3 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  baltimore <- NEI[NEI$fips == "24510", ]
  summary <- aggregate(baltimore$Emissions, by=list(year=baltimore$year, type=baltimore$type), FUN=sum)
  names(summary)[3] = "Emissions"
  str(summary)
  qplot(year, Emissions, data = summary, facets=.~type) + geom_smooth()
}