#!/bin/bash

declare -a dependencies=("kafka-python")

echo 'Installing libraries needed for this project...'

for val in ${dependencies[@]}; do
   echo "Installing $val ..."
   pip install $val
done

