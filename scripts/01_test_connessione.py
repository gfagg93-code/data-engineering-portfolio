from google.cloud import bigquery

PROJECT_ID = "portfolio-de-2026"
DATASET_ID = "air_quality_raw"

client = bigquery.Client(project=PROJECT_ID)

# Crea il dataset se non esiste già
dataset_ref = bigquery.Dataset(f"{PROJECT_ID}.{DATASET_ID}")
dataset_ref.location = "US"
client.create_dataset(dataset_ref, exists_ok=True)
print(f"Dataset '{DATASET_ID}' pronto.")

# Query che estrae i dati grezzi dal dataset pubblico
query = """
    SELECT
        country,
        city,
        pollutant,
        value,
        unit,
        timestamp,
        latitude,
        longitude
    FROM
        `bigquery-public-data.openaq.global_air_quality`
    WHERE
        value >= 0
        AND country IN ('IT', 'US', 'IN', 'GB')
"""

# Configura il job per scrivere il risultato in una tabella permanente
table_id = f"{PROJECT_ID}.{DATASET_ID}.raw_air_quality"
job_config = bigquery.QueryJobConfig(destination=table_id, write_disposition="WRITE_TRUNCATE")

print("Caricamento dati in corso...")
query_job = client.query(query, job_config=job_config)
query_job.result()  # aspetta che finisca

tabella = client.get_table(table_id)
print(f"Caricate {tabella.num_rows} righe nella tabella {table_id}")