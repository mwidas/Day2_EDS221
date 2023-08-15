# data wrangling and viz

library(tidyverse)
library(here)
library(janitor)
# read in the csv using here() function by indicating from working directory to look into "data" folder and look for specific csv
plants <- read_csv(here("data", "power_plants.csv")) %>% 
  clean_names()

alabama_plants <- plants %>% 
  filter(state_name == "Alabama")

alabama_plot <- ggplot(data = alabama_plants, aes(x = install_mw, y = total_mw)) +
  geom_point()

ggsave(filename = here("figures", "alabama_plants.jpg"))
