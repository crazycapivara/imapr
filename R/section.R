#' List section options.
#'
#' @return list of section options
#' @export
#'
#' @seealso \code{\link{FETCH}}
#'
#' @examples
#' sections()$header_min
sections <- function(){
  list(
    all = "",
    header = "HEADER",
    header_min = "HEADER.FIELDS%20(DATE%20FROM%20TO%20SUBJECT)",
    body = "TEXT"
  )
}
