install.packages("jsonlite")
library(jsonlite)

url <- "http://fantasy.premierleague.com/web/api/elements/"
names(fromJSON(paste0(url,1))) # Concatenate URL and player id to fetch player data
