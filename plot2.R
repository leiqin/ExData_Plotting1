
DF <- read.table(unz('household_power_consumption.zip', 'household_power_consumption.txt'),
				 sep = ';', na.string = '?', header = TRUE, stringsAsFactors=FALSE)
DF <- subset(DF, Date %in% c('1/2/2007', '2/2/2007'))
DF <- transform(DF, datetime = as.character(paste(Date, Time)))
DF <- transform(DF, datetime = strptime(datetime, '%d/%m/%Y %H:%M:%S'))

png(filename='plot2.png')
Sys.setlocale('LC_TIME', 'C')
with(DF, plot(datetime, Global_active_power, type='l',
			  main='', xlab='', ylab='Global Active Power (kilowatts)'))
