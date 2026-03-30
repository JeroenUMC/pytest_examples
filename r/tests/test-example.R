test_that("add returns the sum of two numbers", {
  expect_equal(add(2, 3), 5)
})

test_that("normalize_name formats values correctly", {
  expect_equal(normalize_name("alice"), "Alice")
  expect_equal(normalize_name(" bob "), "Bob")
})

test_that("normalize_name rejects empty strings", {
  expect_error(normalize_name(""), "Name cannot be empty")
})
