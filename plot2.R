plot2 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  baltimore <- NEI[NEI$fips == "24510", ]
  summary <- aggregate(baltimore$Emissions, by=list(year=baltimore$year), FUN=sum)
  names(summary)[2] = "Emissions"
  plot(summary)
}