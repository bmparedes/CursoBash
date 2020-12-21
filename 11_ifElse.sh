# !/bin/bash
# Programa para ejemplificar el uso de la setencia de decision if, else
# Profesor: Marcos Toscano Freire - @martosfre

notaClase=0
edad=0

echo "Ejemplo Sentencia if - else"
read -n1 -p "Indique cual es su nota (1-9): " notaClase
echo -e "\n"
if (( $notaClase >= 7 )); then
    echo "El alumno aprueba la materia"
else
    echo "El alumno reprueba la materia"
fi

read -p "Indique cual es su edad: " edad
if [ $edad -le 18 ]; then
    echo "La persona no puede sufragar"
else
    echo "La persona si puede sufragar"
fi
