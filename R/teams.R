#' General Team Info
#'
#' This function extracts all the tables from a webpage for a given NFL team.
#'
#' @param team_name A character string representing the abbreviation of the NFL team.
#' @param year The year that data is being selected from
#' @return A list of data frames containing the tables from the webpage.
#' @import rvest
#' @import tidyverse
#' @examples
#' general_team_info("rav")
#'
#' @export
general_team_info = function(team_name, year){
  url <- paste0("https://www.pro-football-reference.com/teams/",team_name,"/",year,".htm")

  # Read the HTML content of the webpage
  webpage <- read_html(url)

  # Extract all the tables from the webpage
  tables <- html_nodes(webpage, "table")

  # Convert each table to a data frame
  tables_df <- tables %>% map(~ html_table(.))

  # Print the data frames
  tables_df
}
