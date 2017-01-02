#' IMAP
#'
#' Create an imap object.
#'
#' @param host url (and port, if non-standard one)
#'    of imap server
#' @param path mailbox name
#'
#' @return imap object
#' @export
#'
#' @examples
#' host <- "imaps://imap.gmail.com:993"
#' mailbox <- "INBOX"
#' imap <- IMAP(host, mailbox)
#'
IMAP <- function(host, path = "", options_ = list()){
  imap <- list(
    url = host,
    path = path,
    options = options_
  )
  class(imap) <- "imap"
  imap
}

#' user
#'
#' Set username and password needed to log in to imap server.
#'
#' @param imap imap object
#' @param username username
#' @param password password
#'
#' @return updated imap object
#' @export
#'
#' @examples
#' imap <- IMAP("imaps://imap.gmail.com") %>%
#'    user("name", "pwd")
user <- function(imap, username, password){
  imap$options$username = username
  imap$options$password = password
  imap
}

#select <- function(imap, folder){
#  imap$path <- curl_escape(folder) %>% gsub("%2F", "/", .)
#  imap
#}

# Problem with mailbox names containing spaces
examine <- function(imap, folder){
  req <- paste("EXAMINE", escape_url_(folder))
  print(req)
  curl::handle_setopt(imap$handle, customrequest = req)
  imap
}

#fetch <- function(imap){
#  url <- paste0(imap$url, "/", imap$path)
#  print(url)
#  response <- curl::curl_fetch_memory(url, imap$handle)
#  rawToChar(response$content)
#}
