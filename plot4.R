## This program reads in data from the energy consumption dataset and plots it

## Read in data (limit only to 2007-02-01 and 2007-02-02)
ener_data <- read.table("Week 1/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        col.names = c('Date','Time','Global_active_power','Global_reactive_power','Voltage','Global_intensity','Sub_metering_1','Sub_metering_2','Sub_metering_3'),
                        na.strings = "?",
                        skip = 66636, nrows = 2880
                        )

## Format data for appropriate plotting
ener_data$dt_tm <- strptime(paste(ener_data$Date, ener_data$Time),
                            format = "%d/%m/%Y %H:%M:%S")

## Plot the data - Matrix of plots with appropriate labelling

# Define functions for each individual plot and then finally plot
# (1,1) - Global Active Power
plot_1_1 <- function()
{
    # Generate plot with no data but correct axis labeling
    plot(ener_data$dt_tm, ener_data$Global_active_power,
         type = "n",
         xlab = "",
         ylab = "Global Active Power"
    )
    # Use lines command to actually plot
    lines(ener_data$dt_tm, ener_data$Global_active_power, type = "l")
}

# (2,1) - Energy sub-metering
plot_2_1 <- function()
{
    # Generate plot with no data but correct axis labeling
    plot(ener_data$dt_tm, ener_data$Sub_metering_1,
         type = "n",
         xlab = "",
         ylab = "Energy sub metering"
        )
    # Use lines command to actually plot
    lines(ener_data$dt_tm, ener_data$Sub_metering_1, type = "l")
    lines(ener_data$dt_tm, ener_data$Sub_metering_2, type = "l", col = "red")
    lines(ener_data$dt_tm, ener_data$Sub_metering_3, type = "l", col = "blue")
    # Add a legend
    legend("topright",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col = c("black", "red", "blue"), lty = 1,
           bty = "n",
           cex = 0.9
        )
    
    # This works, but is not entirely clean... if the plot command had used
    # Sub_metering_2 as the y-variable instead, the other plots would be well
    # out of range - thoughts on how to address that problem?
}

# (1,2) - Voltage
plot_1_2 <- function()
{
    # Generate plot with no data but correct axis labeling
    plot(ener_data$dt_tm, ener_data$Voltage,
         type = "n",
         xlab = "datetime",
         ylab = "Voltage"
        )
    # Use lines command to actually plot
    lines(ener_data$dt_tm, ener_data$Voltage, type = "l")
}

# (2,2) - Global Reactive Power
plot_2_2 <- function()
{
    # Generate plot with no data but correct axis labeling
    plot(ener_data$dt_tm, ener_data$Global_reactive_power,
         type = "n",
         xlab = "datetime",
         ylab = "Global_reactive_power"
        )
    # Use lines command to actually plot
    lines(ener_data$dt_tm, ener_data$Global_reactive_power, type = "l")
}

# Create .png of size 480 x 480 and plot the matrix of four plots therein
png(file = "Week 1/plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
with(ener_data,
     {
         plot_1_1()
         plot_2_1()
         plot_1_2()
         plot_2_2()
     }
    )
dev.off()