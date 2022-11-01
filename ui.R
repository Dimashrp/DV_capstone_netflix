
dashboardPage(skin = "purple",
              
              dashboardHeader(title = "Netflix Analysis"),
              
              dashboardSidebar(
                
                sidebarMenu(
                  
                  menuItem(text = "Title",
                           tabName = "Title",
                           icon = icon("video")),
                  
                  menuItem(text = "Revenue",
                           tabName = "revenue",
                           icon = icon("youtube")),
                  
                  menuItem(text = "Title Dataset",
                           tabName ="title_dataset",
                           icon = icon("table")),
                  
                  menuItem(text = "Revenue Dataset",
                           tabName ="revenue_dataset",
                           icon = icon("table")),
                  
                  menuItem(text = "Source Code",
                           tabName = "source_code",
                           icon = icon("github"))
                )
              ),
              
              
              dashboardBody(
                
                tabItems(
                   tabItem(
                    tabName = "Title", 
                    fluidRow(
                      
                      
                      infoBox(title = "TOTAL TITLEs", 
                              value = count(unique(data2)),
                              icon = icon("n"), 
                              color = "purple"),
                      
                      infoBox(title = "TOTAL MOVIES", 
                              value =count(data_2_movie), 
                              icon = icon("ticket"), 
                              color = "black"),
                      
                      infoBox(title = "TOTAL TV SHOWS", 
                              value = count(data_2_tv_show), 
                              icon = icon("tv"), 
                              color = "purple")
                    ),
                    
                    fluidRow( 
                      box(
                           plotlyOutput(outputId = "plot_3")
                      ),
                      box(
                           plotlyOutput(outputId = "plot_2")
                      )
                    
                  )),
                  
                  # --------- HALAMAN KEDUA: CHANNELS
                  tabItem(
                    tabName = "revenue",
                    fluidRow(
                      box(width = 6,
                          height = 100,
                        selectInput(inputId = "input_area", 
                                    label = "Choose Area", 
                                    choices = unique(data_1_fix$Area))
                      ),
                      box(
                        width = 6,
                        height = 100,
                        sliderInput(
                          inputId = "input_year",
                          "Choose Year",
                          min = min(data_1_fix$Year),
                          max = max(data_1_fix$Year),
                          value = min(data_1_fix$Year),
                          sep = NULL
                        )
                      )
                    ),
                    
                    fluidRow( 
                      box( width = 12,
                        plotlyOutput(outputId = "plot_1")
                      )
                    )
                  )
                  ,

                  tabItem(
                    tabName = "title_dataset",
                    DT::dataTableOutput(outputId = "table1")
                  ),

                  tabItem(
                    tabName = "revenue_dataset",
                    DT::dataTableOutput(outputId = "table2")
                  )
                  
                )
                
              )
)
