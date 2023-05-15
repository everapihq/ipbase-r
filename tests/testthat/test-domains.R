test_that("Domain info check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_domain_info("0.0.0.0")

  expect_equal(class(x), "list")
  expect_equal(class(x$data), "character")

})
