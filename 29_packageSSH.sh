# ! /bin/bash
# Programa para ejemplificar la forma de como transferir por la red utilizando el comando rsync, utilizando las opciones de empaquetamiento para optimizar la velocidad de transferencia
# Profesor: Marco Toscano Freire - @martosfre

echo "Empaquetar todos los scripts de la carpeta shellCourse y transferirlos por la red a otro equipo utilizando el comando rsync"

host=""
usuario=""

read -p "Ingrese el host: " host
read -p "Ingrese el usuario" usuario
echo -e "\nEn este momento se procedera a empaqueta la carpeta y transferirla segun los datos ingresados"

rsync -avz $(pwd) $usuario@$host:/home/debian/
