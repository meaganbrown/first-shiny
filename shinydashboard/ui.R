# dashboard header ---------------------
header <- dashboardHeader(
  
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboardHeader

# dashboard sidebar ---------------------
sidebar <- dashboardSidebar(
  
  #sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", 
             tabName = "welcome", 
             icon = icon("star")),
    
    menuItem(text = "Dashboard",
             tabName = "dashboard",
             icon = icon("gauge"))
    
  ) # END sidebarMenu
  
) # END dashboardSidebar

# dashboard body ---------------------
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
   # welcome tabItem ----
   tabItem(tabName = "welcome",
           
           #left-hand column
           column(width = 6,
                  
                  box(width = NULL,
                      
                      "background info here"
                      
                      ) # END left-box
                  
                  ), # END left-hand column
           
          # right-hand column ----
          column(width = 6,
                 
                 #top fluid row ----
                 fluidRow(
                   
                  box(width = NULL,
                      
                      "data citation here"
                      
                      ) # END right-box
                   
                 ), # END top fluid row
                 
                 #bottom fluidRow ----
                 fluidRow(
                   
                   box(width = NULL,
                       
                       "disclaimer here"
                       
                       ) # END bottom box
                   
                 ) # END bottom fluidRow
                 
                 ) # END right-hand column
           
           ), # END tabItem
   
   #dashboard tabItem
   tabItem(tabName = "dashboard",
           
          #fluidRow ---- (elements adjust as you move screen around)
          fluidRow(
            
            # input box ----
            box(width = 4,
                
                title = tags$strong("Adjust lake parameter ranges:"),
                
                # sliderInput ----
                sliderInput(inputId = "elevation_slider_input",
                            label = "Elevation (meters above sea level):",
                            min = min(lake_data$Elevation),
                            max = max(lake_data$Elevation),
                            value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                
                ), # END input box
            
            #leaflet box ----
            box(width = 8,
                
                title = tags$strong("Monitored lakes within Fish Creek Watershed:"), 
                
                # leaflet output ----
                leafletOutput(outputId = "lake_map") %>% withSpinner(type = 1,
                                                                     color = "pink")
                  
                
                ) # END leaflet box
            
            
          ) # END fluidRow
           
           ) # END dashboard tabItem
    
  ) # END tabItem
  
  
) # END dashboardBody

# combine all ---------------------
dashboardPage(header, sidebar, body)

