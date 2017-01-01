execute <- function(imap){
  url <- paste0(imap$url, "/", imap$path)
  response <- curl::curl_fetch_memory(url, imap$handle)
  list(
    url = response$url,
    content = rawToChar(response$content),
    headers = rawToChar(response$header)
    #  (response$headers %>% rawToChar() %>%
    #     textConnection() %>%  readLines())
  )
}
