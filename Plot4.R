#load data.table. Ensure household_power_consumption.txt file is in working dir.
hpc <- fread("./household_power_consumption.txt")
#reads in the text file as a data table
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") #converts Date column to a date class
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02"]
#subsets the data to the required days
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")
#makes a new column with date and time combined and as POSIX values
par(mfcol = c(2,2), mai = c(0.5, 0.75, 0.5, 0.5))
#the established the four plots and the order they will be added. The mai gets
#them closer together. Had to work with that to get y axis labels.
with(hpc, plot(DateTime, Global_active_power, 
               ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
lines(hpc$DateTime, hpc$Global_active_power)
#this is plot 1
with(hpc, plot(DateTime, Sub_metering_1, 
               ylab = "Energy sub metering", xlab = "", type = "n"))
#sets up an empty plot
lines(hpc$DateTime, hpc$Sub_metering_1, col = "gray27")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
#plots the lines for each comparison and sets the colors
legend("topright", col = c("gray27", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", lty = 1:1:1, cex = 0.75)
#makes the legend. lty is the key to get the lines. This finishes plot 2
with(hpc, plot(DateTime, Voltage, 
               ylab = "Voltage", xlab = "datetime", type = "n"))
lines(hpc$DateTime, hpc$Voltage)
#This makes plot 3
with(hpc, plot(DateTime, Global_reactive_power, 
              xlab = "datetime", type = "n"))
lines(hpc$DateTime, hpc$Global_reactive_power)
#This sets up the last plot