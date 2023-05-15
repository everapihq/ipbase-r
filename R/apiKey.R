
#' Ipbase API Key
#'
#' \href{https://ipbase.com}{ipbase.com} requires authentication via an API key. For this package, the API key is saved as a
#' environmental variable. In interactive mode, using \code{ipbase_api_key}
#' will require you to enter an API key. Alternatively, you can also use
#' \code{Sys.setenv(IPBASE_API_KEY = <key>)} to set the API key manually.
#'
#' @param force If \code{TRUE}, resets the API key & requires the user to provide a new API key. If \code{FALSE} and an API key
#' already exists, the key will be printed to the console. If no key exists,
#' you will be required to enter a key.
#' \code{force}. Defaults to \code{FALSE}.
#' @return Returns the set API key that has been stored as an enviroment variable.
#' @export
ipbase_api_key <- function(force = FALSE) {

  env <- Sys.getenv("IPBASE_API_KEY")
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set environment variable IPBASE_API_KEY to your ipbase API key",
         call. = FALSE
    )
    message("Use `Sys.setenv(IPBASE_API_KEY = <key>)`")
  }

  message("Could not find environment variable IPBASE_API_KEY")
  message("Please enter your API key and press enter:")

  key <- readline(": ")

  if (identical(key, "")) {
    Sys.unsetenv("IPBASE_API_KEY")
    stop("API key entry failed", call. = FALSE)
  }

  message("Updating IPBASE_API_KEY")
  Sys.setenv(IPBASE_API_KEY = key)

  return(key)
}
