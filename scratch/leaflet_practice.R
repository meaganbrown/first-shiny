library(tidyverse)
library(here)
library(leaflet)

# #practice filtering
# lakes_new <- filtered_lakes %>% 
#   filter(AvgTemp >= 4 & AvgTemp <= 6)
# 
# filtered_lakes <- read_csv(here("shinydashboard", "data", "lake_data_processed.csv"))
# 
# leaflet() %>% 
#   
#   # add tiles
#   addProviderTiles("Esri.WorldImagery") %>% 
#   
#   #set view of Alaska
#   setView(lng = -152,
#           lat = 70,
#           zoom = 6)
#   
# # #Add mini-map 
# # addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>%
# #   
#   # add markers
#   addMarkers(data = filtered_lakes,
#              lng = filtered_lakes$Longitude,
#              lat = filtered_lakes$Latitude,
#              popup = paste(
#              "Site Name:", filtered_lakes$Site, "<br>",
#              "Elevation:", filtered_lakes$Elevation, "meters (above SL)", "<br>",
#              "Avg Depth:", filtered_lakes$AvgDepth, "meters", "<br>",
#              "Avg Lake Bed Temperature:", filtered_lakes$AvgTemp, "deg Celsius"))


leaflet() %>%
  #Add titles
  addProviderTiles("Esri.WorldImagery") %>%
  #Set view of AK
  setView(lng = -152, lat = 70, zoom = 6) %>%
  
  #Add mini-map 
  addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>% 
  
  #ADD Markers
  addMarkers(data = filtered_lakes,
             lng = filtered_lakes$Longitude,
             lat = filtered_lakes$Latitude,
             popup = paste("Site Name:", filtered_lakes$Site, "<br>",
                           "Elevation", filtered_lakes$Elevation, "meters (above SL)", "<br>",
                           "Avg Depth", filtered_lakes$AvgDepth, "meters", "<br>",
                           "Avg Lake Bed Temperature:", filtered_lakes$AvgTemp, "deg Celsius"))
  

  