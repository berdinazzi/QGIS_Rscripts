##Vector processing=group
##layer = vector
##MinDistance = number 100
##MinArea = number 10000
##Output = output vector
library(rgeos)
library(maptools)
library(sp)
library(cleangeo)
MinDistance <- floor(MinDistance / 2)
auxBuffer <- gBuffer(layer, width = MinDistance)
auxBuffer <- sp::disaggregate(auxBuffer)
auxBuffer$id <- seq(auxBuffer)
newID <- over(layer, auxBuffer[,"id"])
layer <- unionSpatialPolygons(layer, newID[[1]])
layer$id <- seq(layer)
area <- gArea(layer, byid=TRUE)
layer <- layer[area > MinArea,]
Output <- layer
