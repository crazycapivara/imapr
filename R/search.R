build_search <- function(){
  print("Not implemented yet!")
}

#' SEARCH
#'
#' Search mailbox for messages matching request.
#'
#' @param imap imap object
#' @param request search request like 'ALL', 'UNSEEN', ...
#'
#' @return updated imap object
#' @export
#'
#' @examples \dontrun{
#'    # with 'imap' as an imap object ...
#'    response <- imap %>%
#'       SEARCH("UNSEEN") %>% execute()
#' }
SEARCH <- function(imap, request = "ALL"){
  curl::handle_setopt(
    imap$handle, customrequest = paste("SEARCH", request))
  imap
}

SEARCH_FROM <- function(imap, from){
  request <- sprintf('FROM "%s"', from)
  SEARCH(imap, request)
}
