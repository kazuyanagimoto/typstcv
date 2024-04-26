#' Convert a data frame to a resume entry
#'
#' @param data A data frame with columns for title, location, date, and description
#' @param title The column name for the title. Default is "title"
#' @param location The column name for the location. Default is "location"
#' @param date The column name for the date. Default is "date"
#' @param description The column name for the description. Default is "description"
#'
#' @return A string with the resume entry
#' @export
#'
#' @examples
#' educ <- data.frame(
#'  title = c("Ph.D. in Physics", "Master of Science"),
#'  location = c("Zürich, Switzerland", "Zürich, Switzerland"),
#'  date = c("1905", "1896 - 1900"),
#'  description = c("University of Zürich", "ETH")
#' )
#'
#' resume_entry(educ)
#'
resume_entry <- function(data,
                         title = "title",
                         location = "location",
                         date = "date",
                         description = "description") {
  strings <- apply(data, 1, function(row) {
    s <- "#resume-entry("
    if (!is.na(row[title])) {
      s <- sprintf("%stitle: \"%s\",", s, row[title])
    }
    if (!is.na(row[location])) {
      s <- sprintf("%slocation: \"%s\",", s, row[location])
    }
    if (!is.na(row[date])) {
      s <- sprintf("%sdate: \"%s\",", s, row[date])
    }
    if (!is.na(row[description])) {
      s <- sprintf("%sdescription: \"%s\",", s, row[description])
    }
    s <- paste0(s, ")")
    return(s)
  })

  cat(paste0("```{=typst}\n", paste(strings, collapse = "\n"), "\n```"))
}