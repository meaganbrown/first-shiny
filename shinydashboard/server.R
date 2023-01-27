server <- function(input, output) {
  
  
  # filter lake data ----
  filtered_lakes <- reactive({
    
    lake_data %>% 
      filter(Elevation >= input$elevation_slider_input[1] & #[1] calls lower bound
             Elevation <= input$elevation_slider_input[2]) # [2] calls upper bound
    
  }) # END reactive
  
  
  # build leaflet map ----
  output$lake_map <- renderLeaflet({
    
    leaflet() %>%
      
      #Add titles
      addProviderTiles("Esri.WorldImagery") %>%
      
      #Set view of AK
      setView(lng = -152, lat = 70, zoom = 6) %>%
      
      #Add mini-map 
      addMiniMap(toggleDisplay = TRUE, minimized = TRUE) %>%
      
      #ADD Markers
      addMarkers(data = filtered_lakes(),
                 lng = filtered_lakes()$Longitude,
                 lat = filtered_lakes()$Latitude,
                 popup = paste("Site Name:", filtered_lakes()$Site, "<br>",
                               "Elevation", filtered_lakes()$Elevation, "meters (above SL)", "<br>",
                               "Avg Depth", filtered_lakes()$AvgDepth, "meters", "<br>",
                               "Avg Lake Bed Temperature:", filtered_lakes()$AvgTemp, "deg Celsius"))
    
  }) # END renderLeaflet
  
  
  
  
} # END server function