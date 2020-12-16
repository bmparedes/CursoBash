# !/bin/bash
# Programa para revisar como ejecutar comandos dentro de un programa y almacenarlos en una variable para su posterior utilizacion. 
# Profesor: Marco Toscano - @martosfre

ubicacionActual=`pwd` 
infoKernel=$(uname -a)

echo "La ubicacion actual es la siguiente: $ubicacionActual"
echo "Informacion del Kernel: $infoKernel"
