#!/bin/bash

python3 -m venv env
source env/bin/activate
pip3 install hidapi
pip3 install adafruit-blinka
pip3 install adafruit-circuitpython-mmc56x3