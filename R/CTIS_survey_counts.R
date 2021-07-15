#' @title CTIS_survey_counts
#'
#' @description Provides data for the number of full and PartA responses for a
#' specific date from the Global COVID-19 Trends and Impact Survey
#' @param date A particular date in format YYYYMMDD, e.g., "20210101",
#' @return A data frame object that includes the number of responses for a
#' specific date from the Global COVID-19 Trends and Impact Survey
#' @examples
#' CTIS_survey_counts("20210129")
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom jsonlite "fromJSON"


CTIS_survey_counts <- function(date) {
# core of the function adapted from
# https://gisumd.github.io/COVID-19-API-Documentation/docs/tutorials/tutorials.html
    # concatenate the strings for the retrieving url path
    path <- paste0("https://covidmap.umd.edu/api/counts?date=", date)
    # request the data from api
    request <- GET(url = path)

    # make sure that the content is encoded with "UTF-8"
    response <- content(request, as = "text", encoding = "UTF-8")

    # set up the dataframe to use
    tryCatch({fromJSON(response, flatten = TRUE) %>% data.frame() %>% return()},
             error = function(e)
message("Could not find any data. Please check the format of the given date
        (should be YYYY-MM-DD)."))
}


