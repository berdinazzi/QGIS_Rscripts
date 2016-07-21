##Vector processing=group
##Points=vector
##Output=output vector
##Size=number 500
##Field=Field Points
##Corner_or_Center=string Center
library(rgeos)
library(sp)
library(raster)

SP <- SpatialPointsDataFrame(Points,
                             data.frame(Points[[Field][]))

if(Corner_or_Center == 'Corner'){
  SP <- shift(SP,
              x = Size, 
              y = Size)
}

Output <- gBuffer(SP, 
                 width = Size, 
                 quadsegs = 1, 
                 capStyle = "SQUARE",
                 byid = TRUE)

Projection <- CRS('+proj=utm +zone=29 +north +datum=WGS84 +units=m +no_defs')

Output <- spTransform(Output, Projection)
