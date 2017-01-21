set_options <- function(imap, ...){
  cat("NOT implemented yet!")
}

exec_python <- function(argv){
  cmd <- get_python_cmd()
  system2(cmd, argv, stdout = TRUE) %>%
    jsonlite::fromJSON()
}
