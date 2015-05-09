## plot3.R
##
## Matthew Gast, May 2015
##
## Second plot assignment

plot3 <- function(data,directory) {
  
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
  
  png("plot3.png",
      width=480,
      height=480
  )
  
  # Line chart plot
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
  
  dev.off()
  setwd(cwd)
}