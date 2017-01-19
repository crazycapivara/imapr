#' Execute imap request.
#'
#' @param imap imap object
#' @param filename if given, response will be written to disk
#' @param ... optional parameters passed to curl
#'    like \code{ssl_verifypeer = FALSE}
#'    (see code{\link[curl]{curl_options}})
#'
#' @return list containing url of request
#'    and content OR filename
#' @export
#'
#' @examples \dontrun{
#'    imap <- IMAP("imaps://imap.gmail.com") %>%
#'       user("name", "pwd")
#'    response <- imap %>% LIST() %>% execute()
#'    cat(response$content)
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
  #list(
  #  url = response$url,
  #  content = rawToChar(response$content)
  #)
  data <- rawToChar(response$content)
  attr(data, "url") <- response$url
  data
}
