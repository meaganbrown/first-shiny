# load packages ----
library(tidyverse)
library(leaflet)
library(here)

# read in data ----
lake_monitoring_data <- read_csv(here("raw_data", "FCWO_lakemonitoringdata_2011_2022_daily.csv"))

# calculate averages ----
avg_depth_temp <- lake_monitoring_data %>%
  select(Site, Depth, BedTemperature) %>% 
  filter(Depth != "NaN") %>% # filter out NA
  drop_na(BedTemperature) %>% # only drop NA in BedTemp column
  group_by(Site) %>% 
  summarize(AvgDepth = round(mean(Depth), 1),
            AvgTemp = round(mean(BedTemperature), 1)
  )


lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

unique_lakes <- lake_monitoring_data %>% 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) %>% 
  distinct()

write_csv(unique_lakes, here("shinydashboard", "data", "lake_data_processed.csv"))










# ---------------Set Up & Data Processing ------------------

#Load libraries
library(tidyverse)
library(leaflet)

#Read in the raw data ----
lake_monitoring_data <- read_csv("raw_data/FCWO_lakemonitoringdata_2011_2022_daily.csv")

#Calculating average depth and temp ----
avg_depth_temp <- lake_monitoring_data %>%
  select(Site, Depth, BedTemperature) %>% 
  filter(Depth != "NaN") %>% # filter out NA
  drop_na(BedTemperature) %>% # only drop NA in BedTemp column
  group_by(Site) %>% 
  summarize(AvgDepth = round(mean(Depth), 1),
            AvgTemp = round(mean(BedTemperature), 1)
  )

#Join avg depth & temp to original (match rows based on 'Site') ----
lake_monitoring_data <- full_join(lake_monitoring_data, avg_depth_temp)

#Get unique lakes observation (with corresponding lat, lon, elev, avgDepth, avgTemp) for mapping ----
unique_lakes <- lake_monitoring_data %>%
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) %>%
  distinct()

#Save processed data to your app's data directory ----  
write_csv(unique_lakes, "shiny_dashboard/data/lake_data_processed.csv")


