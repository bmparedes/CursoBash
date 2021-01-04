# ! /bin/bash
# Modificar el archivo utilityHost.sh para escribir la información solicitada a un archivo de log cuyo nombre será log.
#Autor: Brandom Paredes.

option=$1
result=$2

log="Valor de la variable option: $option y el Valor de la variable result: $result"

echo $log >> $(date +"%Y_%M_%d_%h_%m_%s").log



