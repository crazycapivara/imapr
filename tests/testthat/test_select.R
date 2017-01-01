context("SELECT")

imap <- IMAP("imaps://imap.gmail.com")

test_that("mailbox", {
  # when
  mailbox <- "[Gmail]/Gesendet"
  imap %<>% SELECT(mailbox)
  # then
  expected_path <- "%5BGmail%5D/Gesendet"
  expect_equal(imap$path, expected_path)
})
