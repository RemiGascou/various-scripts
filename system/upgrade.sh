#!/bin/bash
clear
yes | apt-get update
yes | apt-get upgrade
yes | apt-get dist-upgrade
yes | apt-get autoremove
