
library(shiny)
library(shinydashboard)
library(DT)

options(scipen = 99)
library(tidyverse)
library(plotly)
library(glue)
library(scales)



data1 <- read_csv("data_input/DataNetflixRevenue2020_V2.csv")
data2 <- read_csv("data_input/netflix_titles.csv")


data_1_fix <- data1 %>%
  mutate(Area = as.factor(Area),
         Quarter = as.factor(substring(Years,0,2)),
         Year = as.numeric(substring(Years,6,9)))

data_2_fix <- data2 %>%
  mutate(type = as.factor(type),
         rating = as.factor(rating)
         )


data_2_movie_plot <- 
  data_2_fix %>% 
  filter(type %in% "Movie",!is.na(rating))%>% 
  group_by(type, rating) %>% 
  summarise(total_rating =  n())  %>%
  ungroup() %>%
  arrange(desc(total_rating))%>%
  mutate(label = glue("Rating: {rating}
                      Total: {total_rating}"))

data_2_tv_show_plot <- 
  data_2_fix %>% 
  filter(type %in% "TV Show", !is.na(rating))%>% 
  group_by(type, rating) %>% 
  summarise(total_rating =  n())  %>%
  ungroup() %>%
  arrange(desc(total_rating))%>%
  mutate(label = glue("Rating: {rating}
                      Total: {total_rating}"))


