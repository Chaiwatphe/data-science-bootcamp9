install.packages("sqldf")

library(sqldf)

sqldf("select mpg, hp from mtcars
      where hp >= 200")

sqldf(
  "select avg(hp), max(hp),
  count(*) from mtcars"
)


library(RSQLite)

## connect to sqlite.db file
con <- dbConnect(SQLite(), "chinook.db")

## list tables
dbListTables(con)

## list field/ columns
dbListFields(con, "customers")

## get data from database tables
m1 <- dbGetQuery(con, "select firstname, email from customers
Where country = 'USA'")

view(m1)

## create dataframe 
product <- tribble(
  ~id, ~product_name,
  1, "chocolate",
  2, "pineapple",
  3, "samsung galaxy S23"
)


## write table to database
dbWriteTable(con, "product", product)

## remove table
dbRemoveTable(con, "product")


## close connection
dbDisconnect(con)
