#' General Stat Info
#'
#' This function extracts the table from a webpage for a given NFL stat type and year.
#'
#' @param type_info A character string representing the type of stat (passing, receiving, rushing, defense, etc.)
#' @param year The year that data is being selected from
#' @return A data frame containing the table from the webpage.
#' @import rvest
#' @import tidyverse
#' @examples
#' general_stat_info("passing", 1999)
#'
#' @export
general_stat_info = function(type_info, year){
  url <- paste0("https://www.pro-football-reference.com/years/",year,"/",type_info,".htm")

  # Read the HTML content of the webpage
  webpage <- read_html(url)

  # Extract the table from the webpage
  table <- html_node(webpage, "table")

  # Convert the table to a data frame
  table_df <- html_table(table)

  # Print the data frame
  table_df
}



df <- general_stat_info("defense",2009)
