#' @title CTIS_open_data_region
#'
#' @description Provides data for the indicator, country, region date and type
#' specified from the Global COVID-19 Trends and Impact Survey
#' @param indicator Indicator variable, e.g., "vaccine_acpt", "covid_vaccine",
#' etc. Please refer to
#' https://gisumd.github.io/COVID-19-API-Documentation/docs/indicators/indicators.html
#' @param type Data type, "daily" or "smoothed"
#' @param country Country, e.g., "Germany"
#' @param region Region, e.g., "Bayern" (usually in native language)
#' @param daterange A particular date in format YYYYMMDD,e.g., "20210101" or
#' a date range, e.g., "20210501-20210516"
#'
#' @return A data frame object that includes the indicator data for the country,
#' region and date specified from the Global COVID-19 Trends and Impact Survey
#' @examples
#' Bavaria_vaccine_acceptance_20210501_20210516 <-
#' CTIS_open_data_region("vaccine_acpt",
#' "daily",
#' "Germany",
#' "Bayern",
#' "20210501-20210516")
#'
#' head(Bavaria_vaccine_acceptance_20210501_20210516)
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom jsonlite "fromJSON"
#'
CTIS_open_data_region <- function(indicator, type, country, region, daterange) {
# core of the function adapted from
# https://gisumd.github.io/COVID-19-API-Documentation/docs/tutorials/tutorials.html
    # concatenate the strings for the retrieving url path
    path <- paste0("https://covidmap.umd.edu/api/resources?indicator=", indicator,
                  "&type=", type, "&country=", country, "&region=", region,
                  "&daterange=", daterange)
    # request the data from api
    request <- GET(url = path)

    # make sure that the content is encoded with "UTF-8"
    response <- content(request, as = "text", encoding = "UTF-8")

    # set up the dataframe to use
    tryCatch({fromJSON(response, flatten = TRUE) %>% data.frame() %>% return()},
             error = function(e)
message("Could not find any data. Please check all your arguments."))
}


