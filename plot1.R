## plot1.R
##
## Matthew Gast, May 2015
##
## Course: "Exploratory Data Analysis" at the JHU Bloomberg School of
## Health (Coursera Data Science Specialization).  This function
## produces the first plot in the first course project.

plot1 <- function(data,directory) {
# This function plots a histogram of global active power
#
# Input:  A time-series data set, structured as a data table, with
#         timestamps and values
# Output: A graphics file in the specified directory with a histogram of
#         the time series data
    
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

    # Open plot with specified dimensions and plot histogram.  Then
    # close the graphics output and restore the working directory.
    png("plot1.png",
        width=480,
        height=480
        )

    hist(data$Global_active_power,
         main="Global Active Power",
         xlab="Global Active Power (kilowatts)",
         ylab="Frequency",
         col="red"
         )

    dev.off()
    setwd(cwd)
}
