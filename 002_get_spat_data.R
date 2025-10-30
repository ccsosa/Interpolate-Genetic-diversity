require(geodata)
require(factoextra);library(ranger);library(caret)
library(doParallel);require(tmaptools)
#downloading worlclim
x <- worldclim_global(var = "bio", res=5,
                      path="D:/PROGRAMAS/Dropbox/uniquindio_gen_ii/MATERIAL/PRACTICA8"
                      # country=c("France","Spain","Portugal","Morocco" )
                      )
#downloading selected countries
shp <- gadm(country = c("France","Spain","Portugal","Morocco" ), level = 0, 
            path = "D:/PROGRAMAS/Dropbox/uniquindio_gen_ii/MATERIAL/PRACTICA8")  # level 0 = national boundaries

#cutting and masking to FR,ES,PT,MO
x2 <- terra::crop(x,shp)
x2 <- terra::mask(x2,shp)

#saving stack raster
writeRaster(x2,"D:/PROGRAMAS/Dropbox/uniquindio_gen_ii/MATERIAL/PRACTICA8/spat_data.tif")
