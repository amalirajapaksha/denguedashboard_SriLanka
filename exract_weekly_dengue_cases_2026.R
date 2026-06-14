library(denguedatahub)
library(readr)
library(here)

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
data2026 <- data2026[-(1:26), ]

head(data2026)
nrow(data2026)

# Save as CSV
readr::write_csv(
  data2026,
  here("data","sri_lanka_weekly_dengue_cases_2026.csv")
)

