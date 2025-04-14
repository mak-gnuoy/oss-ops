#!/bin/bash

echo -e "##### Uninstalling the airflow chart ..."
helm delete airflow --namespace airflow
echo -e "##### ... done."

