# !/bin/bash
# Programa para ejemplificar el uso de la sentencia Case.
# Profesor: Marcos Toscano Freire - @martosfre

opcion=""


echo "Ejemplo Sentencia Case"
read -p "Ingrese una opcion de la A -> Z: " opcion
echo -e "\n"

case $opcion in
    "A") echo -e "\nOperacion Guardar Archivo";; 
    "B") echo "Operacion Eliminar archivo";;
    [C-E]) echo "No esta implementada la operacion";;
    *) "Opcion incorrecta";; # Si no cumple ninguna de las opciones
esac
