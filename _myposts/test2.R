# Clear workspace
rm(list=ls())

# Set path and load data
setwd('~/Desktop/NYPD_Motor_Data')
myData <- read.csv("NYPD_Motor_Vehicle_Collisions.csv", 
                   header=TRUE)

# Load interactive base map layer 
library(rMaps)
L <- Leaflet$new()
L$setView(c(40.784148400000, -73.96614069999998), 10)
L$tileLayer(provider = 'Stamen.TonerLite')

# Convert data to JSON array
library(dplyr)
library(rCharts)
mv_dat <- myData %>%
          group_by(LATITUDE, LONGITUDE) %>%
          summarise(count = n())
mv_dat = toJSONArray2(na.omit(mv_dat), json = F, names = F)
cat(rjson::toJSON(mv_dat[1:2]))

# Add leaflet-heat plugin. Thanks to Vladimir Agafonkin
L$addAssets(jshead = c(
  "http://leaflet.github.io/Leaflet.heat/dist/leaflet-heat.js"
))

# Add javascript to modify underlying chart
L$setTemplate(afterScript = sprintf("
<script>
  var addressPoints = %s
  var heat = L.heatLayer(addressPoints, {
      radius : 5, 
      maxOpacity: .6,
      scaleRadius: false,
      useLocalExtrema: false,
      blur : .25, //gradient : {1: 'blue'}
      }).addTo(map)           
</script>
", rjson::toJSON(mv_dat)
))

L$show()
#L$save('/home/steveroy/Desktop/NYPD_Motor_Data/heatMap.html', cdn = TRUE)
