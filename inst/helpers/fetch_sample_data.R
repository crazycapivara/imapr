host <- "imaps://imap.gmail.com"

save_response <- function(x, filename){
  saveRDS(x, filename)
  sprintf("response saved to %s\n", filename) %>% cat()
}

fetch_sample_data <- function(username, password){
  imap <- IMAP(host) %>% user(username, password)

  imap %>% LIST() %>%
    execute() %>% save_response("tmp/data/response-list.rds")

  imap %>% SELECT("INBOX") %>% SEARCH("ALL") %>%
    execute() %>% save_response("tmp/data/response-search_all.rds")

  imap %>% SELECT("INBOX") %>% SEARCH("FROM Travis") %>%
    execute() %>% save_response("tmp/data/response-search_travis.rds")

  imap %>% SELECT("INBOX") %>% FETCH(92) %>%
    execute() %>% save_response("tmp/data/response-fetch_92.rds")
}
