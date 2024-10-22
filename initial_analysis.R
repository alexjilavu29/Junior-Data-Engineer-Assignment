setwd("~/AstroNet Projects/Proiecte Personale/Junior Data Engineer Assignment")
# Create data frames for all three csv files
df_fb <- read.csv("facebook_dataset.csv")
df_google <- read.csv("google_dataset.csv")
# For the website data frame, the separator is a semicolon
df_website <- read.csv("website_dataset.csv", sep = ";")

# PREPROCESSING

# For each data frame, identify all the column names
colnames(df_fb)
colnames(df_google)
colnames(df_website)

str(df_website)

df_website[10:15,]

# If a row has more than 4 missing values, remove it
df_fb <- df_fb[rowSums(is.na(df_fb)) <= 4,]
df_google <- df_google[rowSums(is.na(df_google)) <= 4,]
df_website <- df_website[rowSums(is.na(df_website)) <= 4,]


# All the columns that should remain are: "domain", "name", "categories", "phone", "country_name", "city_name", "region_name", "address"

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

# The biggest dataset is google, so the resulting data frame will be based on the google data frame. Extract the columns that are common to all three data frames
df <- df_google[,c("domain", "name", "categories", "phone", "country_name", "city_name", "region_name", "address")]

# Append the rows from the facebook and website data frames that are not already in the resulting data frame
df <- rbind(df, df_fb[,c("domain", "name", "categories", "phone", "country_name", "city_name", "region_name", "address")])
df <- rbind(df, df_website[,c("domain", "name", "categories", "phone", "country_name", "city_name", "region_name", "address")])

# Remove duplicates
df <- unique(df)



