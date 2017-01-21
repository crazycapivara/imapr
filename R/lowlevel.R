# REMOVE!?
set_options <- function(imap, ...){
  cat("NOT implemented yet!")
}

get_python_script_name <- function(script_name){
  sprintf("python/%s", script_name) %>%
    system.file(package = "imapr")
}

exec_python_script <- function(script_name, argv){
  cmd <- get_python_cmd()
  system2(cmd, c(script_name, argv), stdout = TRUE) %>%
    jsonlite::fromJSON()
}
