imapr - An R Interface to IMAP
================

imapr performs IMAP queries via curl.

Installation
------------

``` r
require("devtools")

install_github("crazycapivara/imapr")
```

Usage
-----

``` r
library(imapr)

host <- "imaps://imap.gmail.com"

imap <- IMAP(host) %>% user("your_username", "your_password")
imap
```

    ## $url
    ## [1] "imaps://imap.gmail.com"
    ## 
    ## $path
    ## [1] ""
    ## 
    ## $handle
    ## <curl handle> (empty)
    ## 
    ## attr(,"class")
    ## [1] "imap"

``` r
response <- imap %>% LIST() %>% execute()
```

``` r
response$content %>% cat()
```

    ## * LIST (\HasNoChildren) "/" "INBOX"
    ## * LIST (\HasChildren \Noselect) "/" "[Gmail]"
    ## * LIST (\All \HasNoChildren) "/" "[Gmail]/Alle Nachrichten"
    ## * LIST (\Drafts \HasNoChildren) "/" "[Gmail]/Entw&APw-rfe"
    ## * LIST (\HasNoChildren \Sent) "/" "[Gmail]/Gesendet"
    ## * LIST (\Flagged \HasNoChildren) "/" "[Gmail]/Markiert"
    ## * LIST (\HasNoChildren \Trash) "/" "[Gmail]/Papierkorb"
    ## * LIST (\HasNoChildren \Junk) "/" "[Gmail]/Spam"
    ## * LIST (\HasNoChildren \Important) "/" "[Gmail]/Wichtig"

``` r
#devtools::test()
## To be continued ##
```
