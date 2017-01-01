IMAP <- function(host, path = ""){
  list(
    url = host,
    path = path,
    handle = curl::new_handle()
  )
}

user <- function(imap, username, password){
  curl::handle_setopt(imap$handle, username = username)
  curl::handle_setopt(imap$handle, password = password)
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
