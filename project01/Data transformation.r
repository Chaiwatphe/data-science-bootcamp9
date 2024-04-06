library(nycflights13)
library(tidyverse)

## Get Dataset
data(flights)
data(airlines)


view(flights)
view(airlines)

## Qeustion 1 : Top 5 Popular destination in 2013
Q1 <- flights %>%
  mutate(destination = glue("{origin} - {dest}")) %>%
  count(destination, sort = T, name = "Flight") %>%
  arrange(desc(5)) %>%
  head(5)

## Question 2 : Which 5 Airline have the longest distance
Q2 <- flights %>%
  left_join(airlines, by = "carrier") %>%
  select(name, carrier, distance) %>%
  group_by(name, carrier) %>%
  summarize(max_distance = max(distance)) %>%
  arrange(desc(max_distance)) %>%
  head(5)

## Question 3 : Which 10 Airline are the most delayed in Sep
Q3 <- flights %>%
  left_join(airlines, by = "carrier") %>%
  select(name, dep_delay == , month) %>%
  filter(month == 9) %>%
  arrange(desc(dep_delay)) %>%
  head(10)

## Question 4 : Which airlines has the most frequency?
Q4 <- flights %>% 
  select(carrier) %>%
  count(carrier) %>%
  arrange(desc(n)) %>%
  left_join(airlines)

## Question 5 : Most delayed carrier in minute
Q5 <- flights %>%  
  select(carrier, flight, dep_time, sched_dep_time, dep_delay) %>%  
  arrange(desc(dep_delay)) %>%  
  mutate(avg_delay = mean(dep_delay, na.rm = TRUE)) %>%  
  select(-dep_time, -sched_dep_time) %>%  
  left_join(airlines) %>%  
  head(1)
