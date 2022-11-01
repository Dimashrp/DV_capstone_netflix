
library(shiny)
library(shinydashboard)
library(DT) # datatable

options(scipen = 99)
library(tidyverse)
library(plotly)
library(glue)
library(scales)



data2 <- read_csv("data_input/DataNetflixRevenue2020_V2.csv")
# data1 <- read_csv("data_input/titles.csv")


data_2_fix <- data2 %>%
  mutate(Area = as.factor(Area),
         Quarter = as.factor(substring(Years,0,2)),
         Year = as.factor(substring(Years,6,9)))


