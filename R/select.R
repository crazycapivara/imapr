#' SELECT
#'
#' Select mailbox/folder.
#'
#' @param imap imap object
#' @param folder mailbox/folder name
#'
#' @return updated imap object
#' @export
#'
#' @examples
#' imap <- IMAP("imaps://imap.gmail.com") %>% SELECT("INBOX")
#'
SELECT <- function(imap, folder){
  imap$path <- escape_url_(folder)
  imap
}
