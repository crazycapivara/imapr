#' LIST
#'
#' list folders on server
#'
#' @param imap imap object
#'
#' @return updated imap object
#' @export
#'
#' @examples \dontrun{
#'    # when 'imap' is an imap object ...
#'    response <- imap %>% LIST() %>% execute()
#' }
LIST <- function(imap){
  imap$handle %>% curl::handle_setopt(customrequest = NULL)
  imap
}
