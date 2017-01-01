context("imap")

test_that("init", {
  # when
  host <- "imaps://imap.gmail.com"
  imap <- IMAP(host)
  # then
  expect_equal(imap$url, host)
  expect_equal(imap$path, "")
})
