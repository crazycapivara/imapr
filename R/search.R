build_search <- function(){
  print("Not implemented yet!")
}

SEARCH <- imap_search <- function(imap, request = "ALL"){
  curl::handle_setopt(
    imap$handle, customrequest = paste("SEARCH", request))
  imap
}

SEARCH_FROM <- function(imap, from){
  request <- sprintf('FROM "%s"', from)
  SEARCH(imap, request)
}
