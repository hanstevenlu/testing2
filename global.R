library(dplyr)

#removing the entries without all the information filled in completely
#the file is 4MB, super quick
#the other one was 255MB

############### Code ##############
#vc <- read.csv("data/NYPD_Motor_Vehicle_Collisions.csv") # 10,186 observations
#vc <- subset(vc,!(is.na(vc['ZIP.CODE']))) # 20,687 observations
#set.seed(100)
#vc <- vc[sample.int(nrow(vc), 10000),]
#write.csv(vc, file = 'data/NYPD_Motor_Vehicle_Collisions (10000 obs).csv')
###################################

#vc short for vehicle collision

vc <- read.csv('data/NYPDmini.csv')

#count number of accidents at the same location(lat and lng)
cleantable <- vc %>%
  group_by(LONGITUDE,LATITUDE) %>%
  mutate(count =n(),totalinjury = sum(NUMBER.OF.PERSONS.INJURED),
         totaldeath = sum(NUMBER.OF.PERSONS.KILLED))
cleantable <- cleantable[!duplicated(cleantable$LOCATION),]

cleantable <- cleantable %>%
  select(
    Borough = BOROUGH,
    Zipcode = ZIP.CODE,
    Street1 = ON.STREET.NAME,
    Street2 = CROSS.STREET.NAME,
    Accidents = count,
    Injuries = totalinjury,
    Deaths = totaldeath,
    Lat = LATITUDE,
    Long = LONGITUDE)
  
