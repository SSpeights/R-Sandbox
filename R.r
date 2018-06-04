origData <- read.csv2('FlightData.csv', header = TRUE,  sep = ',',  stringsAsFactors = FALSE)
nrow(origData)
airports <- c('ATL','LAX','ORD','DFW','JFK','SFO','CLT','LAS','PHX')
origData <- subset(origData, DEST %in% airports & ORIGIN %in% airports)
head(origData,2)
tail(origData,2)
origData$X <- NULL
cor(origData[c("ORIGIN_AIRPORT_SEQ_ID", "ORIGIN_AIRPORT_ID")])
cor(origData[c("DEST_AIRPORT_SEQ_ID", "DEST_AIRPORT_ID")])
origData$ORIGIN_AIRPORT_SEQ_ID <- NULL
origData$DEST_AIRPORT_SEQ_ID <- NULL
mismatched <- origData[origData$CARRIER != origData$UNIQUE_CARRIER,]
nrow(mismatched)
origData$UNIQUE_CARRIER <- NULL
onTimeData <- origData[!is.na(origData$ARR_DEL15) & origData$ARR_DEL15!="" & !is.na(origData$DEP_DEL15) & origData$DEP_DEL15!="",]
nrow(onTimeData)
onTimeData$DISTANCE <- as.integer(onTimeData$DISTANCE)
head(onTimeData,2)
onTimeData$CANCELLED <- as.integer(onTimeData$CANCELLED)
onTimeData$DIVERTED <- as.integer(onTimeData$DIVERTED)
onTimeData$DEP_DEL15 <- as.factor(onTimeData$DEP_DEL15)
onTimeData$ARR_DEL15 <- as.factor(onTimeData$ARR_DEL15)
onTimeData$DEST_AIRPORT_ID <- as.factor(onTimeData$DEST_AIRPORT_ID)
onTimeData$ORIGIN_AIRPORT_ID <- as.factor(onTimeData$ORIGIN_AIRPORT_ID)
onTimeData$DEST <- as.factor(onTimeData$DEST)
onTimeData$ORIGIN <- as.factor(onTimeData$ORIGIN)
onTimeData$DAY_OF_WEEK <- as.factor(onTimeData$DAY_OF_WEEK)
onTimeData$DEP_TIME_BLK <- as.factor(onTimeData$DEP_TIME_BLK)
onTimeData$CARRIER <- as.factor(onTimeData$CARRIER)
onTimeData$DEP_TIME_BLK <- as.character(onTimeData$DEP_TIME_BLK)
tapply(onTimeData$ARR_DEL15, onTimeData$ARR_DEL15, length)
(6460 / (25664 + 6460))
6460 / 25664 




