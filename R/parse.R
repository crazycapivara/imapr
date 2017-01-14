parse_header <- function(data){
  data <- stringr::str_trim(data)
  data_splitted <- readLines(textConnection(data)) %>% stringr::str_split(":", 2)
  res <- list()
  for(item in data_splitted){
    res[item[1]] <-item[2]
  }
  res
}
