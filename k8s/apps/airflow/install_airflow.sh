#!/bin/bash

echo -e "##### Installing the airflow chart ..."
helm repo add apache-airflow https://airflow.apache.org
#helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace --debug --set startupapicheck.timeout=10m
helm install airflow apache-airflow/airflow --namespace airflow --create-namespace --debug 
echo -e "##### ... done."

