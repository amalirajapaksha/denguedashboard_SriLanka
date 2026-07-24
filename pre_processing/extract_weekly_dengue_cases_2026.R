library(denguedatahub)
library(readr)
library(here)
library(readxl)

download_pdfwer_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", folder.name="dengue", volume.number="Vol_53")


link2026 <- get_pdflinks_srilanka(url="https://www.epid.gov.lk/weekly-epidemiological-report/weekly-epidemiological-report", volume.number="Vol_53")
head(link2026)

link2026[[1]][1]

link2026[[2]][1]


options(timeout = 300)
data2026 <- convert_slwer_to_tidy(year=2026, 
                                  reports.url=link2026, 
                                  start.date.first = "2025-12-20",
                                  end.date.first = "2025-12-26",
                                  start.date.last = "2026-05-11", 
                                  end.date.last = "2026-05-17",
                                  week.no=c(52,1:20))

head(data2026)
View(data2026)

readr::write_csv(data2026, here("raw-data","data2026.csv"))

data2026 <- read_csv(here("raw-data","data2026.csv"))

data2026$district <- dplyr::recode(data2026$district, 
                                         Hambantota = "Hambanthota")
bb <- unique(data2026$district) == unique(denguedatahub::srilanka_weekly_data$district)
table(bb)
data2026$year <- as.numeric(data2026$year)
data2026$week <- as.numeric(data2026$week)
data2026$start.date <- as.Date(data2026$start.date)
data2026$end.date <- as.Date(data2026$end.date)
data2026$district <- as.character(data2026$district)
data2026$cases <- as.numeric(data2026$cases)


# Remove first 7 rows
data2026 <- data2026[-(1:19), ]

head(data2026)
nrow(data2026)

data2026$cases[182:207] <- c(347,219,78,47,27,13,109,15,40,24,9,1,5,2,25,12,16,16,25,26,15,17,20,13,101,47,18)
data2026$cases[210:233] <- c(68,56,16,6,98,38,83,36,1,2,5,2,49,12,13,30,30,27,4,20,16,93,35,25)


# Combine week 21-26 data

latest_2026_data <- read_excel(here("raw-data","2026_21-26_weekly_data.xlsx"))

latest_2026_data$year <- as.numeric(latest_2026_data$year)
latest_2026_data$week <- as.numeric(latest_2026_data$week)
latest_2026_data$start.date <- as.Date(latest_2026_data$start.date)
latest_2026_data$end.date <- as.Date(latest_2026_data$end.date)
latest_2026_data$district <- as.character(latest_2026_data$district)
latest_2026_data$cases <- as.numeric(latest_2026_data$cases)


combined_2026_data <- rbind(data2026, latest_2026_data)

# Save as CSV
readr::write_csv(
  combined_2026_data,
  here("data","sri_lanka_weekly_dengue_cases_2026.csv")
)



# Combine week 27-29 data

week29_2026_data <- read_excel(here("raw-data","2026_27-29_weekly_data.xlsx"))

week29_2026_data$year <- as.numeric(week29_2026_data$year)
week29_2026_data$week <- as.numeric(week29_2026_data$week)
week29_2026_data$start.date <- as.Date(week29_2026_data$start.date)
week29_2026_data$end.date <- as.Date(week29_2026_data$end.date)
week29_2026_data$district <- as.character(week29_2026_data$district)
week29_2026_data$cases <- as.numeric(week29_2026_data$cases)

week_29_combined_2026_data <- rbind(combined_2026_data, week29_2026_data)

# Save as CSV
readr::write_csv(
  week_29_combined_2026_data,
  here("data","sri_lanka_weekly_dengue_cases_2026.csv")
)

