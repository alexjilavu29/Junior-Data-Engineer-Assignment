# For the CSV files google_dataset.csv and facebook_dataset.csv, the number of columns can vary.

# For the Google dataset, if a row has more columns than the header, we concatenate the 14th column with the 13th column
# until the total number of columns is equal to the number of columns in the header.

# For the Facebook dataset, if a row has at least 9 columns, we concatenate the 8th column with the 7th column until the
# 9th column starts with "http". This way, we ensure that the description is intact and we use the URL as a delimiter.
# To prevent errors, we discard rows that do not meet the conditions and we check if the number of columns at the
# end of the algorithm is less than or equal to the number of columns in the header.

import pandas as pd
import csv

def modify_csv(file_path, output_path):
    # We open the input and output CSV files
    with open(file_path, mode='r', newline='', encoding='utf-8') as infile, \
         open(output_path, mode='w', newline='', encoding='utf-8') as outfile:

        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        # Read the header row
        header = next(reader)
        num_header_columns = len(header)

        # We write the header to the output file
        writer.writerow(header)

        # We process each row
        for row in reader:
            # If the row has more columns than the header, we need to concatenate.
            if len(row) > num_header_columns:
                # We concatenate from the 14th column onward to the 13th column.
                row[12] = ' '.join(row[12:len(row)])  # We join all extra columns into the 13th column.
                row = row[:num_header_columns]  # We keep only up to the number of columns in the header.

            # We write the modified row to the output file.
            writer.writerow(row)

def modify_csv_condition(file_path, output_path):
    # We open the input and output CSV files
    with open(file_path, mode='r', newline='', encoding='utf-8') as infile, \
            open(output_path, mode='w', newline='', encoding='utf-8') as outfile:

        reader = csv.reader(infile)
        writer = csv.writer(outfile)

        # We read the header row
        header = next(reader)
        num_header_columns = len(header)

        # We write the header to the output file
        writer.writerow(header)

        # We process each row
        for row in reader:
            # We check if there are at least 9 columns, if not, skip the row
            if len(row) < 9:
                continue

            # We keep concatenating the 8th column into the 7th until the 9th column starts with "http"
            while len(row) > 8:
                if row[8].startswith("http") and len(row) <= num_header_columns:
                    break
                # We concatenate the 8th column to the 7th column
                row[6] = f"{row[6]} {row[7]}"  # Concatenate the 7th and 8th columns

                # We remove the 8th column (after concatenating) by popping it out
                row.pop(7)

                # If the row now has fewer than 9 columns, we break the loop and discard it
                if len(row) < 9:
                    row = None
                    break

            # If the row was discarded, we continue to the next row
            if row is None:
                continue

            # If after all concatenation, the 9th column still doesn't start with "http", we discard the row
            if not row[8].startswith("http"):
                continue

            # We write the modified row to the output file
            writer.writerow(row)


modify_csv('google_dataset.csv', 'google_dataset_modified.csv')
modify_csv_condition('facebook_dataset.csv', 'facebook_dataset_modified.csv')