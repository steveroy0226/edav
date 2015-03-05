---
title: "Making Maps with Leaflet for R"
author: "Mike Bisaha"
date: "March 05, 2015"
output: html_document
layout: post
description: presentation
tags: assignments, Mike Bisaha, leaflet, leafletJS, leaflet for R, presentation, EPA, shapefile, borders
---

File with complete R code can be found here:

# Building maps with Leaflet for R

We'll get started by first downloading leaflet, and installing a few packages. Leaflet for R is still under development and is not yet available on CRAN, so we download from Github.

We'll also need the magrittr package to use the forward pipe operator (%>%) and maptools to import and manage shapefiles, which we'll get to later.

```
# First, install leaflet
require(devtools)
devtools::install_github("rstudio/leaflet")

# then install a few extra packages
library(leaflet)
library(magrittr)
library(maptools)
```
```{r, include=FALSE}
require(devtools)
devtools::install_github("rstudio/leaflet")

# then install a few extra packages
library(leaflet)
library(magrittr)
library(maptools)
```

We'll be working with geocoded data from the EPA on pollution and particulate matter from major point sources. Data was available for csv download by state, so I've focused here on the point sources for NOx in New York state.

Here's the EPA page, if you'd like to try this yourself:
[EPA Emissions Sources Data](http://www.epa.gov/air/emissions/where.htm)

## Getting data into R
First thing first, we need to read in our data and inspect the file structure.

```{r}
## read in data as csv file
NOx_NY <- read.csv(path.expand("~/Desktop/NOx_NY.csv"), header=TRUE, sep=",")

## review data format
head(NOx_NY)
```

Great! We'll put this aside for use once we review the basic leaflet functions.

## Setting up a leaflet map

The basic leaflet() function can be called with a host of parameters inside it, but using the pipe operator makes this much simpler so we'll use that method here.

The first thing you'll need is the addTiles() function. This pulls in a set of map tiles from the internet and forms the basis of your interactive map.

```{r}
## basic leaflet map
leaflet() %>% addTiles()
```

Note that the default is to reference the OpenStreetMaps tiles, but other sets are available. A list of can be found here: 

[Leaflet tile options](http://leaflet-extras.github.io/leaflet-providers/preview/index.html)

Let's pick a more interesting background...

```{r}
## map attributions also recommended
m = leaflet() %>% addTiles('http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}', 
                  attribution = 'Tiles &copy; Esri &mdash; Source: Esri, i-cubed, USDA, USGS, AEX, GeoEye, Getmapping, Aerogrid,IGN, IGP, UPR-EGP, and the GIS User Community')
m
```

There we go. Note that this code pulls in a tile set, and allows you to set attributions for the tiles in the bottom right. Always be sure to included attribution for whoever made the map tiles!

This code also assigns the leaflet map to "m". We can now use the pipe operator to put different layers on this basic map. This is useful if you want to manage several different map backgrounds, or a single default map that you want to show with different data layers.

Though the map has a zoom button built in, you can also set the initial starting map center and zoom level explicitly.

```{r}
m %>% setView(-77.03653,38.897676, zoom = 16)
```

## Let's plot some data already

Ok, let's layer on that EPA data from earlier in the simplest way possible.

```{r}
m %>% addCircles(data = NOx_NY)
```

Cool, huh? Leaflet automatically searches for columns in your dataframe named latitude/longitude, or some variant of those words and plots to those points. The zoom is set to the closest level that contains your entire set of points.

You also have some flexibility with this call. Here we explicitly override any data already in m with %>% to plot our NOx sites. If we already had that data referenced in m, we could just do this, with the same result:
``` 
m = leaflet(data = NOx_NY) %>% addTiles() %>% addCircles()
m
```
