#!/bin/bash

docker-compose build --compress --force-rm --parallel
docker-compose up --detach --remove-orphans