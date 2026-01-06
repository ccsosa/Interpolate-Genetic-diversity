require(geodata)
require(factoextra);library(ranger);library(caret)
library(doParallel);require(tmaptools)
#downloading worlclim

if(!file.exists("D:/REPO_GITHUB/PREDICT_GEN_DIVERSITY/spat_data.tif")){
  x <- worldclim_global(var = "bio", res=5,
                        path="D:/REPO_GITHUB/PREDICT_GEN_DIVERSITY"
                        # country=c("France","Spain","Portugal","Morocco" )
  )  
  
  
  #downloading selected countries
  shp <- gadm(country = c("France","Spain","Portugal","Morocco" ), level = 0, 
              path = "D:/REPO_GITHUB/PREDICT_GEN_DIVERSITY")  # level 0 = national boundaries
  
  #cutting and masking to FR,ES,PT,MO
  x2 <- terra::crop(x,shp)
  x2 <- terra::mask(x2,shp)
  
  #saving stack raster
  writeRaster(x2,"D:/REPO_GITHUB/PREDICT_GEN_DIVERSITY/spat_data.tif")
} else {
  x <- rast("D:/REPO_GITHUB/PREDICT_GEN_DIVERSITY/spat_data.tif")
}