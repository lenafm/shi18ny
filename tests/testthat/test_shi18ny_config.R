context("config")

test_that("i18n Config",{

  # Default options
  opts <- NULL
  config <- i18nConfig()

  i18n <- i18nLoad()

  expect_equal(names(i18n), c(availableLangs(), ".config"))
  expect_true("shi18ny" %in% names(i18n$en))

  str <- "shi18ny.language"
  expect_equal(i_(str,lang = "en"), "language")
  expect_equal(i_(str,lang = "es"), "idioma")
  expect_equal(i_(str,lang = "pt"), "língua")
  expect_equal(i_(str,lang = "de"), "Sprache")
  expect_equal(i_(str,lang = "fr"), "la langue")
  expect_equal(i_(str,lang = "ru"), "язык")


  l <- i18nLoad()$en
  localeString <- "common.language"
  strs <- strsplit(localeString,".",fixed = TRUE)[[1]]
  expect_equal(selectInList(l,strs), c("common", "language"))


  localeDir <- system.file("examples/locale",package = "shi18ny")
  opts <- list(
    localeDir = localeDir,
    availableLangs = c("en","es")
  )
  config <- i18nConfig(opts)
  i18n <- i18nLoad(opts)
  expect_true(all(opts$availableLans %in% names(i18n)))

  opts <- list(
    localeDir = localeDir,
    availableLangs = c("pt","es")
  )
  config <- i18nConfig(opts)
  expect_error(i18nLoad(opts),"Requested languages not in locale folder")
})


