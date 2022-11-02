shinyServer(function(input,output){
  
  output$plot_1 <- renderPlotly({
    
    data_1_fixed <- 
      data_1_fix %>%
      filter(Area %in% input$input_area) %>%
      filter(Year %in% input$input_year) %>%
      group_by(Area, Quarter, Year) %>% 
      summarise(Revenue = sum(Revenue)) %>%
      arrange(Quarter) %>% 
      mutate(label = glue("Quarter: {Quarter}
                           Revenue: {scales::comma(Revenue)}"))
  
    plot1 <- 
      ggplot(data = data_1_fixed, mapping = aes(x = Quarter, 
                                                y = Revenue, 
                                                text = label))+
      geom_line(group = 1, color = "purple") +
      geom_point() +
      scale_y_continuous(labels = scales::comma) +
      labs(title = "Total Revenue",
           x = "Quarter",
           y = "Revenue") +
      theme_minimal() +
      theme(text = element_text(size = 10, face="bold"))
    
    ggplotly(p = plot1, tooltip = "text")
    
  })
  
  output$plot_2 <- renderPlotly({
    
    data_2_tv_show_plot <- 
      data_2_fix %>% 
      filter(type %in% "TV Show", !is.na(rating))%>% 
      group_by(type, rating) %>% 
      summarise(total_rating =  n())  %>%
      ungroup() %>%
      arrange(desc(total_rating))%>%
      mutate(label = glue("Rating: {rating}
                      Total: {total_rating}"))
    
    plot2 <- 
      data_2_tv_show_plot %>% 
      ggplot(mapping = aes(y = reorder(rating, total_rating),
                           x = total_rating,
                           fill = total_rating,
                           text = label)) + # tambahan parameter text
      geom_col() +
      scale_fill_gradient(low = "pink",
                          high = "purple") +
      labs(title = "Tv Show Rating",
           x = "Total Rating", 
           y = "Rating") +
      theme_light() +
      theme(legend.position = "none",
            text = element_text(size = 10, face="bold"), 
            axis.text = element_text(size = 8))  
    
    ggplotly(p = plot2, 
             tooltip = "text")
    
  }
  )
  
  output$plot_3 <- renderPlotly({
    
    
    data_2_movie_plot <- 
      data_2_fix %>% 
      filter(type %in% "Movie",!is.na(rating))%>% 
      group_by(type, rating) %>% 
      summarise(total_rating =  n())  %>%
      ungroup() %>%
      arrange(desc(total_rating))%>%
      mutate(label = glue("Rating: {rating}
                      Total: {total_rating}"))
    
    plot3 <- 
      data_2_movie_plot %>% 
      ggplot(mapping = aes(y = reorder(rating, total_rating),
                           x = total_rating,
                           fill = total_rating,
                           text = label)) + # tambahan parameter text
      geom_col() +
      scale_fill_gradient(low = "pink",
                          high = "purple") +
      labs(title = "Movie Rating",
           x = "Total Rating", 
           y = "Rating") +
      theme_light() +
      theme(legend.position = "none",
            text = element_text(size = 10, face="bold"), 
            axis.text = element_text(size = 8))  
    
    ggplotly(p = plot3, 
             tooltip = "text")
    
  }
  )
  
  output$table1 <- renderDataTable({

    datatable(data_2_fix,
              options = list(scrollX = TRUE))

  })
  
  output$table2 <- renderDataTable({

    datatable(data_1_fix,
              options = list(scrollX = TRUE))

  })
})
