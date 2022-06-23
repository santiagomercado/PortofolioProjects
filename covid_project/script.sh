#!/bin/bash
# User and password for accesing the database
USER='user'
PASSWORD='password'
# database name (should not be modified in order to work properly)
DB='covid1'

# Create the database
mysql --user="$USER" --password="$PASSWORD" -e "CREATE DATABASE IF NOT EXISTS ${DB};"
# Create the tables
mysql --user="$USER" --password="$PASSWORD" --database="$DB" < "create_tables.sql"

# Basic preprocessing
sed -i 's/^,/\\N,/; :a;s/,,/,\\N,/g;ta' 'covid_vaccinations.csv'
sed -i 's/^,/\\N,/; :a;s/,,/,\\N,/g;ta' 'covid_deaths.csv'

mysqlimport --ignore-lines=1 \
            --fields-terminated-by=, \
            --local --password="$PASSWORD" \
            --user "$USER" \
            "$DB" \
             'covid_vaccinations.csv' 'covid_deaths.csv'

# Run the all the queries from queries.sql
# mysql --user="$USER" --password="$PASSWORD" --database="$DB" < "queries.sql"
