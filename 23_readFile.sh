# ! /bin/bash
# Programa para ejemplificar como se lee en un archivo. 
# Profesor: Marco Toscano Freire - @martosfre

echo "Leer en un archivo"

cat $1
echo -e "\nAlmacenar los valores en una variable"
valorCat=`cat $1`
echo "$valorCat"

# Se utiliza la variable IFS (Internal Field Separator) para evitar que los espacios en blancos se recorte.
echo -e "\nLeer archivos linea por linea utilizando while"
while IFS= read linea
do
    echo "$linea"
done < $1

# Sin la variable especial IFS
echo -e "\nLeer archivos linea por linea utilizando while"
while read linea
do
    echo "$linea"
done < $1 
