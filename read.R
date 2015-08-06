## Function for download and read data
read <- function () { 
    dir <- "data/"
    cache <- "cache.rds"
    name <- "household_power_consumption"

    if (!dir.exists(dir)) {
        dir.create(dir)
    }
    
    if (!file.exists(paste0(dir, cache))) {
        zip <- paste0(dir, name, ".zip")
        file <- paste0(dir, name, ".txt")
        
        # Download and unzip data
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                      destfile=zip, method="curl")
        unzip(zip, exdir = dir)
        file.remove(zip)
        
        library(data.table)
        
        # Read data into data.table
        df <- fread(file, sep = ";", header = TRUE, na.strings = "?",
                    colClasses = c("character", "character", "numeric", "numeric", "numeric",
                                   "numeric", "numeric", "numeric", "numeric"))
        
        # Extract data for analysis
        df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007", ]
        df$datetime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))
        
        df$Date = NULL
        df$Time = NULL
        
        # Convert 'character' to 'numeric' because of some bug in fread (it ignores na.strings param)
        for (i in 1:(ncol(df) - 1)) {
            df[[i]] <- as.numeric(df[[i]])
        }
        
        # Make cache to fast reading in further usage
        saveRDS(df, paste0(dir, cache))
        file.remove(file)
    } else {
        # Retrieve data from cache
        df <- readRDS(paste0(dir, cache))
    }
    
    df
}