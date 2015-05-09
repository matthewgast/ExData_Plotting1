## plot2.R
##
## Matthew Gast, May 2015
##
## Second plot assignment

plot2 <- function(data,directory) {
  
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
  
  png("plot2.png",
      width=480,
      height=480
  )
  
  # Line chart plot
  plot(data$DateTime,data$Global_active_power,
       xlab="",
       ylab="Global Active Power (kilowatts)",
       type="l")
  
  dev.off()
  setwd(cwd)
}