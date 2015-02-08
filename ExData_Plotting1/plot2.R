## Load the dataset and convert date: 
  library(dplyr)
  setwd ("C:/data/")

## Load the dataset and convert date: 

  loaded <- (exists("powerdata") && is.data.frame(get("powerdata")))

  if (!loaded) {
    print ("Data Loading .. Please stand by")
  
    powerdata <- read.table("household_power_consumption.txt", sep=";", header=T, 
                            colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")

    powerdata$Date <- as.Date(powerdata$Date, format="%d/%m/%Y") 
  }  

## Create Subset of the data.frame for date range: 

  datasubset <- filter(powerdata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Change Data & Time to POSIX format:
  datasubset$Date <- as.POSIXlt(paste(as.Date(datasubset$Date, format="%d/%m/%Y"), 
                                      datasubset$Time, sep=" "))

## Open Output file and plot the histogram: 

  png("plot2.png", width=480, height=480) 
  par(mar=c(4.7, 4.7, 0.7, 0.7))
  plot(datasubset$Date, datasubset$Global_active_power, type="l", 
      xlab="", ylab="Global Active Power (kilowatts)")

## Close Output file: 

  dev.off() 