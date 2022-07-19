#!/bin/bash

sudo yum install python38
/usr/bin/python3.8 -m venv venv
. venv/bin/activate
pip install -U pip
pip install ansible
ansible --version
