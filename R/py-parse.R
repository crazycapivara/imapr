py_parse_header <- function(filename){
  script_name <- system.file("python/mailparser.py", package = "imapr")
  exec_python(c(script_name, filename))
}

py_parse_body <- function(filename){
  script_name <- system.file("python/bodyparser.py", package = "imapr")
  system2("python3", c(script_name, filename), stdout = TRUE) %>%
    jsonlite::fromJSON()
}
