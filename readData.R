## readData.R
##
## Matthew Gast, May 2015
##
## These functions read the data used in the first programming project
## in the JHU Bloomberg School of Health's Data Science Specialization
## on Coursera

readData <- function (directory, datafile) {
    # This function reads data from a specified location
    #
    # Input:  A directory and file to read data from
    # Output: A data frame containing the contents of the file

    # Save current working directory to return to
    cwd <- getwd()

    # If the directory and filename are not supplied, use some defaults
    if (missing(directory)) {
        directory <- "/Users/mgast/Dropbox/data-science-specialization/4-exploratory-data-analysis/prog-assignment-1"
    }
    setwd(directory)
    if (missing(datafile)) {
        datafile <- "household_power_consumption.txt"
    }
  
    # Read the file
    #
    # Format: the file has a header line.  Data files are separated
    # by semicolons.  When values are not available, the "?" is used.
    # The first two fields are a date and time, so read them as
    # character fields.  The remaining fields are numeric.

    df <- read.table(datafile,header=TRUE,sep=";",na.strings="?",
                     colClasses=c(rep("character",2),rep("numeric",7))
                     )
  
    # Restore working directory and return the data frame
    setwd(cwd)
    df
}

cookData <- function (df, startDate, endDate) {
    # This function processes the raw data from the file into a usable
    # form for plotting.
    #
    # Input:  A data frame containing the raw data, and optionally,
    #         a set of dates to extract the data for.
    # Output: A data table (note the change in type!), sliced to a
    #         specified subset of dates.
  
    library(lubridate)
    library(dplyr)
    library(data.table)
  
    # If no dates are supplied, use the defaults from the assignment
    #
    # The time zone is specified as UTC in these dates because that is the
    # default time zone for reading data in the previous function.
    if (missing(startDate)) {
        startDate <- as.POSIXct("2007-02-01 00:00:00",tz="UTC")
    }
    if (missing(endDate)) {
        endDate <- as.POSIXct("2007-02-02 23:59:59",tz="UTC")
    }
  
    # Clean data: combine text date and time into a date/time object,
    # then drop the raw text fields
    dt <- data.table(df)
    dt <- mutate(dt,DateTime=dmy_hms(paste(Date,Time)))
    dt[,Date:=NULL]
    dt[,Time:=NULL]

    # Extracting the time slice is a matter of comparing each row to the
    # specified start and end times
    dt <- dt[dt[,(dt$DateTime >= startDate & dt$DateTime <= endDate)],]
    return(dt)
}
