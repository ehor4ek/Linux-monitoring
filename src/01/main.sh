#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Wrong number of parameteres"
else
  if [[ $1 =~ (^([+-])?[0-9]+([.,][0-9]*)?$)|(^[+-]?[0-9]*([.,][0-9]+)$) ]] ; then
    echo "The parameter is number, it must be text"
  else
    echo $1
  fi
fi
