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

## Dataset
**Fonte:** Google BigQuery Public Data — OpenAQ Global Air Quality  
**Tabella:** `bigquery-public-data.openaq.global_air_quality`  
**Copertura:** 2014-2022, misurazioni da tutto il mondo  
**Paesi analizzati:** Italia (IT), USA (US), India (IN), Regno Unito (GB)  
**Inquinanti:** PM2.5, NO2, O3

## Domande di Business
1. La qualità dell'aria è migliorata o peggiorata nel tempo nei principali paesi?
2. Quale paese ha i livelli medi più alti di PM2.5 e NO2?
3. Quali sono le 10 città con la peggiore qualità dell'aria per inquinante?