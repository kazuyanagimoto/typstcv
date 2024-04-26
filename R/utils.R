#' Data Column Formatter
#'
#' @param data Data frame for resume entry
#' @param start Start date column name. Default is "start"
#' @param end End date column name. Default is "end"
#' @param sep Separator between start and end date. Default is "-"
#' @param format Date format. Default is "%M %Y"
#' @param colname_date Name for the generated date column. Default is "date"
#' @param replace_na Value to replace NA values. Default is "Present"
#' @param sort_by Sort by "none", "start" or "end". Default is "none"
#' @param decreasing Sort in decreasing order. Default is TRUE
#'
#' @return Data frame with formatted date column
#' @export
#'
#' @examples
#' work |>
#'   format_date(format = "%Y", sort_by = "start") |>
#'   resume_entry()
#'
format_date <- function(data, start = "start", end = "end", sep = "-",
                        format = "%M %Y",
                        colname_date = "date",
                        replace_na = "Present",
                        sort_by = "none",
                        decreasing = TRUE) {
  data[[start]] <- format(data[[start]], format)
  data[[end]] <- format(data[[end]], format)

  # Replace NA values
  data[[start]][is.na(data[[start]])] <- replace_na
  data[[end]][is.na(data[[end]])] <- replace_na

  # Create date column
  data[[colname_date]] <- paste(data[[start]], data[[end]], sep = sep)

  # Sort
  if (sort_by == "start") {
    data <- data[order(data[[start]], decreasing = decreasing), ]
  } else if (sort_by == "end") {
    data <- data[order(data[[end]], decreasing = decreasing), ]
  }

  return(data)
}
