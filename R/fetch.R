header_request <- "SECTION=HEADER.FIELDS%20(DATE%20FROM%20TO%20SUBJECT)"

# check msg_id vs msg_uid, usually there is a difference,
# curls seems to use uid as is?!
FETCH_HEADER <- function(imap, msg_uid){
  imap$fetch <- sprintf("UID=%i;%s", msg_uid, header_request)
  imap
}
