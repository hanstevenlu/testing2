library(leaflet)
library(sp)

#data <- read.csv("/Users/stevenhan/Desktop/RStudio Projects/RShiny1/firstshinyapp/data/NYPD.csv")
#data <- data[complete.cases(data),]

#data$LONGITUDE <- as.numeric(data$LONGITUDE)
#data$LATITUDE <- as.numeric(data$LATITUDE)

#datasmall <- data[sample(nrow(data), 7), ]
#data.SP <- SpatialPointsDataFrame(data[,c(5,6)], data[,-c(5,6)])
#names(data)<- c("Date","Time","Borough","Zipcode","lat","lng")

#m <- leaflet() %>% 
  addProviderTiles('OpenTopoMap') %>% 
  addMarkers(data = datasmall,lat = ~LATITUDE,lng = ~LONGITUDE,popup = ~paste("<h3 style='color: red'>Accident in</he3>",BOROUGH))

#m

