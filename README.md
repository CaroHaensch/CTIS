# CTIS
R based Global COVID-19 Trends and Impact Survey Microdata and Opendata API Interface

## The package

This package offers an R interface for the APIs connected to the Global COVID-19 Trends and Impact Survey, formerly known as COVID-19 World Symptoms Survey.

## The Global COVID-19 Trends and Impact Survey

The University of Maryland Social Data Science Center Global COVID-19 Trends and Impact Survey, in partnership with Facebook, is available in 56 languages. A representative sample of Facebook users is invited on a daily basis to report on topics including, for example, symptoms, social distancing behavior, vaccine acceptance, mental health issues, and financial constraints. Facebook provides weights to reduce nonresponse and coverage bias. 

Data for the United States is not included in the Global COVID-19 Trends and Impact Survey but is available at covidcast.cmu.edu.

## Open Data and Microdata API

Country and region-level statistics are published daily via the opendata API [2] and dashboards, and microdata is available for researchers via data use agreements. Over half a million responses are collected daily. For more information on the data, see https://covidmap.umd.edu/. While the open data is available without an account, the microdata API requires an account that can be requested here: https://dataforgood.fb.com/docs/covid-19-symptom-survey-request-for-data-access/.


## Installation

``` r
devtools::install_github("CaroHaensch/CTIS")
library(CTIS)
```

## References

[1] Junchuan Fan, Yao Li, Kathleen Stewart, Anil R. Kommareddy, Andres Garcia, Jinyi Ma, Zheng Liu, Joe O’Brien, Adrianne Bradford, Xiaoyi Deng, Samantha Chiu, Frauke Kreuter, Neta Barkay, Alyssa Bilinski, Brian Kim, Tal Galili, Daniel Haimovich, Sarah LaRocca, Stanley Presser, Katherine Morris, Joshua A Salomon, Elizabeth A. Stuart, Ryan Tibshirani, Tali Alterman Barash, Curtiss Cobb, Andi Gros, Ahmed Isa, Alex Kaess, Faisal Karim, Roee Eliat, Ofir Eretz Kedosha, Shelly Matskel, Roee Melamed, Amey Patankar, Irit Rutenberg, Tal Salmona, David Vannette (2020). The University of Maryland Social Data Science Center Global COVID-19 Trends and Impact Survey, in partnership with Facebook. https://covidmap.umd.edu/api.html

