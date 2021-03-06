# Course 4 - Assignment 2 - Question 2.
#
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make
# a plot answering this question.
#
# Set to your data source directory

workingdirectory <- "C:/Data/"

setwd( workingdirectory )

## Load datasets as needed
## This data set will likely take a few seconds. Be patient!

loaded <- (exists("NEI") && is.data.frame(get("NEI")))

if (!loaded) {
  print ("Loading NEI dataset .. Please stand by")
  NEI <- readRDS("summarySCC_PM25.rds")
}

loaded <- (exists("SCC") && is.data.frame(get("SCC")))

if (!loaded) {
  print ("Loading SCC dataset .. Please stand by")
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Summarize Data

print ("Subsetting & Aggregating Data Totals .. Please stand by")

NET.subset <- NEI[which(NEI$fips == "24510") , ]

baltimore <- with(NET.subset, aggregate(Emissions, 
               by = list(year), sum) )

colnames(baltimore) <- c("Year", "Emissions")

# Generate Plot

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(baltimore$Year, baltimore$Emissions, type = "b", col = "red",
     xlab = "Year", ylab = "Emissions", main = "Baltimore Emissions")

dev.off()