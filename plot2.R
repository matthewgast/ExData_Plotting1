## plot2.R
##
## Matthew Gast, May 2015
##
## Course: "Exploratory Data Analysis" at the JHU Bloomberg School of
## Health (Coursera Data Science Specialization).  This function
## produces the second plot in the first course project.

plot2 <- function(data,directory) {
# This function plots a time series of global active power
#
# Input:  A time-series data set, structured as a data table, with
#         timestamps and values
# Output: A graphics file in the specified directory with a line graph of
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

    # Open plot with specified dimensions and plot the "l"ine type.  Then
    # close the graphics output and restore the working directory.
    png("plot2.png",
        width=480,
        height=480
        )

    plot(data$DateTime,data$Global_active_power,
         xlab="",
         ylab="Global Active Power (kilowatts)",
         type="l"
         )
    
    dev.off()
    setwd(cwd)
}
