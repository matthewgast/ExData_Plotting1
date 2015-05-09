## plot4.R
##
## Matthew Gast, May 2015
##
## Second plot assignment

plot4 <- function(data,directory) {
  
  # Get the data we want to plot
  if (is.null(data)) {
    raw_data <- readData()
    data <- cookData(raw_data)
  }
  
  cwd <- getwd()
  if (missing(directory)) {
    directory <- "/Users/mgast/Dropbox/data-science-specialization/4-exploratory-data-analysis/prog-assignment-1/ExData_Plotting1"
  }
  setwd(directory)
  
  png("plot4.png",
      width=480,
      height=480
  )
  
  par(mfrow=c(2,2))
  
  #plot 1 (upper left)
  plot(data$DateTime,data$Global_active_power,
       xlab="",
       ylab="Global Active Power",
       type="l")
  
  #plot 2 (upper right)
  plot(data$DateTime,
       data$Voltage,
       ylab="Voltage",
       xlab="datetime",
       type="l")
  
  #plot 3 (lower left)
  plot(data$DateTime,
       data$Sub_metering_1,
       ylab="Energy sub metering",
       xlab="",
       type="l")
  lines(data$DateTime,data$Sub_metering_2,type="l",col="red")
  lines(data$DateTime,data$Sub_metering_3,type="l",col="blue")
  legend("topright",
         c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         col=c("black","red","blue"),lty=1)
  
  #plot 4 (lower right)
  plot(data$DateTime,
       data$Global_reactive_power,
       xlab="datetime",
       type="l")
  
  dev.off()
  setwd(cwd)
}