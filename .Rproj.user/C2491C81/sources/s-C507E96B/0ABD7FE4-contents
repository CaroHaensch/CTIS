#' @title Check availability of CTIS data for a country
#'
#' @description Provides a list of dates for which data from the Global
#' COVID-19 Trends and Impact Survey for the specified country is available
#' @param country Country, e.g., "Germany"
#'
#' @return A data frame object that indicates the dates for which data from
#' the Global COVID-19 Trends and Impact Survey data is available for the
#' respective country
#' @examples
#' Germany_available_dates <- CTIS_available_country("Germany")
#' head(Germany_available_dates)
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom jsonlite "fromJSON"

CTIS_available_country <- function(country) {
# core of the function adapted from
# https://gisumd.github.io/COVID-19-API-Documentation/docs/tutorials/tutorials.html
    # concatenate the strings for the retrieving url path
    path <- paste0("https://covidmap.umd.edu/api/datesavail?country=", country)
    # request the data from api
    request <- GET(url = path)

    # make sure that the content is encoded with "UTF-8"
    response <- content(request, as = "text", encoding = "UTF-8")

    # set up the dataframe to use

    tryCatch({fromJSON(response, flatten = TRUE) %>% data.frame() %>% return()},
              error = function(e)
    message("Could not find any data. Please check the name of the country."))
}

