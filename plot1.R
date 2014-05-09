setwd("C:\\Users\\dgraziotin\\Documents\\GitHub\\ExData_Plotting1")

if(!file.exists("data")){
  dir.create("data")
}

zip_file <- "data/household_power_consumption.zip"


if(!file.exists(zip_file)){
  zip_file_src <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"  
  download.file(url=zip_file_src,destfile=zip_file) 
}

df <- read.csv2( unz(zip_file, filename="household_power_consumption.txt"), header = TRUE, na.strings = c("?"), dec="."  )

df <- subset(df, df$Date=="1/2/2007" | df$Date=="2/2/2007")

png(filename="plot1.png",width = 480, height = 480)
with(df,hist(Global_active_power,  col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
