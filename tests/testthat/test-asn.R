test_that("ASN info check works", {

  skip_on_cran()
  skip_on_travis()
  skip_on_appveyor()

  x <- get_asn_info("AS13335")

  expect_equal(class(x), "list")
  expect_equal(x$data$asn, "13335")

})
