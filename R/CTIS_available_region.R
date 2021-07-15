#' @title Check availability of CTIS data for a region in a country
#'
#' @description Provides a list of dates for which Global COVID-19 Trends and
#' Impact Survey data is available for a region in a country
#' @param country Country, e.g., "Germany"
#' @param region Region, e.g., "Bayern" (usually in native language)
#'
#' @return A data frame object that indicates the dates for which data from the
#' Global COVID-19 Trends and Impact Survey data is available for the respective
#' country region
#' @examples
#' Bavaria_available_dates <- CTIS_available_region("Germany", "Bayern")
#' head(Bavaria_available_dates)
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom jsonlite "fromJSON"

CTIS_available_region  <- function(country, region) {
# core of the function adapted from
# https://gisumd.github.io/COVID-19-API-Documentation/docs/tutorials/tutorials.html
    path <- paste0("https://covidmap.umd.edu/api/datesavail?country=",
                  country, "&region=", region)
    # request the data from api
    request <- GET(url = path)

    # make sure that the content is encoded with "UTF-8"
    response <- content(request, as = "text", encoding = "UTF-8")

    # set up the dataframe to use
    tryCatch({fromJSON(response, flatten = TRUE) %>% data.frame() %>% return()},
             error = function(e)
    message("Could not find any data. Please check the name of the country
and region."))
}
