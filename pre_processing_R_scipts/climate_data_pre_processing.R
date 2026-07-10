library(readr)
library(dplyr)
library(lubridate)

daily_climate_data <- read_csv("raw-data/daily_climate_data.csv",skip = 11)
View(daily_climate_data)


names(daily_climate_data) <- c(
  "Year",
  "Month",
  "Day",
  "Temperature",
  "Rainfall",
  "Relative_Humidity"
)
head(daily_climate_data)



weekly_climate <- daily_climate_data |>
  mutate(
    Date = make_date(Year, Month, Day),
    Week = floor_date(Date, unit = "week", week_start = 1)  # Monday as start of week
  ) |>
  group_by(Week) |>
  summarise(
    Temperature = mean(Temperature, na.rm = TRUE),
    Rainfall = sum(Rainfall, na.rm = TRUE),              # weekly total rainfall
    Relative_Humidity = mean(Relative_Humidity, na.rm = TRUE),
    .groups = "drop"
  )

weekly_climate
View(weekly_climate)



weekly_climate <- weekly_climate[-c(1,158),]

weekly_climate <- weekly_climate |>
  rename(Start_Date = Week) |>
  mutate(
    Week = isoweek(Start_Date)
  )

weekly_climate
View(weekly_climate)



write_csv(weekly_climate, "data/weekly_climate.csv")
