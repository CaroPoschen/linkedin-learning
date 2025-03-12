#######################################################################
#######################################################################
# Script provided with course material for course https://www.linkedin.com/learning/etl-in-python-and-sql/
#######################################################################
#######################################################################


# Installing Airflow with Pip
pip install apache-airflow

# Initialise the airflow database with the command
airflow db init


# Edit the airflow.cfg file that is found in $AIRFLOW_HOME/airflow.cfg
# for me, it is jennifer/airflow/airflow.cfg 
# Search for [webserver] in the airflow.cfg file
# Add the following lines

authenticate = True
auth_backend = airflow.contrib.auth.backends.password_auth

# Save and close the file.

# Go back to the terminal, we run the user create command 
airflow users create  -u USERNAME  -p PASSWORD -e EMAIL -r ROLE -f FIRSTNAME -l LASTNAME  

# Sample user create command
# airflow users create --username admin --password admin --email ebejennifer14@gmail.com --role Admin --firstname jennifer --lastname ebe

# Start the Airflow Web Server and Scheduler using the command
airflow webserver --port 8080

# click on Allow to allow incoming communications


# In a separate terminal tab without closing the first run the command 
airflow scheduler

# this starts the airflow scheduler

# Open your web browser and go to 
http://localhost:8080 
