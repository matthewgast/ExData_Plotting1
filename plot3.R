## plot3.R
##
## Matthew Gast, May 2015
##
## Course: "Exploratory Data Analysis" at the JHU Bloomberg School of
## Health (Coursera Data Science Specialization).  This function
## produces the third plot in the first course project.

plot3 <- function(data,directory) {
# This function plots a line chart with three time series
#
# Input:  A time-series data set, structured as a data table, with
#         timestamps and values for each of the desired lines
# Output: A graphics file in the specified directory with a line graph of
#         the data in the three time series

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

  # Open plot with specified dimensions and draw the plot in stages.
  # Each line must be added individually, and the legend is then
  # added at the end.  Finally, close the graphics output and
  # restore the working directory.
  png("plot3.png",
      width=480,
      height=480
  )
  
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
