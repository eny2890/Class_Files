###################################################################################
########## Microlepidopteran Metabarcoding Figures ################################
########## October 28th, 2024 #####################################################
########## Lillian Hendrick #######################################################

# load in libraries
library(dplyr)
library(ggplot2)
library(car)
library(sf)
library(maps)
library(ggspatial)

########### Figure 1 - Micromoth Abundance Across Time and Urbanization ####################

#read in and save datasheet with macro and micro moth counts
moth_abundance = read.csv("data/total_moth_abundance.csv") #MAKE SURE YOUR WORKING DIRECTORY IS THIS PROJECT FOLDER

#view data frame
moth_abundance
head(moth_abundance)

#create dataframes for each of the 9 locations
grouped_sites <- moth_abundance %>%
  group_by(location) %>%
  group_split()

#print the list of the dataframes
grouped_sites

#assign each tibble to a seperate dataframe
for (i in seq_along(grouped_sites)) {
  assign(paste0(unique(grouped_sites[[i]]$location)), grouped_sites[[i]])
}

#create a plot for one of the sites showing the micromoth abundance across time

JOMA_micro_moth_abundance <- ggplot(JOMA, aes(x = eventDate)) +
  geom_point(aes(y = microMoths)) +
  labs(
    title = "Micro Moth Abundances at JOMA",
    x = "Date",
    y = "Abundance"
  ) +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
    )
JOMA_micro_moth_abundance

ggsave("plot/JOMA_micro_moth_abundance.jpeg", JOMA_micro_moth_abundance)

#OPTIONAL ONCE WE ARE DONE: Repeat for all of the site and/or group all of the event dates into the 6 groups we 
#used when sequencing (see XXXX)

########### Figure 2 - Micromoth and Macromoth Abundance Correlation and Plot #############

# from Figure 1, we have all of our moth abundances divided by site, choose one going forward

#calculate the colinearity between the micro and macro moths
AUCA_correlation <- cor(AUCA$microMoths, AUCA$macroMoths, method = "pearson")
AUCA_correlation

#create correlation text for plot
AUCA_correlation_text <- paste("Correlation: ", round(AUCA_correlation, 2))

#create the AUCA scatterplot using ggplot2 
AUCA_Plot <- ggplot(AUCA, aes(x = eventDate)) +
  geom_point(aes(y = microMoths, color = "Set 1")) +
  geom_point(aes(y = macroMoths, color = "Set 2")) +
  geom_smooth(aes(y = microMoths, color = "Set 1"), method = "lm", se = FALSE) +
  geom_smooth(aes(y = macroMoths, color = "Set 2"), method = "lm", se = FALSE) +
  labs(
    title = "Micro and Macro Moth Abundances in Austin Cary Forest",
    x = "Date",
    y = "Abundance"
  ) +
  scale_color_manual(name = "Dataset", values = c("Set 1" = "blue", "Set 2" = "red")) +
  theme_minimal() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) +
  annotate("text", x = Inf, y = Inf, label = AUCA_correlation_text,
           hjust = 1.1, vjust = 2, size = 4, color = "black")
AUCA_Plot

AUCA_combined <- AUCA %>%
  group_by(eventDate) %>%
  summarise(
    microMoths = sum(microMoths, na.rm = TRUE),
    macroMoths = sum(macroMoths, na.rm = TRUE)
  )

#combine the multiple event dates
AUCA_Plot <- ggplot(AUCA_combined, aes(x = eventDate)) +
  geom_point(aes(y = microMoths, color = "Set 1")) +
  geom_point(aes(y = macroMoths, color = "Set 2")) +
  labs(
    title = "Micro and Macro Moth Abundances in Austin Cary Forest",
    x = "Date",
    y = "Abundance"
  ) +
  scale_color_manual(name = "Dataset", values = c("Set 1" = "blue", "Set 2" = "red")) +
  theme(
    axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
  ) +
  annotate("text", x = Inf, y = Inf, label = AUCA_correlation_text,
           hjust = 1.1, vjust = 2, size = 4, color = "black")

AUCA_Plot

########### Figure 3 - Very Basic Site Map ############################################

# get map data 
usa_map <- map_data("county")
usa_map

str(usa_map)

#filter to just alachua county

#isloate florida first
floria_counties <- usa_map %>%
  filter(subregion == "alachua")


#read site data as a csv
sites <- read.csv("data/site_data.csv")

#view our sites data 
sites
head(sites)

#convert our site data as an sf object
sites_sf <- st_as_sf(sites, coords = c("long", "lat"), crs = 4326)

#create the map using ggplot
ggplot() +
  geom_polygon(data = usa_map, aes(x = long, y = lat, group = group), fill = "lightgray", color = "white") +
  geom_sf(data = sites_sf, aes(color = site_classification), size = 3) +
  scale_color_manual(values = c("urban" = "red", "suburban" = "blue", "rural" = "green")) +
  labs(
    title = "Site Locations with Terrain Map",
    color = "Category"
  ) +
  theme_minimal() +
  coord_sf(xlim = c(-82.5, -82.0), ylim = c(29.5, 30.0), expand = FALSE) 
