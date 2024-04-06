## connect to PostgreSQL server
library(RPostgreSQL)
library(tidyverse)

## create connection
 con2 <-dbConnect(
  PostgreSQL(),
  host = "floppy.db.elephantsql.com",
  dbname = "gvcqnzny",
  user = "gvcqnzny",
  password = "UY3URaJTYfqspMSN4HK5qg4UweS8XLOz",
  port = 5432
)

## db List Tables
dbListTables(con2)

dbWriteTable(con2, "product", product)

## get data 
DF <- dbGetQuery(con2, "Select id, product_name From product")
