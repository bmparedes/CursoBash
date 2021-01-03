#!/bin/bash
#Programa que permite manejar utilidades varias.
#Autor: Brandom Paredes

opciones=0

programa=""
bk=""
nbk=""
dbk=""

while :
do

   #limpiar pantalla
   clear
   #desplegar el menú de opciones
   echo "--------------------------------"
   echo "         bparedes               "
   echo "--------------------------------"
   echo "           RETO 4               "
   echo "________________________________"
   echo "      Menú principal            "
   echo "________________________________"
   echo "1.- Procesos Actuales"
   echo "2.- Memoria Disponible"
   echo "3.- Espacio en Disco"
   echo "4.- Información de Red"
   echo "5.- Variables de Entorno Configuradas, "q" para salir "
   echo "6.- Información Programa, "q" para salir "
   echo "7.- Backup información"
   echo "8.- Salir"

#Leer los datos del usuario
   read -n1 -p "Ingrese una opción:(1-8)" opciones
   #validar la opcion ingresada
   case $opciones in
   1)
        echo -e "\nProcesos Actuales"
        ps axu
        sleep 5
        ;;
     2)
        echo -e "\nMemoria Disponible"
       free -h
       sleep 4
        ;;
     3)
        echo -e "\nEspacio en Disco"
       df -h
       sleep 4
        ;;
     4)
        echo -e "\nInformación de Red"
       ip a 
       sleep 4
        ;;
     5)
        echo -e "\nVariables de Entorno Configuradas"
        printenv | less
        sleep 2
        ;;

     6)
        echo -e "\nInformación Programa"
        read -p "Escriba el nombre del programa: " programa
        man $programa
        ;;

     7)
        echo -e "\nBackup información"
        echo -e "\nUsted se encuentra en `pwd`"
        read -p "Ingrese la direccion del archivo: " bk
        read -p "Ingresa un nombre para el bk: " nbk
        read -p "Ingrese la direccion para el backup" dbk
        tar -czf ${dbk}/${nbk}.tar.gz $bk
        echo "archivo backup guardado en $dbk"
        sleep 2
        ;;

     8)
        echo -e "\nHasta luego"
        sleep 1
        exit 0
        ;;

     *) echo -e "\nOpción no valida"
     sleep 1
   esac
done
