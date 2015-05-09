## plot1.R
##
## Matthew Gast, May 2015
##
## First plot assignment

plot1 <- function(data,directory) {

# Get the data we want to plot
if (is.null(data)) {
  raw_data <- readData()
  data <- cookData(raw_data)
}

cwd <- getwd()
if (missing(directory)) {
  directory <- "/Users/mgast/Dropbox/data-science-specialization/4-exploratory-data-analysis/prog-assignment-1/ExData_Plotting1"
setwd(directory)
}

png("plot1.png",
    width=480,
    height=480
    )

hist(data$Global_active_power,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")

dev.off()
setwd(cwd)
}