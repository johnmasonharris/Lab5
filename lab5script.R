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
