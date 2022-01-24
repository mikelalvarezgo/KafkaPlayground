#!/bin/bash

echo 'Creating helloworld topic in kafka...'
docker exec -it kafka kafka-topics.sh --zookeeper  zookeeper:2181 --create --topic helloworld --partitions 3 -replication-factor 1

echo 'Verify topic created ...'
docker exec -it kafka kafka-topics.sh --zookeeper zookeeper:2181 --list
