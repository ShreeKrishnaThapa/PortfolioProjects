import pandas as pd
from google.cloud import bigquery
client = bigquery.Client.from_service_account_json(r"D:\m\banking-data-platform456-179067f866a6.json")
df = pd.read_csv(r"D:\animequality force\banking_project\data\raw\loans.csv")
table_id = "banking-data-platform456.raw.loans"
job = client.load_table_from_dataframe(
    df,
    table_id
)

job.result()

print("Upload Successful!")