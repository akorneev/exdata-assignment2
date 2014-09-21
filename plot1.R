plot1 <- function() {
  NEI <- readRDS("data/summarySCC_PM25.rds")
  summary <- aggregate(NEI$Emissions, by=list(year=NEI$year), FUN=sum)
  names(summary)[2] = "Emissions"
  plot(summary)
}