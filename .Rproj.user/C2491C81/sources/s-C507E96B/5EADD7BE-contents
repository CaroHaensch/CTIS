#' @title Downloads CTIS microdata for the date specified
#'
#' @description Downloads, saves as a .csv in the working directory and then
#' loads the microdata for the date specified from the Global COVID-19 Trends
#' and Impact Survey
#' @param username Username for the microdata API, please check
#' https://dataforgood.fb.com/docs/covid-19-symptom-survey-request-for-data-access/
#' if you do not already have an account
#' @param password Password for the microdata API, please check
#' https://dataforgood.fb.com/docs/covid-19-symptom-survey-request-for-data-access/
#' if you do not already have an account
#' @param surveyversion Current version of the Global COVID-19 Trends and Impact
#' Survey. Current version during July 2021: v1.7
#' @param date Date in the format "YYYY-MM-DD"
#' @param type Version "full" or "parta"
#'
#' @return A data frame object that includes the microdata data for the date
#' specified from the Global COVID-19 Trends and Impact Survey
#' @export
#' @importFrom dplyr "%>%"
#' @importFrom httr "GET"
#' @importFrom httr "content"
#' @importFrom httr "write_disk"
#' @importFrom httr "authenticate"
#' @importFrom jsonlite "fromJSON"
#' @importFrom R.utils "gunzip"
#' @importFrom utils "read.csv"
#'
CTIS_microdata <- function(username, password, date, surveyversion="v1.7",
                             type="parta") {

  year <- strsplit(date,"-")[[1]][1]
  month <- strsplit(date,"-")[[1]][2]

  fileUrl <- paste0("https://covidmap.umd.edu/fbsurvey/microdata", "/",
                    surveyversion, "/",
                    year, "/",
                    month, "/",
                    date, "_",
                    type, ".csv.gz")

  fileName <- paste0(date, "_", type)

  GET(fileUrl, authenticate(username, password),
      write_disk(paste0(fileName, ".csv.gz")))

  df <- gunzip(paste0(getwd(), "/", fileName, ".csv.gz"), remove=FALSE)
  # the corresponding csv files is then generated in the same folder path
  df <- read.csv(paste0(getwd(), "/", fileName, ".csv"))
  if(df[3,1]=="<p>The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.</p>"){
    warning("The server encountered an internal error and was unable to complete
            your request. Either the server is overloaded or there is an error
            in your arguments (check all arguments including version and type)."
            )
  } else {
  return(df)
  }
}
