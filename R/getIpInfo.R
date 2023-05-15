#' Checks the provided IP address (both v4 & v6 formats) and returns all available information.

#' @param ip The IP address you want to query
#' @param language An ISO Alpha 2 Language Code for localizing the IP data
#' @param hostname If the hostname parameter is set to 1, the API response will contain the hostname of the IP

#' @return Returns all available information about an IP address.
#' @export


get_ip_info <- function(ip = NULL, language = NULL, hostname = NULL) {

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
  api_url <- "https://api.ipbase.com/v2/info"

  # generate query
  params <- list(apikey = apikey)

  # append params to query if not null

  if(!is.null(ip)) {
    params['ip'] <- ip
  }

  if(!is.null(language)) {
    params['language'] <- language
  }

  if(!is.null(hostname)) {
    params['hostname'] <- hostname
  }

  # make the API request
  response <- httr::GET(api_url, query = params)

  # check if the request was successful
  data <- success_check(response)

  data <- jsonlite::fromJSON(httr::content(response, as = 'text' ,type = 'application/json', encoding="UTF-8"), flatten = TRUE)

  # return the result
  return(data)
}
