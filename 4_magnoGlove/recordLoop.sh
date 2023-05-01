#!/bin/bash

source env/bin/activate
export BLINKA_MCP2221="1"

for i in {1..2}
do
   python3 record.py $1
   sleep 1
done
