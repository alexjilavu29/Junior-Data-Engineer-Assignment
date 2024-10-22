# Junior Data Engineer Assessment - Final Dataset Construction

This repository contains code for the **Junior Data Engineer Assignment**, aimed at processing and merging multiple datasets into a final structured dataset. The main objective of this project is to demonstrate proficiency in handling inconsistent data, performing preprocessing tasks, and assembling a unified dataset for further analysis.
The datasets used in this project, the modified datasets and the final dataset are not included in this repository,
but can be found by accessing the following link: [Junior Data Engineer Assessment - Google Drive] -- [To be added].

## Project Overview

The project processes three datasets: `google_dataset.csv`, `facebook_dataset.csv`, and `website_dataset.csv`. These datasets contain varying numbers of columns and inconsistent data formats. Our task is to standardize and clean these datasets before combining them into a single, unified dataset. Below are the key steps involved in achieving this goal:

### 1. Data Cleaning & Standardization (Python)

The Python script `column_concat.py` is used to handle inconsistent row lengths across the `google_dataset.csv` and `facebook_dataset.csv` files. We applied the following modifications:

#### Google Dataset Processing:
- For rows where the number of columns exceeds the number of columns in the header, we concatenate any extra columns starting from the 14th column into the 13th column. This ensures that all the relevant information is captured without exceeding the column count of the header.
- After concatenation, rows are trimmed to match the number of columns in the header.

#### Facebook Dataset Processing:
- For rows with at least 9 columns, we concatenate the 8th column into the 7th column until the 9th column starts with "http" (used as a delimiter for URL fields). If this condition isn't met after concatenation, the row is discarded.
- After concatenation, rows are validated to ensure their column count is consistent with the header.

The script outputs two cleaned CSV files: `google_dataset_modified.csv` and `facebook_dataset_modified.csv`.

To execute the script, use the following command:

**python column_concat.py**

### 2. Preprocessing and Final Assembly (R)

The `initial_analysis.R` script handles the preprocessing and final assembly of the datasets. Below are the steps performed in this script:

#### Data Loading:
- Load the modified Facebook and Google datasets: `facebook_dataset_modified.csv` and `google_dataset_modified.csv`.
- Load the `website_dataset.csv` using a semicolon (`;`) as the separator.

#### Column Standardization:
- For each dataset, we identify relevant columns that are common to at least two datasets: `domain`, `name`, `categories`, `phone`, `country_name`, `city_name`, `region_name`, and `address`.
- We rename columns as necessary to ensure consistency across the datasets:
  - `city` in the Facebook and Google datasets is renamed to `city_name`.
  - `category` in the Google dataset and `s_category` in the Website dataset are renamed to `categories`.
  - `root_domain` in the Website dataset is renamed to `domain`, and `legal_name` is renamed to `name`.
  - Additional columns such as `address` (empty in the Website dataset) are added to align with the other datasets.

#### Final Dataset Assembly:
- The Google dataset serves as the base for the final dataset. We extract the selected columns and append rows from the Facebook and Website datasets that are not already present.
- Duplicates are removed from the resulting dataset to ensure data integrity.
- Rows with more than 4 missing values are removed due to insufficient information.

#### Output:
The final assembled dataset is written to a CSV file: `final_dataset.csv`.

To execute the script, use the following command:

**Rscript initial_analysis.R**

### 3. Final Dataset
The final dataset `final_dataset.csv` contains standardized data from all three original datasets. It can be used for further analysis or reporting purposes.

## Files in This Repository
- `column_concat.py`: Python script for cleaning and standardizing the Google and Facebook datasets.
- `initial_analysis.R`: R script for preprocessing, standardizing, and assembling the final dataset.
- `google_dataset_modified.csv`: Cleaned Google dataset.
- `facebook_dataset_modified.csv`: Cleaned Facebook dataset.
- `final_dataset.csv`: Final structured dataset.

## Usage Instructions
1. Run the Python script to process the Google and Facebook datasets:

   **python column_concat.py**

2. Run the R script to preprocess the data and assemble the final dataset:

   **Rscript initial_analysis.R**

3. The final structured dataset will be saved as `final_dataset.csv`.

## Author
**Alexandru Jilavu**  
Junior Data Engineer Candidate

This project was developed as part of a job assessment for the Junior Data Engineer role. The datasets used in the making of 
this project are not included in this repository, but can be found by accessing the following link: [Junior Data Engineer Assessment - Google Drive] -- [To be added].
