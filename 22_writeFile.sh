# ! /bin/bash
# Programa para ejemplificar como se escribe en un archivo. 
# Profesor: Marco Toscano Freire - @martosfre

echo "Escribir en un archivo"

echo "Valores escritos con el comando echo" >> $1

#Adicion multilinea
cat <<EOM >>$1
$2
EOM

