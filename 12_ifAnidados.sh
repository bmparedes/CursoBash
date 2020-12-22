# !/bin/bash
# Programa para ejemplificar el uso de los ifs anidados.
# Profesor: Marcos Toscano Freire - @martosfre

notaClase=0
continua=""

echo "Ejemplo Sentencia if - else"
read -n1 -p "Indique cual es su nota (1-9): " notaClase
echo -e "\n"
if [ $notaClase -ge 7 ]; then
    echo "El alumno aprueba la materia"
    read -p "Si va a continuar estudiando en el siguiente nivel (S/N)" continua
        if [ $continua = "S" ]; then
            echo "Bienvenido al siguiente nivel"
        else
            echo "Gracias por trabajar con nosotros"
        fi
else
    echo "El alumno reprueba la materia"
fi
