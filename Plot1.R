#load data.table. Ensure household_power_consumption.txt file is in working dir.
hpc <- fread("./household_power_consumption.txt")
#reads in the text file as a data table
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y") #converts Date column to a date class
hpc <- hpc[hpc$Date >= "2007-02-01" & hpc$Date <= "2007-02-02"]
#subsets the data to the required days
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
#converts from character to numeric so the histogram is possible
hist(hpc$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)") #makes the histogram
