# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# ui ----
ui <- fluidPage(
  
  # app title ----
  tags$h1("My app title"), # h1("my app title")
  
  # app subtitle ----
  tags$p(tags$strong("Exploring Antarctic Penguin Data")),
  
  # body mass sliderInput ----
  sliderInput(inputId = "body_mass_input",
              label = "Select a range of body masses (g):",
              min = 2700,
              max = 6300,
              value = c(3000, 40000)),
  
  # body mass plot output ----
  plotOutput((outputId = "bodyMass_scatterPlot")),
  
  # year input ----
  checkboxGroupInput(inputId = "year_input",
                     label = "Select year(s)",
                     choices = c(2007, 2008, 2009), # unique(penguins$year)
                     selected = c(2007, 2008)),
  
  # DT output ----
  DT::dataTableOutput(outputId = "penguin_table_output")
  
) # END fluidPage


# server ----
server <- function(input, output) {
  
  #filter data ----
  body_mass_df <- reactive({
  
  penguins %>% 
    filter(body_mass_g %in% input$body_mass_input[1]:input$body_mass_input[2])
    
    })
  
  # render scatter plot ---- 
  output$bodyMass_scatterPlot <- renderPlot({
    
    #code to generate our plot here
    ggplot(na.omit(body_mass_df()),
           aes(x = flipper_length_mm,
               y = bill_length_mm,
               color = species,
               shape = species)) +
      geom_point() +
      scale_color_manual(values = c("Adelie" = "#FEA346",
                                    "Chinstrap" = "#B251F1",
                                    "Gentoo" = "#4BA4B4")) +
      scale_shape_manual(values = c("Adelie" = 19,
                                    "Chinstrap" = 17,
                                    "Gentoo" = 15)) +
      labs(y = "Bill Length (mm)",
           x = "Flipper Length (mm)") +
      theme_classic()
      
  }) # END render scatter plot
  
  # filter years ----
  filtered_years <- reactive({
    
    penguins %>% 
      filter(year %in% c(input$year_input))
    
  })
  
  #render data table ----
  output$penguin_table_output <- DT::renderDataTable({
    
    DT::datatable(filtered_years())
  })
  
} # END server

# combine ui & server ----
shinyApp(ui = ui, server = server)
