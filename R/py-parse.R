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
  get_python_script_name("mailparser.py") %>%
    exec_python_script(filename)
}

py_parse_body <- function(filename){
  get_python_script_name("bodyparser.py") %>%
    exec_python_script(filename)
}
