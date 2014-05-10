## This program reads in data from the energy consumption dataset and plots it

## Read in data (limit only to 2007-02-01 and 2007-02-02)
ener_data <- read.table("Week 1/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'),
                        na.strings = "?",
                        skip = 66636, nrows = 2880
                        )

## Plot the data

# Draw histogram with appropriate labelling
plot1 <- function()
{
    hist(ener_data$Global_active_power,
            main = "Global Active Power",
            xlab = "Global Active Power (kilowatts)",
            col = "red")
}

# Create .png of size 480 x 480 and plot there
png(file = "Week 1/plot1.png", width = 480, height = 480)
plot1()
dev.off()