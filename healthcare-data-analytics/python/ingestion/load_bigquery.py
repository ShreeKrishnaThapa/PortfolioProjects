import pandas as pd
from google.cloud import bigquery

# BigQuery client
client = bigquery.Client.from_service_account_json(
    r"C:\Users\mager\Downloads\healthcare-508405-6310f0988336.json"
)

# CSV → BigQuery table
tables = {
    r"D:\healthcare_data_platform\data\cleaned\appointment.csv":
        "healthcare-508405.raw.appointment",
    r"D:\healthcare_data_platform\data\cleaned\doctors.csv":
        "healthcare-508405.raw.doctors",
    r"D:\healthcare_data_platform\data\cleaned\hospitals.csv":
        "healthcare-508405.raw.hospital",
    r"D:\healthcare_data_platform\data\cleaned\patients.csv":
        "healthcare-508405.raw.patients",
    r"D:\healthcare_data_platform\data\cleaned\insurance_claims.csv":
        "healthcare-508405.raw.insurance_claims",
    r"D:\healthcare_data_platform\data\cleaned\patients.csv":
        "healthcare-508405.raw.patients",
    r"D:\healthcare_data_platform\data\cleaned\prescriptions.csv":
        "healthcare-508405.raw.prescriptions" 
}



# Upload all files
for csv_file, table_id in tables.items():

    print(f"Uploading: {csv_file}")

    df = pd.read_csv(csv_file)

    job = client.load_table_from_dataframe(
        df,
        table_id
    )

    job.result()

    print(f"Uploaded → {table_id}")

print("All uploads successful!")