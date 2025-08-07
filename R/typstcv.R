#' Convert a data frame to a resume entry
#'
#' @param data A data frame with columns for title, location, date, and description
#' @param title The column name for the title. Default is "title"
#' @param location The column name for the location. Default is "location"
#' @param date The column name for the date. Default is "date"
#' @param description The column name for the description. Default is "description"
#' @param details The column name for additional details. Default is NULL
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
#' # With details
#' award <- data.frame(
#'  title = c("Nobel Prize in Physics"),
#'  location = c("Stockholm, Sweden"),
#'  date = c("1921"),
#'  description = c("For his services to"),
#'  detail1 = c("Theoretical Physics"),
#'  detail2 = c("Discovery of the law of the photoelectric effect")
#' )
#'
#' resume_entry(award, details = c("detail1", "detail2"))
#'
resume_entry <- function(
  data,
  title = "title",
  location = "location",
  date = "date",
  description = "description",
  details = NULL
) {
  strings <- apply(data, 1, function(row) {
    s <- "#resume-entry("
    if (!is.na(row[title])) {
      s <- sprintf("%stitle: [%s],", s, row[title])
    }
    if (!is.na(row[location])) {
      s <- sprintf("%slocation: [%s],", s, row[location])
    }
    if (!is.na(row[date])) {
      s <- sprintf("%sdate: [%s],", s, row[date])
    }
    if (!is.na(row[description])) {
      s <- sprintf("%sdescription: [%s],", s, row[description])
    }
    s <- paste0(s, ")")

    if (!is.null(details)) {
      if (any(!is.na(row[details]))) {
        s <- paste0(
          s,
          "\n#resume-item[\n",
          paste0("- ", row[details][!is.na(row[details])], collapse = "\n"),
          "\n]"
        )
      }
    }

    return(s)
  })

  cat(paste0("```{=typst}\n", paste(strings, collapse = "\n"), "\n```"))
}
