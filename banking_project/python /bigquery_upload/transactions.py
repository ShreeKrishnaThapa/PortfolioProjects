import pandas as pd
from google.cloud import bigquery
client = bigquery.Client.from_service_account_json(r"service_account_key_file.json")
df = pd.read_csv(r"C:\Users\mager\Downloads\archive (1)\transactions.csv",  engine='python')
table_id = "banking-data-platform456.raw.transactions"
job = client.load_table_from_dataframe(
    df,
    table_id
)

job.result()

print("Upload Successful!")
