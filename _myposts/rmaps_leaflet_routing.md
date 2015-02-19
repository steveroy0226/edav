
## Leaflet Routing Machine Plugin

I saw the [following issue](https://github.com/ramnathv/rMaps/issues/45) posted
to the [rMaps](http://github.com/ramnathv/rMaps) github repo today.

> I am new to using rMaps and leaflet. I would like to plot the route between
two locations. The leaflet routing machine plugin allows us to do this
(https://github.com/perliedman/leaflet-routing-machine). I am not quite sure how
to use the functions `addAssets()` and `setTemplate()` to be able to use this
plugin.

This was a good exercise for me to test whether these newly introduced
mechanisms `addAssets` and `setTemplate` would allow one to easily extend the
base leaflet binding in [rMaps](http://rmaps.github.io).

Let us start by creating the base map.


    


    library(rMaps)
    map = Leaflet$new()
    map$setView(c(40.73846, -73.99413), 16)
    map$tileLayer(provider = 'Stamen.TonerLite')

In order to display the map in the notebook, we need a small wrapper function.


    display_chart = function(viz){
      y = paste(capture.output(viz$show('iframesrc', cdn = TRUE)), collapse = "\n")
      IRdisplay::display_html(y)
    }

We are now ready to display the map in the notebook.


    display_chart(map)


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
    
    &lt;div id = &#039;chart2f036a5f683c&#039; class = &#039;rChart leaflet&#039;&gt;&lt;/div&gt;    
    &lt;script&gt;
  var spec = {
 &quot;dom&quot;: &quot;chart2f036a5f683c&quot;,
&quot;width&quot;:            800,
&quot;height&quot;:            400,
&quot;urlTemplate&quot;: &quot;http://{s}.tile.osm.org/{z}/{x}/{y}.png&quot;,
&quot;layerOpts&quot;: {
 &quot;attribution&quot;: &quot;Map data&lt;a href=\&quot;http://openstreetmap.org\&quot;&gt;OpenStreetMap&lt;/a&gt;\n         contributors, Imagery&lt;a href=\&quot;http://mapbox.com\&quot;&gt;MapBox&lt;/a&gt;&quot; 
},
&quot;center&quot;: [       40.73846,      -73.99413 ],
&quot;zoom&quot;:             16,
&quot;provider&quot;: &quot;Stamen.TonerLite&quot;,
&quot;id&quot;: &quot;chart2f036a5f683c&quot; 
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
&lt;/html&gt; ' scrolling='no' frameBorder='0' seamless class='rChart  leaflet  ' id='iframe-chart2f036a5f683c'> </iframe>
 <style>iframe.rChart{ width: 100%; height: 400px;}</style>


We now want to add a route between the following waypoints. I have chosen the
data structure to be an unnamed list of vectors, since it converts easily to the
JSON structure expected by by routing plugin.


    mywaypoints = list(c(40.74119, -73.9925), c(40.73573, -73.99302))

In order to use the routing plugin, we first need to add the required js/css
assets. I introduced the `addAssets` method in the `dev` version of `rCharts`
precisely to serve this need (NOTE: It is currently a little buggy in terms of
order in which the assets are specified, but I will take care of that this
week).


    map$addAssets(
      css = "http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.css",
      jshead = "http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.min.js"
    )
    
    routingTemplate = "
     <script>
     var mywaypoints = %s
     L.Routing.control({
      waypoints: [
        L.latLng.apply(null, mywaypoints[0]),
        L.latLng.apply(null, mywaypoints[1])
      ]
     }).addTo(map);
     </script>"
    
    map$setTemplate(
      afterScript = sprintf(routingTemplate, RJSONIO::toJSON(mywaypoints))
    )
    display_chart(map)


<iframe srcdoc=' &lt;!doctype HTML&gt;
&lt;meta charset = &#039;utf-8&#039;&gt;
&lt;html&gt;
  &lt;head&gt;
    &lt;link rel=&#039;stylesheet&#039; href=&#039;http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.css&#039;&gt;
    &lt;link rel=&#039;stylesheet&#039; href=&#039;http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.css&#039;&gt;
    
    &lt;script src=&#039;http://cdn.leafletjs.com/leaflet-0.5.1/leaflet.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;https://rawgithub.com/leaflet-extras/leaflet-providers/gh-pages/leaflet-providers.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://harrywood.co.uk/maps/examples/leaflet/leaflet-plugins/layer/vector/KML.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    &lt;script src=&#039;http://www.liedman.net/leaflet-routing-machine/dist/leaflet-routing-machine.min.js&#039; type=&#039;text/javascript&#039;&gt;&lt;/script&gt;
    
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
    
    &lt;div id = &#039;chart2f036a5f683c&#039; class = &#039;rChart leaflet&#039;&gt;&lt;/div&gt;    
    &lt;script&gt;
  var spec = {
 &quot;dom&quot;: &quot;chart2f036a5f683c&quot;,
&quot;width&quot;:            800,
&quot;height&quot;:            400,
&quot;urlTemplate&quot;: &quot;http://{s}.tile.osm.org/{z}/{x}/{y}.png&quot;,
&quot;layerOpts&quot;: {
 &quot;attribution&quot;: &quot;Map data&lt;a href=\&quot;http://openstreetmap.org\&quot;&gt;OpenStreetMap&lt;/a&gt;\n         contributors, Imagery&lt;a href=\&quot;http://mapbox.com\&quot;&gt;MapBox&lt;/a&gt;&quot; 
},
&quot;center&quot;: [       40.73846,      -73.99413 ],
&quot;zoom&quot;:             16,
&quot;provider&quot;: &quot;Stamen.TonerLite&quot;,
&quot;id&quot;: &quot;chart2f036a5f683c&quot; 
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
    
    
     &lt;script&gt;
     var mywaypoints = [
     [ 40.741, -73.993 ],
    [ 40.736, -73.993 ] 
    ]
     L.Routing.control({
      waypoints: [
        L.latLng.apply(null, mywaypoints[0]),
        L.latLng.apply(null, mywaypoints[1])
      ]
     }).addTo(map);
     &lt;/script&gt;    
  &lt;/body&gt;
&lt;/html&gt; ' scrolling='no' frameBorder='0' seamless class='rChart  leaflet  ' id='iframe-chart2f036a5f683c'> </iframe>
 <style>iframe.rChart{ width: 100%; height: 400px;}</style>

