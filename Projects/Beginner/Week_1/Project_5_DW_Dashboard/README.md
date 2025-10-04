# Project 5: Mini Data Warehouse Dashboard

## Objective
Create a **mini interactive dashboard** to visualize data from Week 1 Data Warehouse projects (Fact & Dimension tables).  
This project uses **Python + Streamlit**, but can be adapted to other languages or frameworks.

---

## Folder Contents
- `dw_dashboard.py` → Main dashboard script  
- `requirements.txt` → Required Python packages  

---

## Prerequisites
- Python 3.x  
- Streamlit  
- Pandas library  
- SQLite database from Project 3 (ETL CSV → DW)  

---

## Installation
1. Install required Python packages:

```bash
pip install -r requirements.txt
```

Make sure dw_week1.db from Project 3 exists and contains sample data.
Running the Dashboard

Run the Streamlit application:

```bash
streamlit run dw_dashboard.py
```
---
- The dashboard opens in your browser.
- Features:
  -  Table of sales_fact with product & customer info
  -  Bar chart: Total sales per product
  - Bar chart: Total sales per region
---
Expected Outcome
- Interactive table showing sales data
- Visual bar charts for product and region sales
- Easy understanding of fact & dimension data relationships

#DataWarehouse #Dashboard #Streamlit #Python #ETL #FactTable #DimensionTable #Week1Project
