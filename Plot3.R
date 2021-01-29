#load data.table. Ensure household_power_consumption.txt file is in working dir.
hpc <- fread("./household_power_consumption.txt")
#reads in the text file as a data table
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") #converts Date column to a date class
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02"]
#subsets the data to the required days
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")
#makes a new column with date and time combined and as POSIX values
with(hpc, plot(DateTime, Sub_metering_1, 
               ylab = "Energy sub metering", xlab = "", type = "n"))
#sets up an empty plot
lines(hpc$DateTime, hpc$Sub_metering_1, col = "gray27")
lines(hpc$DateTime, hpc$Sub_metering_2, col = "red")
lines(hpc$DateTime, hpc$Sub_metering_3, col = "blue")
#plots the lines for each comparison and sets the colors
legend("topright", col = c("gray27", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1:1:1)
#makes the legend. lty is the key to get the lines.