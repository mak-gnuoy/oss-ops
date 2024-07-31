#!/bin/bash

/usr/bin/mc alias set myminio http://minio:9000 admin changeit
/usr/bin/mc mb myminio/samples
/usr/bin/mc cp /entrypoint-init.d/samples/github/octocat/Hello-World.json myminio/samples/github/octocat_Hello-World.json
