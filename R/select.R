#' SELECT
#'
#' Select mailbox.
#'
#' @param imap imap object
#' @param folder mailbox name
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
