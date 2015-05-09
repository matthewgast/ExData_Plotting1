## plot4.R
##
## Matthew Gast, May 2015
##
## Course: "Exploratory Data Analysis" at the JHU Bloomberg School of
## Health (Coursera Data Science Specialization).  This function
## produces the first plot in the first course project.

plot4 <- function(data,directory) {
# This function plots four graphs based on supplied time series data
#
# Input:  A time-series data set, structured as a data table, with
#         timestamps and values
# Output: A graphics file in the specified directory with four plots

    # If the caller did not supply data, read the defaults
    if (is.null(data)) {
        raw_data <- readData()
        data <- cookData(raw_data)
    }

    # If no output directory was supplied, write to the directory that
    # will be synced to github
    cwd <- getwd()
    if (missing(directory)) {
        directory <- "/Users/mgast/Dropbox/data-science-specialization/4-exploratory-data-analysis/prog-assignment-1/ExData_Plotting1"
        setwd(directory)
    }
   
  png("plot4.png",
      width=480,
      height=480
  )
  # Specify two-by-two layout
  par(mfrow=c(2,2))
  
  #plot 1 (upper left) - Global active power line chart
  plot(data$DateTime,data$Global_active_power,
       xlab="",
       ylab="Global Active Power",
       type="l")
  
  #plot 2 (upper right) - Voltage line chart
  plot(data$DateTime,
       data$Voltage,
       ylab="Voltage",
       xlab="datetime",
       type="l")
  
  #plot 3 (lower left) - 3 sub-meters on the same chart 
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
  
  #plot 4 (lower right) - Reactive power line chart
  plot(data$DateTime,
       data$Global_reactive_power,
       xlab="datetime",
       type="l")
  
  dev.off()
  setwd(cwd)
}
