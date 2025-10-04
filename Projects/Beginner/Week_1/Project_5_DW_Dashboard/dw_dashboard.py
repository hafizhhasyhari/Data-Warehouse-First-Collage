import streamlit as st
import pandas as pd
import sqlite3

# Connect to SQLite DW database
conn = sqlite3.connect('../../Project_3_ETL_Python/dw_week1.db')

st.title("Data Warehouse Week 1 - Mini Dashboard")
st.write("Visualize Sales Fact Table with Product and Customer Dimension")

# Load data from database
sales_data = pd.read_sql_query('''
SELECT s.sale_id, p.product_name, c.customer_name, c.region, s.sales_amount, s.sale_date
FROM sales_fact s
JOIN product_dim p ON s.product_id = p.product_id
JOIN customer_dim c ON s.customer_id = c.customer_id
''', conn)

st.dataframe(sales_data)

# Total sales per product
st.subheader("Total Sales by Product")
product_sales = sales_data.groupby('product_name')['sales_amount'].sum().reset_index()
st.bar_chart(product_sales.rename(columns={'product_name': 'index'}).set_index('index'))

# Total sales per region
st.subheader("Total Sales by Region")
region_sales = sales_data.groupby('region')['sales_amount'].sum().reset_index()
st.bar_chart(region_sales.rename(columns={'region': 'index'}).set_index('index'))

conn.close()
