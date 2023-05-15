test_that("IP info check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_ip_info()

  expect_equal(class(x), "list")
  expect_equal(class(x$data$ip), "character")
})
