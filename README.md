# Data Engineering Portfolio

Pipeline ELT end-to-end costruita con Python, BigQuery e dbt.

## Stack
- **Ingestion:** Python + google-cloud-bigquery
- **Warehouse:** Google BigQuery (Sandbox)
- **Trasformazione:** dbt Core
- **Orchestrazione:** Apache Airflow
- **Visualizzazione:** Looker Studio / Power BI

## Struttura
- `scripts/` — script Python di ingestion
- `dbt_project/` — modelli dbt (staging, marts)
- `airflow/` — DAG di orchestrazione
- `data/` — file di dati locali
- `docs/` — documentazione e diagrammi