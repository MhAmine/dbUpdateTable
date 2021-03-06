#' Infix to format strings via named paramters
#'
#' @param fmt A string to format
#' @param list A list of named parameters
#'
#' @examples
#' parameters <- list(label = "months", april = 4, may = 5, june = 6)
#' "%(label)s: %(april)d %(may)d %(june)d" %format% parameters
#'
#' @export

`%format%` <- function(fmt, list) {
  pat <- "%\\(([^)]*)\\)"
  pat2 <- "(?<=%\\()([^)]*)(?=\\))"
  fmt2 <- gsub(pat, "%", fmt)
  list2 <- list[stringr::str_extract_all(fmt, pat2)[[1]]]
  do.call("sprintf", c(fmt2, list2))
}
