#' execute
#'
#' Execute imap request.
#'
#' @param imap imap object
#' @param ... optional parameters passed to curl
#'    like \code{ssl_verifypeer = F}
#'    (see \link[curl]{curl_options})
#'
#' @return list containing url of request
#'    and content
#' @export
#'
#' @examples \dontrun{
#'    imap <- IMAP("imaps://imap.gmail.com") %>%
#'       user("name", "pwd")
#'    response <- imap %>% LIST() %>% execute()
#'    cat(response$content)
#' }
#'
execute <- function(imap, ...){
  imap$options %<>% c(list(...))
  url <- paste0(imap$url, "/", imap$path)
  handle = curl::new_handle()
  curl::handle_setopt(handle, .list = imap$options)
  response <- curl::curl_fetch_memory(url, handle = handle)
  list(
    url = response$url,
    content = rawToChar(response$content)
  )
}
