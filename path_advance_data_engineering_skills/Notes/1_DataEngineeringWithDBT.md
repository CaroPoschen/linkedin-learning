# Data Engineering with dbt

Scenario: Using the dbt Core applying the Medallion Architecture to parking violations data

**Medallion Architecture**

Three areas: Bronze, Silver, and Gold

- **Bronze:** Raw data
- **Silver:** Raw data transformed into a data model of our desire
- **Gold:** Metrics on top of the data

### Datasets

- New York City parking violations issued - fiscal year 2023
- New York City Department of Finance parking violations codes

Create a small sample from the massive original dataset

## Set up the environment

Clone GitHub Codespaces so I have everything locally.
Install `dbt-core` using `pip`: `pip install dbt-core==1.6.1` (using same version as instructor)

dbt-core is the foundational package, need other packages as well: `pip install dbt-duckdb==1.6.0`, `pip install duckdb==0.9.0`
`dbt-duckdb` is the connection, `duckdb` is the actual DB.

Can see information about the packages using `pip show [package-name]`.

Use `requirements.txt` file to specify all required packages and versions to synchronize over all people working on a project

## Prepare Database Environment

- Have a Jupyter Notebook with commands to create a DuckDB database.
- SQL-queries to create tables from `.csv`-files.

## Create dbt Project 

Terminal: `dbt init`, ask for project name: `nyc_parking_violations`
Ask for which database to use, use only available one (duckdb).

Creates a folder with models, .yaml file, ..., and a logs folder

## Prepare dbt Environment

- understand `project.yml` file
- set up basic `profile.yml` file:
```
default:
  outputs:
    dev:
      type: duckdb
   target: dev
```

To connect `profile.yml` with `project.yml`, need to use the same name.
Currently getting an error using `dbt debug`, because profile name currently is called `default` instead of `nyc_parking_violations`.

## Your First dbt Model

- create file `first_model.sql` in `/nyc_parking_violations/models`

Three main CLI commands:
- `dbt debug`: need to be in the dbt-directory (here nyc_parking_violations)
- `dbt compile`: compiles all code but dos not run it, helps identify compiling errors
- `dbt run`: runs code

dbt model name becomes the table name in dbt so it needs to be unique.

## Introduction to dbt Ref Function

`{{ref('your_dbt_model_name')}}`

Jinja syntax, out of scope for this course

Create `ref_model.sql`


Command `dbt docs generate` generates files in `target`-folder.
`dbt docs serve` creates local instance of a website based on metadata of the website. Can view information including lineage graph there.

## Implementing the Medallion Architecture with dbt

- **Bronze data**: Goal: raw data with minimal cleaning and transformations, tables: bronze_parking_violation_codes; bronze_parking_violations
- **Silver data**: Goal: cleaned data with applied business logic, ultimately in an established data model, tables: silver_parking_violation_codes, silver_parking_violations, silver_violation_tickets, silver_violation_vehicles
- **Gold data**: metrics built on top of silver data that are often served to the business via dashboards, tables: gold_ticket_location_metrics, gold_vehicle_metrics

Create bronze folder and within `.sql`-file to create the model.
Create silver folder with simple transformations and gold folder with aggregations.

Can rerun the `dbt docs generate` and `dbt docs serve` to see updated linage graph for models.

## Materialization of dbt Models

Recommendation to check out documentation 


Materialization:
- Control how the models within your database are viewed or created
	- limit what tables can be viewed by database users
	- reduce cost of data storage
	- speed up certain data pipelines (e.g., dashboards)
- Five different materialization methods within dbt:
	- table
	- view
	- incremental
	- ephemeral
	- materialized view

Materialization for the project:
- Bronze: 
	- NYC Violation Codes Raw Data **View**
	- NYC Parking Violations Raw Data **View**
- Silver:
	- NYC Violation Codes Cleaned Data **Ephemeral**
	- NYC Parking Violations Cleaned Data **Ephemeral**
	- Violation Ticket Data **View**
	- Violation Vehicle Data **View**
- Gold:
	- Violation Ticket Metrics **Table**
	- Violation Vehicle Metrics **Table**

Set up configuration in `dbt_project.yml` file.


## Documentation as Code via dbt

Can see documentation and materialization for data in `docs`.
Add documentation with a schema-file.


Doc blocks: use variables in documentation, which can then be used in the schema file.

## Implementing Tests within your dbt Project

Recommended to check out the documentation.

Create `violation_codes_revenue.sql`-file in test folder with sql-statement test.
Command `dbt test` to run test.

Can also add tests in `schema.yml`-file for a column.
Can create my own tests and include them in the schema-file, like the `generic_not_null.sql` in the example.

Can store failed tests using the following command in `dbt_project.yml`:
```
    tests:
      +store_failures: true
```
If an error happens, it provides a `sql`-statement to access the information about the failed test.

## Deploying your dbt Project

Currently only have dev-profile in `profiles.yml`, also want a prod-profile, so need to change the `profile.yml`-file.

Create a new database for the new environment as done before, using statements in Jupyter Notebook.
Run debug as before, for compile and run, change the target to prod using `dbt compile --target  prod` and `dbt run --target prod`.


Run everything automatically with **GitHub action workflows**.

Create new file `.github/workkflows/run-dbt-prod.yml`



