#' LIST
#'
#' List folder.
#'
#' @param imap imap object
#' @param folder mailbox name (empty name lists root folder)
#'
#' @return updated imap object
#' @export
#'
#' @examples \dontrun{
#'    # with 'imap' as an imap object ...
#'    response <- imap %>% LIST() %>% execute()
#' }
#'
LIST <- function(imap, folder = ""){
  SELECT(imap, folder)
}
