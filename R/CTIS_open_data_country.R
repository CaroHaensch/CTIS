#' @title Provides CTIS data for the indicator, country and date specified
#'
#' @description Provides data for the indicator, country, date and type
#' specified from the Global COVID-19 Trends and Impact Survey
#' @param indicator Indicator variable, e.g., "vaccine_acpt",
#' "covid_vaccine", etc.
#' @param type Data type, "daily" or "smoothed"
#' @param country Country, e.g., "Germany"
#' @param daterange A particular date, e.g., "20210101"or a date range
#' "20210501-20210516"
#'
#' @return A data frame object that includes the indicator data for the country
#' and date specified from the Global COVID-19 Trends and Impact Survey
#' @examples
#' Germany_vaccine_acceptance_20210501_20210516 <-
#' CTIS_open_data_country("vaccine_acpt",
#' "daily",
#' "Germany",
#' "20210501-20210516")
#' head(Germany_vaccine_acceptance_20210501_20210516)
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom jsonlite "fromJSON"


CTIS_open_data_country <- function(indicator, type, country, daterange) {
# core of the function adapted from
# https://gisumd.github.io/COVID-19-API-Documentation/docs/tutorials/tutorials.html
    # concatenate the strings for the retrieving url path
    path <- paste0("https://covidmap.umd.edu/api/resources?indicator=", indicator,
                  "&type=", type, "&country=", country, "&daterange=", daterange)
    # request the data from api
    request <- GET(url = path)

    # make sure that the content is encoded with "UTF-8"
    response <- content(request, as = "text", encoding = "UTF-8")

    tryCatch({fromJSON(response, flatten = TRUE) %>% data.frame() %>% return()},
             error = function(e)
      message("Could not find any data. Please check all your arguments."))
}

