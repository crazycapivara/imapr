header_request <- "SECTION=HEADER.FIELDS%20(DATE%20FROM%20TO%20SUBJECT)"

FETCH_ <- function(imap, msg_uid, section = "HEADER"){
  section <- gsub(" ", "%20", section)
  #imap$fetch <- sprintf("UID=%i;SECTION=%s", msg_uid, section)
  imap$fetch <- sprintf("UID=%i", msg_uid)
  imap
}

# check msg_id vs msg_uid, usually there is a difference,
# curls seems to use uid as is?!
FETCH_HEADER <- function(imap, msg_uid){
  imap$fetch <- sprintf("UID=%i;%s", msg_uid, header_request)
  imap
}

FETCH <- function(imap, msg_id, section = "HEADER"){
  imap$path %<>% paste0(";UID=", msg_id)
  imap
}
