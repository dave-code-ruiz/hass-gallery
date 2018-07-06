#!/bin/bash

imagen=$1
titulo=$2
video=$3
fichero=$4
echo $1 $2 $3 $4
sudo sed -i.1 's/\[/\[\n{\"image\":\"'$imagen'\",\"title\":\"'$titulo'\",\"video\":\"'$video'\"\},/g' $fichero

