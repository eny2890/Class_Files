########################################
###### Metabarcoding Final Analyses ####
###### Lillian Hendrick ################
###### 11/20/24 ########################

# ---- Set Up Working Directory and Import Files ----

# Set the working directory. Replace 'your_path_here' with the correct folder path where the data files are saved.
setwd("your_path_here")  # Example: setwd("C:/Users/YourName/Documents/R")

# Import the data files
# Replace 'identifications.csv' and 'metabarcoding_cluster_data.csv' with the correct file names if they are different.
identifications <- read.csv("data/identifications.csv")
clusters <- read.csv("data/metabarcoding_cluster_data.csv")

# ---- Instructions for Setting Up ----
# 1. Save this script in the same directory as your data files.
# 2. Open R or RStudio.
# 3. Run each line step by step by pressing 'Ctrl + Enter' (Windows) or 'Cmd + Enter' (Mac).

# ---- Load Required Libraries ----
library(ggplot2)
#install.packages("dplyr")
library(dplyr)

# ---- Data Preparation for Visualization ----

# 1. Aggregate data for the total abundance of clusters for each site across time periods
abundance_data <- clusters %>% 
  group_by(Site, Time_of_year) %>% 
  summarise(Total_Abundance = sum(Number_of_clusters)) %>% 
  ungroup()

# Map the time periods to descriptive labels
time_labels <- c("Late Spring 2019", "Early Summer 2019", "Summer 2019",
                 "Late Summer/Early Fall 2019", "Late Fall/Early Winter 2019", 
                 "Late Winter/Early Spring 2020")
abundance_data$Time_of_year <- factor(abundance_data$Time_of_year, levels = 1:6, labels = time_labels)

# 2. Aggregate total instances for each subfamily and family

# Aggregate total instances for each subfamily
subfamily_data <- identifications %>% 
  group_by(subfamily) %>% 
  summarise(Total_Instances = n()) %>% 
  ungroup()

# Aggregate total instances for each family
family_data <- identifications %>% 
  group_by(family) %>% 
  summarise(Total_Instances = n()) %>% 
  ungroup()

# ---- Visualization ----

# Barplot 1: Total Abundance of Clusters Across Sites and Time Periods
ggplot(abundance_data, aes(x = Time_of_year, y = Total_Abundance, fill = Site)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Total Abundance of Clusters Across Time Periods",
       x = "Time Period",
       y = "Number of OTUs") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Barplot 2: Total Number of Instances for Each Subfamily
ggplot(subfamily_data, aes(x = reorder(subfamily, Total_Instances), y = Total_Instances, fill = subfamily)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Total Number of Instances by Subfamily",
       x = "Subfamily",
       y = "Total Instances") +
  theme_minimal()

# Barplot 3: Total Number of Instances for Each Family
ggplot(family_data, aes(x = reorder(family, Total_Instances), y = Total_Instances, fill = family)) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(title = "Total Number of Instances by Family",
       x = "Family",
       y = "Total Instances") +
  theme_minimal()

# ---- ANOVA and Tukey Test ----

# Bar plot: Mean Number of Clusters for each Classification
bar_plot <- clusters %>%
  group_by(Classification) %>%
  summarise(Mean_Clusters = mean(Number_of_clusters), SD_Clusters = sd(Number_of_clusters)) %>%
  ggplot(aes(x = Classification, y = Mean_Clusters, fill = Classification)) +
  geom_bar(stat = "identity", width = 0.6, color = "black") +
  geom_errorbar(aes(ymin = Mean_Clusters - SD_Clusters, ymax = Mean_Clusters + SD_Clusters), 
                width = 0.2) +
  labs(title = "Mean Number of Clusters by Classification (Bar Plot)",
       x = "Classification",
       y = "Number of Clusters") +
  theme_minimal()

# Box-and-Whisker Plot: Distribution of Number of Clusters for each Classification
box_plot <- ggplot(clusters, aes(x = Classification, y = Number_of_clusters, fill = Classification)) +
  geom_boxplot(outlier.color = "red", outlier.size = 2) +
  labs(title = "Distribution of Number of Clusters by Classification (Box Plot)",
       x = "Classification",
       y = "Number of Clusters") +
  theme_minimal()

# Print both plots
print(bar_plot)
print(box_plot)

#The results of these tests state there is no difference in number of OTUs between the urban gradient classifications;
#suggesting that urbanization does not have an impact on the species richness!!! This is a key finding and defintely something
# you may want to consider putting on your poster
# However 
# ---- Customization Notes ----
# To change the color scheme of the bar plots, use the 'scale_fill_brewer()' or 'scale_fill_manual()' functions.
# Example: + scale_fill_brewer(palette = "Set3") or + scale_fill_manual(values = c("red", "blue", "green"))
# To adjust axis labels and titles, use the 'labs()' function.
# Example: labs(title = "Your Title", x = "Your X Label", y = "Your Y Label")

# ---- Explanation of Statistical Tests ----
# ANOVA (Analysis of Variance): Used to determine whether there are significant differences between the means of three or more groups.
# Tukey's HSD Test: A post-hoc test performed after ANOVA to identify which specific groups are significantly different from each other.
# We use these tests to understand the relationship between classification and the number of clusters.


###### Once you run through all of this code you will have figures you can put in your results section,
###### Feel free to change the color and customize, change or add to the plots, or do not include whichever ones
###### You do not feel are important to your poster

##### After doing this, use these two datasets to answer quesitons about your specific question as well
##### All of the data you should need are in one of these two files, and the descriptions for it are in today's
##### powerpoint.