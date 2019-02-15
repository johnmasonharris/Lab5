#alright lets try this again

library(plyr)
library(stringr)
library(pastecs)
library(oce)
library(lubridate)
install.packages("devtools")

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

#Gulf of Mexico
