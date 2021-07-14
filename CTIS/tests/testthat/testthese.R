
library(testthat)        # load testthat package
library(CTIS)       # load our package

# Test whether the output is a data frame
test_that("CTIS_open_data_country returns a data frame with length 16", {
  output_CTIS_open_data_country <- CTIS_open_data_country("vaccine_acpt",
                                                              "daily",
                                                              "Germany",
                                                              "20210501-20210516")
  expect_equal(nrow(output_CTIS_open_data_country), 16)
})


test_that("CTIS_open_data_region returns a data frame with length 16", {
  output_CTIS_open_data_region <- CTIS_open_data_region("vaccine_acpt",
                                                            "daily",
                                                            "Germany",
                                                            "Bayern",
                                                            "20210501-20210516")
  expect_equal(nrow(output_CTIS_open_data_region), 16)
})


test_that("CTIS_survey_counts returns a data frame with ncol 4", {
  output_CTIS_survey_counts <- CTIS_survey_counts("20210129")
  expect_equal(ncol(output_CTIS_survey_counts), 4)
})


test_that("CTIS_available_region returns a data frame with nrow > 150", {
  output_CTIS_available_region <- CTIS_available_region("Germany", "Bayern")
  expect_equal(nrow(output_CTIS_available_region)>150, T)
})

test_that("CTIS_available_region returns a data frame with ncol 4", {
  output_CTIS_available_region <- CTIS_available_region("Germany", "Bayern")
  expect_equal(ncol(output_CTIS_available_region), 4)
})


test_that("CTIS_available_country returns a data frame with nrow > 150", {
  output_CTIS_available_country <- CTIS_available_country("Germany")
  expect_equal(nrow(output_CTIS_available_country)>150, T)
})

test_that("CTIS_available_country returns a data frame with ncol 3", {
  output_CTIS_available_country <- CTIS_available_country("Germany")
  expect_equal(ncol(output_CTIS_available_country), 3)
})


