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

### List and select mailboxes

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
imap %>% SELECT("INBOX")
```

    ## $url
    ## [1] "imaps://imap.gmail.com"
    ## 
    ## $path
    ## [1] "INBOX"
    ## 
    ## $handle
    ## <curl handle> (empty)
    ## 
    ## attr(,"class")
    ## [1] "imap"

### Search for messages

``` r
search_all <- imap %>% SELECT("INBOX")
   %>% SEARCH("ALL") %>% execute() 
```

``` r
search_all$url
```

    ## [1] "imaps://imap.gmail.com/INBOX"

``` r
search_all$content %>% substr(1, 20)
```

    ## [1] "* SEARCH 1 2 3 4 5 6"

``` r
## To be continued ##
```

Run tests
---------

``` r
devtools::test(reporter = "tap")
```

    ## Loading imapr

    ## Loading required package: testthat

    ## Testing imapr

    ## 1..3
    ## # Context imap
    ## ok 1 init
    ## ok 2 init
    ## # Context SELECT
    ## ok 3 escape mailbox name with brackets
