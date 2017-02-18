#' Execute imap request.
#'
#' @param imap imap object
#' @param filename if given, response will be written to disk
#' @param ... optional parameters passed to curl,
#'  see \code{\link[curl]{curl_options}}
#'
#' @return content OR filename
#' @export
#'
#' @examples \dontrun{
#'    imap <- IMAP("imaps://imap.gmail.com") %>%
#'       user("name", "pwd")
#'
#'    imap %>% LIST() %>% execute() %>% cat()
#'
#'    filename <- imap %>% SELECT("INBOX") %>%
#'       FETCH(1) %>% execute(tempfile())
#'
#'    imap %>% LIST("INBOX") %>%
#'       execute(ssl_verifypeer = FALSE)
#' }
#'
execute <- function(imap, filename = NULL, ...){
  imap$options %<>% c(list(...))
  url <- paste0(imap$url, "/", imap$path)
  handle = curl::new_handle()
  curl::handle_setopt(handle, .list = imap$options)
  if(!is.null(filename)){
    filename <- curl::curl_download(url, filename, handle = handle)
    return(filename)
  }
  response <- curl::curl_fetch_memory(url, handle = handle)
  data <- rawToChar(response$content)
  attr(data, "url") <- response$url
  data
}
