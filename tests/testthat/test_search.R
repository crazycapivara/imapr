context("SEARCH")

imap <- IMAP("imaps://imap.gmail.com")

test_that("by flags", {
  # when
  mailbox <- "INBOX"
  imap %<>% SELECT(mailbox) %>% SEARCH("UNSEEN")
  # then
  expected_path <- "INBOX"
  expected_request <- "SEARCH UNSEEN"
  expect_equal(imap$path, expected_path)
  expect_equal(imap$options$customrequest, expected_request)
})
