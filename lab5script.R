#alright lets try this again

library(plyr)
library(stringr)
library(pastecs)
library(oce)
library(lubridate)
library(devtools)
#read in files
AK = read.csv(file = "Alaska1.csv")
GOM = read.csv(file = "GOM1.csv")
Peru = read.csv(file = "Peru1.csv")

#Alaska
#did in excel - good to go

#Peru
View(Peru)
#make lon decimal form
Peru$lon = gsub('°', ' ', Peru$lon)
Peru$lon = gsub(' ', '.', Peru$lon)
# now drop letter at end
Peru$lon = gsub('W', '', Peru$lon)
#repeat for lat
Peru$lat = gsub('°', ' ', Peru$lat)
Peru$lat = gsub(' ', '.', Peru$lat)
Peru$lat = gsub('S', '', Peru$lat)
# reformat dates
Peru$date = as.Date(Peru$date, "%m/%d/%Y")
str(Peru$date)

#Gulf of Mexico 
View(GOM)
# lat and lon are good so here is date
#add zeros to month and days with one number
mm = str_sub(GOM$Month, 1, 2)
dd = str_sub(GOM$Day, 1, 2)
yyyy = (GOM$Year)

GOM$date = as.Date(with(GOM, paste(mm, dd, yyyy, sep="/")), "%m/%d/%Y")

#both peru and GOM show up in r tables as year-month-day despite the order in the %m/%d/%Y function...lets see if arc cares


#save over all existing csvs
write.csv(AK, file = "Alaska1.csv")
write.csv(Peru, file = "Peru1.csv")
write.csv(GOM, file = "GOM1.csv")

# now export as tab-delimited text files
write.table(AK, "Alaska1.txt", append = FALSE, sep = " ", dec = ".", row.names = TRUE, col.names = TRUE)
write.table(Peru, "Peru1.txt", append = FALSE, sep = " ", dec = ".", row.names = TRUE, col.names = TRUE)
write.table(GOM, "GOM1.txt", append = FALSE, sep = " ", dec = ".", row.names = TRUE, col.names = TRUE)


