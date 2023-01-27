ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # page 1: intro tabPanel ----
  tabPanel(title = "About this App",
           
           "background info here"
           
  ), # END tabPanel page #1
  
  #page 2: data tabPanel ----
  tabPanel(title = "Explore the Data",
           
           #tabsetPanel ----
           tabsetPanel(
             
             #trout tab ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebar panel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      options = pickerOptions(actionsBox = TRUE),
                                      selected = c("C", "R"),
                                      multiple = TRUE
                          ), # END pickerInput
                          
                          #checkboxGroupButtonInput
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = c("clear cut forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               checkIcon = list(yes = icon("ok",
                                                                           lib = "glyphicon"),
                                                                no = icon("remove"),
                                                                lib = "glyphicon"))
                          
                        ), #END trout sidebar panel
                        
                        # trout mainPanel
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot") %>% 
                            withSpinner(type = 1)
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tab
             
             #penguin tab ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        #penguin sidebar panel ----
                        sidebarPanel(
                          
                          "penguin inputs here"
                          
                        ), # END penguin sidebar panel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin outputs here"
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tab
             
           ) # END tabsetPanel
           
  ) # END data tabPanel
  
)
