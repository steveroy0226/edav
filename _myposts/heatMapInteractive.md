---
title: "heatMapInteractive"
author: "Steve"
date: "02/18/2015"
output: html_document
---

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
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
```

```
## [[40.4989488,-74.2443651,2],[40.499842,-74.2399169,2]]
```

```r
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

#L$save('/home/steveroy/Desktop/NYPD_Motor_Data/heatMap.html', cdn = TRUE)
L$set(width = 1450, height = 800)
L
```

```
## <iframe src=' figure/unnamed-chunk-1-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- chartc8867fbeeee ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>
```
