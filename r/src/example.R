#' Add two numbers
#'
#' @param a A number.
#' @param b A number.
#' @return The sum of a and b.
add <- function(a, b) {
  a + b
}

#' Normalize a name
#'
#' Strips leading and trailing whitespace, then converts to title case.
#' Raises an error if the result is an empty string.
#'
#' @param name A character string.
#' @return The normalized name.
#' @examples
#' normalize_name("alice")   # "Alice"
#' normalize_name(" bob ")   # "Bob"
normalize_name <- function(name) {
  name <- trimws(name)
  if (nchar(name) == 0) {
    stop("Name cannot be empty")
  }
  gsub("(^|\\s)(\\w)", "\\1\\U\\2", tolower(name), perl = TRUE)
}
