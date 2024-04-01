# Airflow

## Configuration
 - changing enviroment variables
   ```
   $ vi .env
   ...
   AIRFLOW_UID=0
   AIRFLOW_PROJ_DIR=/Users/noname/data/airflow
   DOCKER_SOCKET_FILE=/var/run/docker.sock
   ...

   ```

## Operation
 - run
   ```
   $ ./up.sh
   ```
 - stop
   ```
   $ ./down.sh
   ```

## Web dashboard
 - sign in
   ```
   sign into [http://localhost:8080](http://localhost:8080) using airflow/airflow

   ```

