#' List message sections.
#'
#' @param select only return selected section
#'
#' @return list of all sections OR selected section
#' @export
#'
#' @seealso \code{\link{FETCH}}
#'
#' @examples
#' # show all (available) sections
#' sections()
#'
#' # select section
#' sections("header_min")
#'
sections <- function(select = NULL){
  sections_ <- list(
    all = "",
    header = "HEADER",
    header_min = "HEADER.FIELDS%20(DATE%20FROM%20TO%20SUBJECT)",
    body = "TEXT"
  )
  if(!is.null(select)){
    return(sections_[[select]])
  }
  sections_
}
