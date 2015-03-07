## Project 1
## Plot 1

# The file household_power_consumption.txt should be in the working dir,
# and it can be downloaded at:
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# The PNG file will also be exported to the working dir.

# reading the raw data might take a while
rawepc = read.table("household_power_consumption.txt",header=TRUE,
                    stringsAsFactors=FALSE, sep=";",
                    na.strings="?")
epc = subset(rawepc, Date=="1/2/2007" | Date=="2/2/2007")

# A function is defined to reuse the code for plotting
# This make it eaiser to both view and export the plot to PNG
plot1 <- function(){
  hist(epc$Global_active_power,col="red",
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power")
}

plot1()
# 480x480 is the default for png(), but no harm to be explicit
png("plot1.png",width=480,height=480,bg = "transparent")
plot1()
dev.off()