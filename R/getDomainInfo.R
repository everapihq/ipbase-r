#' Retrieves all domains hosted on a single IP address
#' @param ip (required) The IP you want to query the domains for
#' @param page The page for iterating through all domains
#' @param limit The amount of domains you want to see on each page
#' @return Retrieves all domains hosted on a single IP address
#' @export


get_domain_info <- function(ip = NULL, page = NULL, limit = NULL) {

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
  api_url <- "https://api.ipbase.com/v2/domains"

  # generate query
  params <- list(apikey = apikey, ip = ip)

  # append params to query if not null

  if(!is.null(page)) {
    params['page'] <- page
  }

  if(!is.null(limit)) {
    params['limit'] <- limit
  }

  # make the API request
  response <- httr::GET(api_url, query = params)

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)

  # return the result
  return(data)
}
