setwd("~/AstroNet Projects/Proiecte Personale/Junior Data Engineer Assignment")


# We create data frames for all three csv files
df_fb <- read.csv("facebook_dataset_modified.csv")
df_google <- read.csv("google_dataset_modified.csv")

# For the website data frame, the separator is a semicolon
df_website <- read.csv("website_dataset.csv", sep = ";")


# PREPROCESSING ----

# For each data frame, identify all the column names
colnames(df_fb)
colnames(df_google)
colnames(df_website)


# All the columns that should remain are: "domain", "name", "categories", 
# "phone", "country_name", "city_name", "region_name", "address"
# I chose these columns because all of them can be found in at least two 
# of the 3 datasets and they convey the most relevant information.

# In order to standardize the data, we need to choose our columns carefully
# and rename them to be sure that they function correctly when we join them.

# For df_fb:
# Rename "city" to "city_name"
colnames(df_fb)[colnames(df_fb) == "city"] <- "city_name"

# For df_google:
# Rename "category" to "categories"
colnames(df_google)[colnames(df_google) == "category"] <- "categories"
# Rename "city" to "city_name"
colnames(df_google)[colnames(df_google) == "city"] <- "city_name"


# For df_website:
# Rename "root_domain" to "domain"
colnames(df_website)[colnames(df_website) == "root_domain"] <- "domain"
# Rename "legal_name" to "name"
colnames(df_website)[colnames(df_website) == "legal_name"] <- "name"
# Rename "category" to "categories"
colnames(df_website)[colnames(df_website) == "s_category"] <- "categories"
# Rename "main_city" to "city_name"
colnames(df_website)[colnames(df_website) == "main_city"] <- "city_name"
# Rename "main_country" to "country_name"
colnames(df_website)[colnames(df_website) == "main_country"] <- "country_name"
# Rename "main_region" to "region_name"
colnames(df_website)[colnames(df_website) == "main_region"] <- "region_name"

# Add the "address" column to the website data frame
df_website$address <- NA
# The address column will be null for the data coming from the website, but
# this is a necessary drawback in order to increase final dataset size.


# ASSEMBLING THE FINAL DATASET ----


# The biggest dataset is google, so the resulting data frame will be based on 
# the google data frame. 
# We extract the columns that are common to all three data frames
df <- df_google[,c("domain", "name", "categories", "phone", "country_name", 
                   "city_name", "region_name", "address")]

# We append the rows from the facebook and website data frames that are not 
# already in the resulting data frame
df <- rbind(df, df_fb[,c("domain", "name", "categories", "phone", 
                         "country_name", "city_name", 
                         "region_name", "address")])
df <- rbind(df, df_website[,c("domain", "name", "categories", "phone", 
                              "country_name", "city_name", "region_name", 
                              "address")])

# We remove potential duplicates
df <- unique(df)

# If a row has more than 4 missing values, we remove it for lack of information.
df <- df[rowSums(is.na(df)) <= 4,]

# Output the final data frame to a csv file
write.csv(df, "final_dataset.csv", row.names = FALSE)
