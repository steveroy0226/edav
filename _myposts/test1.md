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

<iframe src=' figure/unnamed-chunk-2-1.html ' scrolling='no' frameBorder='0' seamless class='rChart leaflet ' id=iframe- chartc882991e53d ></iframe> <style>iframe.rChart{ width: 100%; height: 400px;}</style>
