#!/bin/bash

source env/bin/activate
export BLINKA_MCP2221="1"
python3 read.py
