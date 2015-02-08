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

  png("plot3.png", width=480, height=480)
  par(mar=c(4.7, 4.7, 0.7, 0.7))

  plot(datasubset$Date, datasubset$Sub_metering_1, type="n", lwd=1, 
      ylim=c(0, max(c(datasubset$Sub_metering_1, datasubset$Sub_metering_2,
                      datasubset$Sub_metering_3))),
      xlab="", ylab="Energy sub metering")

  lines(datasubset$Date, datasubset$Sub_metering_1, col="black")
  lines(datasubset$Date, datasubset$Sub_metering_2, col="red")
  lines(datasubset$Date, datasubset$Sub_metering_3, col="blue")

  legend("topright", lwd=1, col=c("black", "red", "blue"), 
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

## Close Output file: 

  dev.off() 