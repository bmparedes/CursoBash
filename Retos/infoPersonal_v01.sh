# !/bin/bash
# Solicitar nombre, apellido, edad, direccion y numero telefonico; y posterior imprimir toda la informacion.
# Autor: Brandom Paredes

# Variables
nombre=""
apellido=""
edad=0
direccion=""
telefono=0

echo "Informacion personal del usuario"
read -p "Ingrese su Nombre: " nombre
read -p "Ingrese su Apellido:" apellido
read -p "Ingrese su edad:" edad
read -p "Ingrese su Direccion:" direccion
read -p "Ingrese su Numero Telefonico:" telefono
echo -e "\n"
echo "Bienvenido $nombre $apellido, su edad es $edad, vive en $direccion y su numero telefonico es $telefono"
