# Script provided with course material for course [ETL in Python and SQL](https://www.linkedin.com/learning/etl-in-python-and-sql/)

import pandas as pd
import sqlalchemy as db

orders_table = './data/H+ Sport Orders.xlsx'
engine = db.create_engine('dialect+driver://username:password@host:port/database')

def main():
    orders = pd.read_excel(orders_table, sheet_name='data')

    orders = orders[["OrderID", "Date", "TotalDue", "Status", "CustomerID", "SalespersonID"]]

    orders.to_sql('orders', engine, if_exists='replace', index=False)

    print("ETL script executed successfully")