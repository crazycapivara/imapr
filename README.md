imapr - An R Interface to IMAP
================

`imapr` performs IMAP queries via curl.

Builds
------

**master**

[![Travis-CI Build Status](https://travis-ci.org/crazycapivara/imapr.svg?branch=master)](https://travis-ci.org/crazycapivara/imapr)

**develop**

[![Travis-CI Build Status](https://travis-ci.org/crazycapivara/imapr.svg?branch=develop)](https://travis-ci.org/crazycapivara/imapr)

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
imap[c("url", "path")]
```

    ## $url
    ## [1] "imaps://imap.gmail.com"
    ## 
    ## $path
    ## [1] ""

### List and select mailboxes

``` r
response <- imap %>% LIST() %>% execute()
```

``` r
response %>% cat()
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
imap %>% SELECT("INBOX") %>% .[c("url", "path")]
```

    ## $url
    ## [1] "imaps://imap.gmail.com"
    ## 
    ## $path
    ## [1] "INBOX"

### Search for messages

``` r
search_all <- imap %>% SELECT("INBOX")
   %>% SEARCH("ALL") %>% execute() 
```

``` r
#search_all$url
search_all %>% substr(1, 20)
```

    ## [1] "* SEARCH 1 2 3 4 5 6"
    ## attr(,"url")
    ## [1] "imaps://imap.gmail.com/INBOX"

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

    ## 1..5
    ## # Context imap
    ## ok 1 init
    ## ok 2 init
    ## # Context SEARCH
    ## ok 3 by flags
    ## ok 4 by flags
    ## # Context SELECT
    ## ok 5 escape mailbox name with brackets
