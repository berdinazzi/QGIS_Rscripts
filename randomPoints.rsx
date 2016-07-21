##Raster Processing=group
##Raster=raster 
##Number_of_points = number 100
##Output=output vector
library(sp)
library(raster)

ras <- subset(Raster, 1)

pp <- spsample(ras,
               n = Number_of_points,
               type='random')

pp <- SpatialPointsDataFrame(pp,
                             data.frame(id = seq(pp)))

Projection <- CRS('+proj=utm +zone=29 +north +datum=WGS84 +units=m +no_defs')

Output <- spTransform(pp, Projection)
