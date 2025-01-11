source("functions.R")
#### Create Dataframe ----

N = 100
df <- data.frame(
  subject_id = 1:N,
  age = sample(18:65, N, TRUE),
  gender = factor(sample(c("Man", "Woman"), N, TRUE)),
  meanRT = runif(N, 200, 6000),
  depression = rnorm(N, 55, 15),
  mean_SleepHours = runif(N, 2, 12)
)

View(df)
save(df, file = "dfAnalysis.rdata")

summarize_f(df, 5, 87)

