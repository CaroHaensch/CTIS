# CTIS
R based Global COVID-19 Trends and Impact Survey Microdata and Opendata API Interface

## The package

This package offers an R interface for the APIs connected to the Global COVID-19 Trends and Impact Survey, formerly known as COVID-19 World Symptoms Survey.

You can install and load it with the following code.

``` r
devtools::install_github("CaroHaensch/CTIS")
library(CTIS)
```


## The Global COVID-19 Trends and Impact Survey

The University of Maryland Social Data Science Center Global COVID-19 Trends and Impact Survey [1], in partnership with Facebook, is available in 56 languages. A representative sample of Facebook users is invited on a daily basis to report on topics including, for example, symptoms, social distancing behavior, vaccine acceptance, mental health issues, and financial constraints. Facebook provides weights to reduce nonresponse and coverage bias. 

Data for the United States is not included in the Global COVID-19 Trends and Impact Survey but is available at https://delphi.cmu.edu/covidcast/.

## Opendata and Microdata API

Country and region-level statistics are published daily via the opendata API and dashboards, and microdata is available for researchers via data use agreements. Over half a million responses are collected daily. For more information on the data, see https://covidmap.umd.edu/. While the open data is available without an account, the microdata API requires an account that can be requested here: https://dataforgood.fb.com/docs/covid-19-symptom-survey-request-for-data-access/.

## Get started with the CTIS package

### Installation

First things first, to download the package, please download the package and load it.

``` r
devtools::install_github("CaroHaensch/CTIS")
library(CTIS)
```

### Check availability

After loading the package, we can now check for which dates data is available for a specific country.

``` r
CTIS_Germany_available_dates <- CTIS_available_country(country = "Germany")

# Number of available dates
nrow(CTIS_Germany_available_dates)

# Some example dates
head(CTIS_Germany_available_dates)
```

We can do the same check (available dates) for specific regions in a country. Compared to the country names (in English), the names for the regions are usually specified in the native language. As an example, we check the available dates for the region Bavaria ("Bayern") in Germany. 

``` r
CTIS_Bavaria_available_dates <- CTIS_available_region(country = "Germany",
                                                      region = "Bayern")

# Number of available dates
nrow(CTIS_Bavaria_available_dates)

# Some example dates
head(CTIS_Bavaria_available_dates)

```

### Get data through the Opendata API


As already mentioned, country and region-level statistics are published daily via the Opendata API [2] and dashboards.

A full list of indicators is available here:
https://gisumd.github.io/COVID-19-API-Documentation/docs/indicators/indicators.html

We will look up the indicator Vaccine Acceptance for three dates in May 2021 for Germany. We obtain different weighted and unweighted point and variance estimates.

``` r
CTIS_open_data_country(indicator = "vaccine_acpt", 
                       type = "daily", 
                       country = "Germany",
                       daterange = "20210501-20210503")
```
Again, we can also receive data for a specific region in a country. 

``` r
CTIS_open_data_region(indicator = "vaccine_acpt", 
                       type = "daily", 
                       country = "Germany",
                       region = "Bayern",
                       daterange = "20210501-20210503")

```
### Get data through the Microdata API

While the open data is available without an account,  the microdata API requires an account that can be requested here by researchers: https://dataforgood.fb.com/docs/covid-19-symptom-survey-request-for-data-access/

The following function can then be used to download, save as a .csv and load all at once the microdata for a specific date. 

``` r
username <- "Specify your username here."
password <- "Specify your password here."

# Once you have received access, uncomment the following lines
# and specify the date for which you wish to receive the microdata.

# CTIS_microdata(username = username, 
#               password = password, 
#               date = "YYYY-MM-DD")

```

And that's it. We thank the University of Maryland and the Facebook team for providing us with this fantastic data source! We also want to note that we used the tutorials provided on the https://covidmap.umd.edu/ site to create the core of the functions. 

You can also check out and download the vignette as a PDF here:
https://github.com/CaroHaensch/CTIS/blob/main/vignettes/CTIS_vignette.pdf

## References

[1] Junchuan Fan, Yao Li, Kathleen Stewart, Anil R. Kommareddy, Andres Garcia, Jinyi Ma, Zheng Liu, Joe O’Brien, Adrianne Bradford, Xiaoyi Deng, Samantha Chiu, Frauke Kreuter, Neta Barkay, Alyssa Bilinski, Brian Kim, Tal Galili, Daniel Haimovich, Sarah LaRocca, Stanley Presser, Katherine Morris, Joshua A Salomon, Elizabeth A. Stuart, Ryan Tibshirani, Tali Alterman Barash, Curtiss Cobb, Andi Gros, Ahmed Isa, Alex Kaess, Faisal Karim, Roee Eliat, Ofir Eretz Kedosha, Shelly Matskel, Roee Melamed, Amey Patankar, Irit Rutenberg, Tal Salmona, David Vannette (2020). The University of Maryland Social Data Science Center Global COVID-19 Trends and Impact Survey, in partnership with Facebook. https://covidmap.umd.edu/api.html

