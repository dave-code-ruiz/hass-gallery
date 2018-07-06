#!/bin/bash

mascara=$1
ruta=$2
while read -r line
do
  [[ ! $line =~ ${mascara} ]] && echo "$line"
done <${ruta}> o 
sudo mv o ${ruta}
sudo sed -i 'x;${s/,$//;p;x;};1d' ${ruta}

