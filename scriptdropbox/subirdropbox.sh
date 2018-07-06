#!/bin/bash
hoy=$(date +%Y%m%d)
hora=$(date +%Y%m%d_%H:%M:%S)
fichero=$1
camara=$2
mascara=MOV
dias_para_borrado=2
borrado=$(date --date="${dataset_date} -${dias_para_borrado} day" +%Y%m%d)
dias_para_borrado=6
borradodropbox=$(date --date="${dataset_date} -${dias_para_borrado} day" +%Y%m%d)
carpeta=/home/homeassistant/dropbox/dropbox
carpetascr=/home/homeassistant/dropbox/scriptdropbox
carpetawww=/home/homeassistant/.homeassistant/www/files

echo ${fichero} ${camara} ${hoy}
sudo mkdir ${carpeta}/${hoy}
sudo mkdir ${carpeta}/${hoy}/${camara}
sudo bash ${carpetascr}/dropbox_uploader.sh mkdir DeteccionMovimiento/${hoy}/${camara}
sudo bash ${carpetascr}/dropbox_uploader.sh upload ${fichero} DeteccionMovimiento/${hoy}/${camara}/${hora}.mp4
wait
sudo mkdir ${carpetawww}/${camara}
sudo cp -rf ${fichero} ${carpetawww}/${camara}/${hora}.mp4
wait
sudo mv ${fichero} ${carpeta}/${hoy}/${camara}/${hora}.mp4

separador="${fichero%-*}"
id=${separador##*-}
sudo bash ${carpetascr}/dropbox_uploader.sh upload /tmp/motion/${camara}/*${hoy}*${id}* DeteccionMovimiento/${hoy}/${camara}/${hora}.jpg
wait
sudo cp -rf /tmp/motion/${camara}/*${hoy}*${id}* ${carpetawww}/${camara}/${hora}.jpg
echo ${id} ${hora}.jpg ${hora} ${hora}.mp4 ${carpetawww}/${camara}/${camara}.json
sudo bash ${carpetascr}/insertarlineajson.sh ${hora}.jpg ${hora} ${hora}.mp4 ${carpetawww}/${camara}/${camara}.json
wait
sudo mv /tmp/motion/${camara}/*${hoy}*${id}* ${carpeta}/${hoy}/${camara}/${hora}.jpg

sudo bash ${carpetascr}/eliminarlineajson.sh ${borrado} ${carpetawww}/${camara}/${camara}.json
sudo rm ${carpetawww}/${camara}/${borrado}_*
sudo bash ${carpetascr}/dropbox_uploader.sh delete DeteccionMovimiento/${borrado}

if [[ ${fichero} =~ ${mascara} ]]; then
 sudo cp -rf ${carpetawww}/${camara}/${hora}.mp4 ${carpetawww}/${mascara}/${hora}.mp4
 sudo cp -rf ${carpetawww}/${camara}/${hora}.jpg ${carpetawww}/${mascara}/${hora}.jpg
 sudo bash ${carpetascr}/insertarlineajson.sh ${hora}.jpg ${hora} ${hora}.mp4 ${carpetawww}/${mascara}/${mascara}.json
 sudo bash ${carpetascr}/eliminarlineajson.sh ${borrado} ${carpetawww}/${mascara}/${mascara}.json
 sudo rm ${carpetawww}/${mascara}/${borrado}_*
fi
sudo rm -rf ${carpeta}/${borradodropbox}
