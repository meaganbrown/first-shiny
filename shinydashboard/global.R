# LOAD PACKAGES ----
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(here)

# READ IN DATA ----
lake_data <- read_csv(here("shinydashboard", "data", "lake_data_processed.csv"))
