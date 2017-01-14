host <- "imaps://imap.gmail.com"

save_response <- function(x, filename){
  saveRDS(x, filename)
  sprintf("response saved to %s", filename)
}

fetch_sample_data <- function(username, password){
  imap <- IMAP(host) %>% user(username, password)
  imap %>% SELECT("INBOX") %>% SEARCH("ALL") %>%
    execute() %>% save_response("tmp/data/response-search_all.rds")
}
