
library(shiny)
library(shinydashboard)
library(DT)

options(scipen = 99)
library(tidyverse)
library(plotly)
library(glue)
library(scales)



data1 <- read_csv("data_input/netflix_revenue.csv")
data2 <- read_csv("data_input/netflix_titles.csv")


data_1_fix <- data1 %>%
  mutate(Area = as.factor(Area),
         Quarter = as.factor(substring(Years,0,2)),
         Year = as.double(substring(Years,6,9)))

data_2_fix <- data2 %>%
  mutate(type = as.factor(type),
         rating = as.factor(rating)
         )

data_2_movie <- 
  data_2_fix %>% 
  filter(type %in% "Movie")


data_2_tv_show <- 
  data_2_fix %>% 
  filter(type %in% "TV Show")

