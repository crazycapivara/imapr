% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imap.R
\name{IMAP}
\alias{IMAP}
\title{IMAP}
\usage{
IMAP(host, path = "", options_ = list())
}
\arguments{
\item{host}{url (and port, if non-standard one)
of imap server}

\item{path}{mailbox name}

\item{options_}{curl options passed to handle}
}
\value{
imap object
}
\description{
Create an imap object.
}
\examples{
host <- "imaps://imap.gmail.com:993"
mailbox <- "INBOX"
imap <- IMAP(host, mailbox)

}

