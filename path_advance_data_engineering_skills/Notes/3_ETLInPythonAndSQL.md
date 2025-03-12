# ETL in Python and SQL

**Data Transformation:**
Converting raw data coming from different systems into a format that is suitable for the target system.
Important for data quality and consistency.


## What are ETLs?

**Data Pipeline:** A set of processes and technologies that describe data's journey or movement from the data source to its destination.

**Extract:** 
- Moving the data from the source
- Extracting data from spreadsheets, APIs, databases, or cloud systems 
- Tools: Python, AWS Glue, Azure Data Factory, Talend, and more

**Transform:** 
- Cleaning and transforming the data
- Cleaning, enriching, aggregating, and standardizing the data to remove errors, duplicates, or irrelevant information 
- Tools: Spark, Python, Azure Data Factory, and more

**Load:** 
- Loading the data to the target
- Loading the transformed data into the target database, data warehouse, data lake, or data mart
- Tools: Python, Spark, Azure Data Factory, and more

**Orchestration Tools** 
- Used to create and orchestrate ETLs
- Examples: Apache Airflow, SQL Server integration Services (SSIS), Azure Data Factory (ADF), and AWS Database Migration Service (AWS DMS)

- Create and schedule an ETL with one or a combination of the tools
- Create custom ETL scripts with Python, Java, and Spark

This course uses **Python** to create ETL workflows

**Scenario:**
- Company: H+ Sports
- A sports apparel company
- Compiled and recorded their data (customers, inventory, products, etc.) in Microsoft Excel
- You are their new data engineer
- Your first task is to warehouse all their data

Factors to consider
- Pipeline architecture and tools
- Data sources, transformations, and destinations
- Ask yourself: "how often do we intend to pull the data?"
- Data volume and velocity
- Scalability and performance 

Truncating and Loading in this course
- Data cleansing: if there are errors, a full load can refresh the data
- Data and schema changes: a full load will update the data and any schema changes
- Simplicity in maintenance: a full load reduces the complexity of maintaining incremental loading logic
- Initial data loads: a full load is necessary to ensure you start with full and complete data


**Pandas:** A population open-source Python library used for data manipulation and analysis

Exploring and Understanding Our Data
- Be familiar with the data structure, format, data types, and relationships between tables and columns
- Consider data quality to find duplicates, inconsistencies, missing values, or null records
- Find what transformations are required and if there is existing business logic to apply
- Figure out how to structure the ETL process


## Extracting and Transforming Data with Python

Data Sources
- Production databases
- SQL or NoSQL databases
- APIs
- JSON files
- Excel or CSV files

Data Formats
- XML
- Parquet
- JSON
- TXT
- And so many more


**Data Duplication:** Identifying and removing duplicate data from the dataset.

**Data Integration:** Transform	ing data from various source systems into a common format and structure.

**Data Aggregation:** The process of summarizing, grouping, or consolidating data from multiple rows or records into a single value or set of values.

**Data Filtering:** Remove unwanted data from an entire dataset.

**Data Cleaning:** Identifying and eliminating errors and inconsistencies in the data.

Data transformation plays an important role in the ETL process to achieve quality data!


## Loading Data into Target Systems

Databases
- Organized collections of data that are controlled using a database management system (DBMS)
- DBMS is software that allows you to access, interact, and manipulate data in a database
- Manages day-to-day CRUD operations 

**Structured:** Uses tables to store data, where each table has a predefined schema. Examples: MySQL, PostgreSQL, and MS SQL

**Semi-structured:** Does not fit into a table but does have some organization. Examples: JSON and XML stored in MongoDB

**Unstructured:** Does not have a predefined schema and are not organized in tabular form.

Data Warehouses
- Centralized systems or repositories that store data from various sources
- Examples include transactional database systems, APIs, ERP systems, and CRM systems 
- Support business intelligence in a consistent format
- Track historical information

Data Lakes
- Flexible and scalable data storage system storing both structured and unstructured data 
- Does not have a required predefined schema or structure 
- Easier for end users to access raw data

Data Lakehouses
- Modern versions of data lakes with an additional layer
- Adds the benefit of querying the data in a structured format
- Example: Apache Hive

Summary
- Databases provide transactional efficiency
- Data warehouses are optimized for complex analytical queries from various sources 
- Data lakes offer scalability and flexibility in data storage 
- Data bakehouses provide a balance between raw storage and structured querying


Course continues on ElephantSQL, an online database. ElephantSQL is ending its service so no option to create an account and use them.

SQLAlchemy: a library to interact with relational databases in python

Data Accuracy Checks
- Completeness
- Uniqueness
- Consistency
- Current

Data Integrity Checks
- Duplicates detection
- Freshness
- Timeliness 

## Automating ETL Jobs: Scheduling ETL Jobs with Python

**ETL Automation:** Uses technology to run ETL processes and workflows between tools and systems without manual intervention based on schedules or events.


Tools for ETL Automation
- Apache Airflow
- Ozzie
- NiFi
- Luigi
- Microsoft Azure Data Factory 
- SSIS

In this course: **Apache Airflow**, an open source platform designed to schedule and monitor workflows defined as directed acyclic graphs (DAGs). Each node represents a task to be executed.

Shell script `04_02_scheduling.sh` with instructions on how to set up Airflow.

In `airflow` folder, create folder `dags`. DAGs are Python files, not Jupyter Notebook 





