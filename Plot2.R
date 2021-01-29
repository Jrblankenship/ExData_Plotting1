#load data.table. Ensure household_power_consumption.txt file is in working dir.
hpc <- fread("./household_power_consumption.txt")
#reads in the text file as a data table
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") #converts Date column to a date class
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02"]
#subsets the data to the required days
hpc$DateTime <- as.POSIXct(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")
#makes a new column with date and time combined and as POSIX values
with(hpc, plot(DateTime, Global_active_power, 
               ylab = "Global Active Power (kilowatts)", xlab = "", type = "n"))
lines(hpc$DateTime, hpc$Global_active_power)