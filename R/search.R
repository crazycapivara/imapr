build_search <- function(){
  print("Not implemented yet!")
}

#' SEARCH
#'
#' Search mailbox for messages matching criteria.
#'
#' @param imap imap object
#' @param criteria search criteria like 'ALL', 'UNSEEN', 'FROM "stefan"'
#'    et cetera
#'
#' @return updated imap object
#' @export
#'
#' @examples \dontrun{
#'    # with 'imap' as an imap object ...
#'    response <- imap %>%
#'       SEARCH("UNSEEN") %>% execute()
#' }
SEARCH <- function(imap, criteria = "ALL"){
  imap$options %<>% c(customrequest = paste("SEARCH", criteria))
  imap
}

SEARCH_FROM <- function(imap, from){
  criteria <- sprintf('FROM "%s"', from)
  SEARCH(imap, criteria)
}
