# Credit-risk-analysis-medallion-architecture
# Credit Risk Analytics using Medallion Architecture

##  Project Overview
This project demonstrates an **end-to-end data analytics solution** for **customer and merchant credit risk analysis** using the **Medallion Architecture (Bronze–Silver–Gold)**.  
The project follows an **Agile Scrum methodology**, delivering features incrementally across sprints and culminating in an executive-ready **Power BI dashboard with drill-through capabilities**.

---

##  Architecture Overview
The solution is built using a modern analytics architecture:

- **Bronze Layer**: Raw data ingestion (unstructured CSV files)
- **Silver Layer**: Data cleaning, standardization, and feature engineering using Python
- **Gold Layer**: Business-ready star schema modeled using SQL
- **Consumption Layer**: Interactive Power BI dashboards

---

##  Medallion Architecture
<img width="1536" height="1024" alt="Medallion Architecture" src="https://github.com/user-attachments/assets/3ff9481f-8381-4a9c-b872-b6ebcc71a2f8" />


---

##  Data Flow
<img width="1536" height="1024" alt="Data Flow" src="https://github.com/user-attachments/assets/f353f428-aa83-4385-b9b8-9bc4fcaabc1d" />


---

##  Tech Stack
- **Python** (Pandas, NumPy) – Data ingestion & transformation
- **SQL (PostgreSQL)** – Data modeling & analytics
- **Power BI** – Dashboarding & reporting
- **GitHub** – Version control & documentation
- **Agile Scrum** – Project execution methodology

---

##  Data Model (Gold Layer)

### Fact Table
- **fact_transactions**
  - Transaction amount
  - Merchant risk score
  - High-risk flag
  - Risk exposure metric

### Dimension Tables
- **dim_customer**
- **dim_merchant**
- **dim_time**

The model follows a **star schema** optimized for analytical queries and BI performance.

<img width="1536" height="1024" alt="Data Relationship" src="https://github.com/user-attachments/assets/7e9d5528-bb81-42db-9373-5d7652c6d1fd" />

---

##  Power BI Dashboards

###  Executive Overview
- Total Spend
- Transaction Count
- Risk Exposure
- High Risk %
- Monthly spend and risk trends

<img width="605" height="407" alt="Screenshot 2026-01-22 165520" src="https://github.com/user-attachments/assets/52f1b1a2-d48d-4515-a032-29b699509991" />


###  Customer Risk Analysis
- High-risk customer identification
- Spend vs risk scatter analysis
- Segment-level risk exposure
- Drill-through to customer transaction details

-<img width="652" height="404" alt="Screenshot 2026-01-22 165616" src="https://github.com/user-attachments/assets/6f747927-678e-4654-9999-7706e0b609b6" />
 

###  Merchant Risk Analysis
- Merchant-wise risk exposure ranking
- Monthly merchant risk trends
- High-risk merchant identification
- Drill-through to merchant transaction details

- <img width="569" height="383" alt="Screenshot 2026-01-22 165701" src="https://github.com/user-attachments/assets/a8d7178d-9e1e-4e09-b35b-6d6d62e2f94f" />


---

##  Agile Scrum Execution

The project was developed using **Agile Scrum**, broken into multiple sprints:

###  Sprint 1 – Data Ingestion (Bronze Layer)
- Defined data sources
- Ingested raw CSV files
- Performed initial data profiling

###  Sprint 2 – Data Cleaning & Transformation (Silver Layer)
- Handled missing and inconsistent values
- Standardized schemas
- Created derived risk features

###  Sprint 3 – Data Modeling (Gold Layer)
- Designed star schema
- Built fact and dimension tables using SQL
- Validated business metrics

###  Sprint 4 – Dashboard Development
- Built Executive, Customer, and Merchant dashboards
- Implemented KPIs and advanced DAX measures
- Added drill-through functionality

###  Sprint 5 – Optimization & Documentation
- Improved performance and visuals
- Added architecture diagrams
- Created project documentation

---

##  Key Business Questions Answered
- Which customers contribute most to risk exposure?
- Which merchants drive portfolio-level risk?
- How does risk evolve over time?
- Are risks concentrated within specific segments or merchants?

---

##  Key Features
- Medallion architecture implementation
- Agile Scrum-based delivery
- Star schema modeling
- Advanced DAX measures
- Drill-through analysis
- Executive-ready dashboard design

---

##  How to Run the Project
1. Load raw CSV files into the **Bronze** layer
2. Run Python notebooks to clean and transform data (**Silver**)
3. Load cleaned data into PostgreSQL
4. Execute SQL scripts to build **Gold** tables
5. Connect Power BI to the Gold schema
6. Explore dashboards and drill-through insights

---

## 👤 Author
**Yash Tiwari**  
Data Analyst | SQL | Power BI | Python  

📍 Bhopal, India
