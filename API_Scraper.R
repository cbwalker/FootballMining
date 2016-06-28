
##Fantasy Football API Hitter

###Helper Functions###

FFapiHitter <- function(url, nPlayers, relevantFields) {
  
  #Load dependencies
  library(dplyr)
  library(jsonlite)
  
  numCols = length(relevantFields)
  
  # Initializing an empty dataframe
  allplayerdata <- data.frame(matrix(NA,nrow=1,ncol=numCols))
  allplayerdata <- allplayerdata[-1,]
  allplayerdata <- lapply(1:nPlayers, fetchData)
  allplayerdata <- do.call(rbind, lapply(allplayerdata,
                                         data.frame,
                                         stringsAsFactors=FALSE))
  return(allplayerdata)
  
  
}

fetchData <- function(i) {
  res <- try(jsondata <- fromJSON(paste0(url,i)))
  if(!inherits(res, "try-error")) {
    
    print(paste('finished scraping player', i))
    jsondata <- jsondata[which(names(jsondata) %in% relevantFields)]
  }
}




###Worked Example (Run, comment out when sourcing file)
url <- "http://fantasy.premierleague.com/web/api/elements/"
## List of relevant fields we are interested in
# Note some features are lists so need to subset to strings/numerics

relevantFields <- c("points_per_game","total_points","type_name",
                    "team_name","team_code","team_id",
                    "id","status","first_name","second_name",
                    "now_cost","value_form","team",
                    "ep_next","minutes","goals_scored",
                    "assists","clean_sheets","goals_conceded",
                    "own_goals","penalties_saved","penalties_missed",
                    "yellow_cards","red_cards","saves",
                    "bonus","bps","ea_index",
                    "value_form","value_season","selected_by")
nPlayers <- 710
output <- FFapiHitter(url, nPlayers, relevantFields) 
tail(output)


                         
                         
                         

