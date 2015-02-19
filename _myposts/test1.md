---
title: "maps"
author: "Steve"
date: "02/19/2015"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
map3 <- Leaflet$new()
map3$setView(c(51.505, -0.09), zoom = 13)
map3$marker(c(51.5, -0.09), bindPopup = "<p> Hi. I am a popup </p>")
map3$marker(c(51.495, -0.083), bindPopup = "<p> Hi. I am another popup </p>")
map3$print('chart7')
```


<div id = 'chart7' class = 'rChart leaflet'></div>
<script>
  var spec = {
 "dom": "chart7",
"width":            600,
"height":            400,
"urlTemplate": "http://{s}.tile.osm.org/{z}/{x}/{y}.png",
"layerOpts": {
 "attribution": "Map data<a href=\"http://openstreetmap.org\">OpenStreetMap</a>\n         contributors, Imagery<a href=\"http://mapbox.com\">MapBox</a>" 
},
"center": [         51.505,          -0.09 ],
"zoom":             13,
"id": "chart7" 
}

  var map = L.map(spec.dom, spec.mapOpts)
  
    map.setView(spec.center, spec.zoom);

    if (spec.provider){
      L.tileLayer.provider(spec.provider).addTo(map)    
    } else {
		  L.tileLayer(spec.urlTemplate, spec.layerOpts).addTo(map)
    }
     
    L
  .marker([
   51.5,
 -0.09 
])
  .addTo( map )
  .bindPopup("<p> Hi. I am a popup </p>")
L
  .marker([
 51.495,
-0.083 
])
  .addTo( map )
  .bindPopup("<p> Hi. I am another popup </p>")
    
    
    
    
    if (spec.circle2){
      for (var c in spec.circle2){
        var circle = L.circle(c.center, c.radius, c.opts)
         .addTo(map);
      }
    }
    
    
    
    
    
   
   
   
</script>
