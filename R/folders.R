LIST <- imap_ls <- function(imap){
  imap$handle %>% curl::handle_setopt(customrequest = NULL)
  imap
}
