## Project 1
## Plot 3
# The file household_power_consumption.txt should be in the working dir.
# The PNG file will also be exported to the working dir.

# Use Sys.setlocale("LC_TIME", "English") if necessary
# for making weekday to appear in English
# http://stackoverflow.com/questions/19613811/how-to-get-the-day-of-week-in-english-not-in-chinese
# Or, make it custom option startup option:
# http://www.statmethods.net/interface/customizing.html

# reading the raw data might take a while
rawepc = read.table("household_power_consumption.txt",header=TRUE,
                    stringsAsFactors=FALSE, sep=";",
                    na.strings="?")
epc = subset(rawepc, Date=="1/2/2007" | Date=="2/2/2007")
epc = transform(epc,DateTime=strptime(paste(Date,Time,sep=" "),
                                      format="%d/%m/%Y %H:%M:%S"))

# A function is defined to reuse the code for plotting
# This make it eaiser to both view and export the plot to PNG
plot3 <- function(){
  with(epc,plot(DateTime,Sub_metering_1,type="l",
                xlab="",ylab="Energy sub metering"))
  with(epc,lines(DateTime,Sub_metering_2,col="red"))
  with(epc,lines(DateTime,Sub_metering_3,col="blue"))
  legend("topright",col=c("black","red","blue"),lty=1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))  
}

plot3()
# 480x480 is the default for png(), but no harm to be explicit
png("plot3.png",width=480,height=480)
plot3()
# dev.copy() resulted in messed legend
dev.off()
