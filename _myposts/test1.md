---
title: "maps"
author: "Steve"
date: "02/19/2015"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:


```r
map = Leaflet$new()
map$setView(c(40.73846, -73.99413), 16)
map$tileLayer(provider = 'Stamen.TonerLite')
```
Hello

<iframe srcdoc=' &lt;!doctype HTML&gt;
&lt;meta charset = &#039;utf-8&#039;&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;link rel=&#039;stylesheet&#039; href=&#039;http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.css&#039;&gt;
    
    &lt;script src=&#039;http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;https://rawgithub.com/leaflet-extras/leaflet-providers/gh-pages/leaflet-providers.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://harrywood.co.uk/maps/examples/leaflet/leaflet-plugins/layer/vector/KML.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    
    &lt;style&gt;
    .rChart {
      display: block;
      margin-left: auto; 
      margin-right: auto;
      width: 800px;
      height: 400px;
    }  
    &lt;/style&gt;
    
  &lt;/head&gt;
  &lt;body &gt;
    
    &lt;div id = &#039;chartc887b95fcac&#039; class = &#039;rChart leaflet&#039;&gt;&lt;/div&gt;    
    &lt;script&gt;
  var spec = {
 &quot;dom&quot;: &quot;chartc887b95fcac&quot;,
&quot;width&quot;:            800,
&quot;height&quot;:            400,
&quot;urlTemplate&quot;: &quot;http://{s}.tile.osm.org/{z}/{x}/{y}.png&quot;,
&quot;layerOpts&quot;: {
 &quot;attribution&quot;: &quot;Map data&lt;a href=\&quot;http://openstreetmap.org\&quot;&gt;OpenStreetMap&lt;/a&gt;\n         contributors, Imagery&lt;a href=\&quot;http://mapbox.com\&quot;&gt;MapBox&lt;/a&gt;&quot; 
},
&quot;center&quot;: [       40.73846,      -73.99413 ],
&quot;zoom&quot;:             16,
&quot;provider&quot;: &quot;Stamen.TonerLite&quot;,
&quot;id&quot;: &quot;chartc887b95fcac&quot; 
}

  var map = L.map(spec.dom, spec.mapOpts)
  
    map.setView(spec.center, spec.zoom);

    if (spec.provider){
      L.tileLayer.provider(spec.provider).addTo(map)    
    } else {
		  L.tileLayer(spec.urlTemplate, spec.layerOpts).addTo(map)
    }
     
    
    
    
    
    
    if (spec.circle2){
      for (var c in spec.circle2){
        var circle = L.circle(c.center, c.radius, c.opts)
         .addTo(map);
      }
    }
    
    
    
    
    
   
   
   
&lt;/script&gt;
    
    &lt;script&gt;&lt;/script&gt;    
  &lt;/body&gt;
&lt;/html&gt; ' scrolling='no' frameBorder='0' seamless class='rChart  leaflet  ' id='iframe-chartc887b95fcac'> </iframe>
 <style>iframe.rChart{ width: 100%; height: 400px;}</style>
