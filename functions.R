#### Descriptive statistics function ----
summarize_f <- function(df, subject_start, subject_end) {
  # filter data to only chosen subjects
  df <- df[df$subject_id >= subject_start & df$subject_id <= subject_end, ]
  # store results
  results_list <- list()
  if (nrow(df) < 10) {
    stop("Data is too short")
  }
  # loop for all variables
  for (var in names(df)) {
    # ignore subject_id
    if (var == "subject_id") {
      next
    }
    # numeric variable
    if (class(df[[var]]) %in% c("numeric", "integer")) {
      descriptive_num <- data.frame(
        variable = var,
        type = "Numeric",
        mean = mean(df[[var]]),
        SD = sd(df[[var]]),
        min = min(df[[var]]),
        max = max(df[[var]]),
        level = NA,
        count = NA
      )
      results_list[[var]] <- descriptive_num
    }
    else if (class(df[[var]]) %in% c("factor", "character")) {
      descriptive_cat <- as.data.frame(table(df[[var]]))
      colnames(descriptive_cat) <- c("level", "count")
      descriptive_cat$variable = var
      descriptive_cat$type = "Categorical"
      descriptive_cat$mean = NA
      descriptive_cat$SD = NA
      descriptive_cat$min = NA
      descriptive_cat$max = NA
      results_list[[var]] <- descriptive_cat
      }
  }
  # combine into dataframe and return it
  results <- do.call(rbind, lapply(results_list, as.data.frame))
  View(results)
  return(results)
  }

