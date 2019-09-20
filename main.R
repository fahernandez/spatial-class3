library(sp)  
library(plotGoogleMaps)  
library(spatstat)  
library(raster)  
library(maptools)  
library(plotrix)  
library(rgeos)  

data <- read.csv("london_street.csv") 
str(data)
data <- data[!is.na(data$Longitude)&!is.na(data$Latitude),]  
coordinates(data)=~Longitude+Latitude  
zero <- zerodist(data)  
length(unique(zero[,1])) 

#Loading Natural Earth Provinces dataset to define window for Point Pattern Analysis  

download.file("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_1_states_provinces.zip",destfile="ne_10m_admin_1_states_provinces.zip")  
unzip("ne_10m_admin_1_states_provinces.zip",exdir="NaturalEarth")  
border <- shapefile("NaturalEarth/ne_10m_admin_1_states_provinces.shp")  
GreaterLondon <- border[paste(border$region)=="Greater London",]  