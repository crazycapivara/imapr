py_parse_header <- function(filename){
  get_python_script_name("mailparser.py") %>%
    exec_python_script(filename)
}

py_parse_body <- function(filename){
  get_python_script_name("bodyparser.py") %>%
    exec_python_script(filename)
}
