SELECT <- imap_select <- function(imap, folder){
  #imap$path <- curl_escape(folder) %>% gsub("%2F", "/", .)
  imap$path <- escape_url_(folder)
  imap
}
