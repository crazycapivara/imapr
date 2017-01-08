host <- "imaps://imap.gmail.com"

fetch_sample_data <- function(username, password){
  imap <- IMAP(host) %>% user(username, password)
  imap %>% SELECT("INBOX") %>% FETCH(1) %>% execute()
}
