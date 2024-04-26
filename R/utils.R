#' Data Column Formatter
#'
#' @param data Data frame for resume entry
#' @param start Start date column name. Default is "start"
#' @param end Optional. End date column name.
#' @param sep Separator between start and end date. Default is " - "
#' @param date_format Date format. Default is "%B %Y"
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
#'   format_date(end = "end", date_format = "%Y", sort_by = "start") |>
#'   resume_entry()
#'

format_date <- function(data,
                        start = "start",
                        end = NULL,
                        sep = " - ",
                        date_format = "%b %Y",
                        colname_date = "date",
                        replace_na = "Present",
                        sort_by = "none",
                        decreasing = TRUE) {

  data[[start]] <- format(data[[start]], date_format)
  data[[start]][is.na(data[[start]])] <- replace_na

  # Create date column
  if (is.null(end)) {
    data[[colname_date]] <- data[[start]]
  } else {
    data[[end]] <- format(data[[end]], date_format)
    data[[end]][is.na(data[[end]])] <- replace_na
    data[[colname_date]] <- paste(data[[start]], data[[end]], sep = sep)
  }

  # Sort
  if (sort_by == "start") {
    data <- data[order(data[[start]], decreasing = decreasing), ]
  } else if (sort_by == "end" && !is.null(end)) {
    data <- data[order(data[[end]], decreasing = decreasing), ]
  } else if (sort_by == "none") {
    # Do nothing
  } else {
    stop("Invalid sort_by value. Use 'none', 'start' or 'end'")
  }

  return(data)
}
