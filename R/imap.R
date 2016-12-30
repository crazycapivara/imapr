IMAP <- function(host){
  list(
    host = host,
    handle = curl::new_handle()
  )
}

user <- function(imap, username, password){
  curl::handle_setopt(imap$handle, username = username)
  curl::handle_setopt(imap$handle, password = password)
  imap
}

fetch <- function(imap){
  response <- curl::curl_fetch_memory(imap$host, imap$handle)
  rawToChar(response$content)
}
