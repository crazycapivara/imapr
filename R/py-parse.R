#' Parse email header.
#'
#' Parses email header using python.
#'
#' @param filename filename of raw message
#'
#' @return list with (to, from, date, subject)
#' @export
#'
#' @examples \dontrun{
#'    imap <- IMAP("server") %>% user("uid", "pwd") %>%
#'       SELECT("INBOX")
#'    imap %>% FETCH(1) %>% execute(tempfile()) %>%
#'       py_parse_header()
#' }
#'
py_parse_header <- function(filename){
  py_parse(filename, "--header")
  #get_python_script_name("parser.py") %>%
  #  exec_python_script(c(filename, "--header"))
}

### TODO: add parameter to delete filename if wanted
###       export func
py_parse <- function(filename, argv = NULL){
  get_python_script_name("parser.py") %>%
    exec_python_script(c(filename, argv))
}
