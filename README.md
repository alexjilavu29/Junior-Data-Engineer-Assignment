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


#
### Roumanian Version Below

# Evaluare Junior Data Engineer - Construirea Setului Final de Date

Acest depozit conține cod pentru **Evaluarea Junior Data Engineer**, având ca scop procesarea și unificarea mai multor seturi de date într-un set final structurat. Obiectivul principal al acestui proiect este de a demonstra competența în gestionarea datelor inconsistent, efectuarea sarcinilor de preprocesare și asamblarea unui set de date unificat pentru analize ulterioare.  
Seturile de date utilizate în acest proiect, seturile de date modificate și setul final de date nu sunt incluse în acest depozit, dar pot fi găsite accesând următorul link: [Evaluare Junior Data Engineer - Google Drive] -- [De adăugat].

## Prezentarea Proiectului

Proiectul procesează trei seturi de date: `google_dataset.csv`, `facebook_dataset.csv` și `website_dataset.csv`. Aceste seturi de date conțin un număr variabil de coloane și formate de date inconsistente. Sarcina noastră este să standardizăm și să curățăm aceste seturi de date înainte de a le combina într-un singur set unificat de date. Iată pașii cheie implicați în atingerea acestui obiectiv:

### 1. Curățarea și Standardizarea Datelor (Python)

Scriptul Python `column_concat.py` este utilizat pentru a gestiona lungimile inconsistente ale rândurilor din fișierele `google_dataset.csv` și `facebook_dataset.csv`. Am aplicat următoarele modificări:

#### Procesarea Setului de Date Google:
- Pentru rândurile în care numărul de coloane depășește numărul de coloane din antet, concatenăm coloanele suplimentare începând cu a 14-a coloană în a 13-a coloană. Acest lucru asigură că toate informațiile relevante sunt capturate fără a depăși numărul de coloane din antet.
- După concatenare, rândurile sunt ajustate pentru a se potrivi cu numărul de coloane din antet.

#### Procesarea Setului de Date Facebook:
- Pentru rândurile cu cel puțin 9 coloane, concatenăm a 8-a coloană în a 7-a coloană până când a 9-a coloană începe cu "http" (utilizată ca delimitator pentru câmpurile URL). Dacă această condiție nu este îndeplinită după concatenare, rândul este eliminat.
- După concatenare, rândurile sunt validate pentru a asigura că numărul lor de coloane este consistent cu antetul.

Scriptul generează două fișiere CSV curățate: `google_dataset_modified.csv` și `facebook_dataset_modified.csv`.

Pentru a executa scriptul, utilizați următoarea comandă:

**python column_concat.py**

### 2. Preprocesare și Asamblare Finală (R)

Scriptul `initial_analysis.R` se ocupă cu preprocesarea și asamblarea finală a seturilor de date. Iată pașii efectuați în acest script:

#### Încărcarea Datelor:
- Încărcați seturile de date modificate Facebook și Google: `facebook_dataset_modified.csv` și `google_dataset_modified.csv`.
- Încărcați `website_dataset.csv` folosind un punct și virgulă (`;`) ca separator.

#### Standardizarea Coloanelor:
- Pentru fiecare set de date, identificăm coloanele relevante care sunt comune pentru cel puțin două seturi de date: `domain`, `name`, `categories`, `phone`, `country_name`, `city_name`, `region_name` și `address`.
- Redenumim coloanele după cum este necesar pentru a asigura consistența între seturile de date:
  - `city` în seturile de date Facebook și Google este redenumit în `city_name`.
  - `category` în setul de date Google și `s_category` în setul de date Website sunt redenumite în `categories`.
  - `root_domain` în setul de date Website este redenumit în `domain`, iar `legal_name` este redenumit în `name`.
  - Coloane suplimentare, cum ar fi `address` (goal în setul de date Website), sunt adăugate pentru a se alinia cu celelalte seturi de date.

#### Asamblarea Setului Final de Date:
- Setul de date Google servește ca bază pentru setul final de date. Extragem coloanele selectate și adăugăm rândurile din seturile de date Facebook și Website care nu sunt deja prezente.
- Duplicatul este eliminat din setul de date rezultat pentru a asigura integritatea datelor.
- Rândurile cu mai mult de 4 valori lipsă sunt eliminate din cauza informațiilor insuficiente.

#### Ieșire:
Setul de date final asamblat este scris într-un fișier CSV: `final_dataset.csv`.

Pentru a executa scriptul, utilizați următoarea comandă:

**Rscript initial_analysis.R**

### 3. Setul Final de Date
Setul final de date `final_dataset.csv` conține date standardizate din toate cele trei seturi de date originale. Poate fi utilizat pentru analize ulterioare sau scopuri de raportare.

## Fișiere în Acest Depozit
- `column_concat.py`: Script Python pentru curățarea și standardizarea seturilor de date Google și Facebook.
- `initial_analysis.R`: Script R pentru preprocesare, standardizare și asamblare a setului final de date.
- `google_dataset_modified.csv`: Setul de date Google curățat.
- `facebook_dataset_modified.csv`: Setul de date Facebook curățat.
- `final_dataset.csv`: Setul final structurat de date.

## Instrucțiuni de Utilizare
1. Rulați scriptul Python pentru a procesa seturile de date Google și Facebook:

   **python column_concat.py**

2. Rulați scriptul R pentru a preprocesa datele și a asambla setul final de date:

   **Rscript initial_analysis.R**

3. Setul final structurat de date va fi salvat ca `final_dataset.csv`.

## Autor
**Alexandru Jilavu**  
Candidat Junior Data Engineer

Acest proiect a fost dezvoltat ca parte a unei evaluări pentru rolul de Junior Data Engineer. Seturile de date utilizate în realizarea acestui proiect nu sunt incluse în acest depozit, dar pot fi găsite accesând următorul link: [Evaluare Junior Data Engineer - Google Drive] -- [De adăugat].