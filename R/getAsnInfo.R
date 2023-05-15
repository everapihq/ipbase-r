#' Retrieves information for a specific ASN (autonomous system number).

#' @param asn (required) The ASN you want to query
#' @return Returns all available information about an ASN.
#' @export


get_asn_info <- function(asn = NULL) {

  # check for API key or ask for API key
  apikey <- ipbase_api_key()

  # ensure necessary packages are installed
  if (!requireNamespace("httr", quietly = TRUE)) {
    stop("Please install the 'httr' package to use this function.")
  }
  if (!requireNamespace("jsonlite", quietly = TRUE)) {
    stop("Please install the 'jsonlite' package to use this function.")
  }

  # define the API URL
  api_url <- "https://api.ipbase.com/v2/asns"

  # generate query
  params <- list(apikey = apikey, asn = asn)

  # make the API request
  response <- httr::GET(api_url, query = params)

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)

  # return the result
  return(data)
}
