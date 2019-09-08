#!/bin/bash

init(){
  printf "# -*- coding: utf-8 -*-\n\n" > __init__.py
  for file in $(ls | grep -v "__init__.py"); do
    echo "from .${file%.*} import *">> __init__.py;
  done
}

