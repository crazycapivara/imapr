#' execute
#'
#' execute request
#'
#' @param imap imap object
#'
#' @return response (list containing url, content and headers)
#' @export
#'
#' @examples \dontrun{
#'    imap <- IMAP("imaps://imap.gmail.com") %>%
#'       user("name", "pwd")
#'    response <- imap %>% LIST() %>% execute()
#'    cat(response$content)
#' }
execute <- function(imap){
  url <- paste0(imap$url, "/", imap$path)
  response <- curl::curl_fetch_memory(url, imap$handle)
  list(
    url = response$url,
    content = rawToChar(response$content),
    headers = rawToChar(response$header)
  )
}
