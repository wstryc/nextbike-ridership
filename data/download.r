library(readr)
library(dplyr)
library(ggplot2)

# Download files from cities website
data_03 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/30d9e087-bafd-441e-aa09-f20a11fc60f5/download/historia_przejazdow_2019-03.csv")
data_04 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/1175d9da-3ae2-4ebc-8b1c-1f13fb5bf7b0/download/historia_przejazdow_2019-04.csv")
data_05 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/a24161cc-3974-4741-9ddf-fe8663fa641b/download/historia_przejazdow_2019-05.csv")
data_06 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/4a63e438-2c73-4fe3-9599-21c319887a85/download/historia_przejazdow_2019-06.csv")
data_07 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/aa5da036-daad-480b-93c2-f1fbfda9b663/download/historia_przejazdow_2019-07.csv")
data_08 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/5812256f-d0a5-43dd-850b-b8e8d13fe557/download/historia_przejazdow_2019-08.csv")
data_09 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/673bec03-a145-46ee-a302-9eeabec53728/download/historia_przejazdow_2019-09.csv")
data_10 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/31b7a6c6-d0e1-4818-9677-f66cb4809803/download/historia_przejazdow_2019-10.csv")
data_11 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/12c60a15-43d9-4c39-88f0-0c7c9a1dbdc9/download/historia_przejazdow_2019-11.csv")
data_12 <- read_csv("https://www.wroclaw.pl/open-data/dataset/a646ce34-b24a-4f5c-8174-71dfc1bd2d0b/resource/ca84c93c-17c3-466e-b064-82ad22481721/download/historia_przejazdow_2019-12.csv")

data_2019 <- rbind(data_03, data_04, data_05, data_06, data_07, data_08, data_09, data_10, data_11, data_12)

# Season started on 23rd of March 
season_open_date = as.POSIXct("2019-03-23 00:00:00")

# Quick data cleaning
data_2019_clean <- data_2019 %>%
  select(-X1) %>%
  filter(start_time > season_open_date)

# Write for further use
write_path <- file.path(getwd(), "nextbike_2019.csv")
write_csv(data_2019_clean, write_path)
  
