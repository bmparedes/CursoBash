#! /bin/bash
# Programa que permite manejar las utilidades de Postgres
# Profesor: Marco Toscano Freire - @martosfre

opcion=0

# Funcion para Instalar Postgres
instalar_postgres () {
    echo -e "\n Verificar instalacion postgres ..."
    verifyInstall=$(which psql)
    if [[ $? -eq 0 ]]; then
        echo -e "\n Postgress ya se encuentra instalado en el equipo"
    else
        read -s -p "Ingresar contraseña de sudo: " password
        read -s -p "Ingresar contraseña a utilizar en postgres: " passwordPostgres
        echo "$password" | sudo -S apt update
        echo "$passwordPostgres" | sudo -S apt-get -y install postgresql postgresql-contrib
        sudo -u postgres psql -c "ALTER USER postgres WITH PASSOWRD '{$passwordPostgres}':"
        echo "$password" | sudo -S systemctl enable postgresql.service
        echo "$password" | sudo -S systemctl start postgresql.service
    fi
    read -n1 -s -r -p "PRESIONES [ENTER] para continuar..."
}

# Funcion para desistalar postgres
desistalar_postgres () {
    read -s -p "Ingresar contraseña de sudo: " password
    echo -e "\n"
    echo "$password" | sudo -S systemctl stop postgresql.service
    echo "$password" | sudo -S apt-get -y --purge remove postgresql\*
    echo "$password" | sudo -S rm -r /etc/postgresql
    echo "$password" | sudo -S rm -r /etc/postgresql-common
    echo "$password" | sudo -S rm -r /var/lib/postgresql
    echo "$password" | sudo -S userdel -r postgres
    echo "$password" | sudo -S groupdel postgresql
    read -n1 -s -r -p "PRESIONES [ENTER] para continuar..."
}

# Funcion para sacar un respaldo
sacar_respaldo () {
    echo "Sacar respaldo..."
    echo "Directorio backup: $1"
}

# Funcion para restaurar un respaldo
restaurar_respaldo () {
    echo "Restaurar respaldo..."
    echo "Directorio respaldo: $1"
}

#while : realizas n bucle infinito
while :
do 
    # Limpiar la pantalla
    clear
    # Desplegar el menu de opciones
    echo "_________________________________________"
    echo "PGUTIL - Programa de Utilidad de Postgres"
    echo "_________________________________________"
    echo "               MENU PRINCIPAL            "
    echo "_________________________________________"
    echo "1. Instalar Postgres"
    echo "2. Desistalar Postgres"
    echo "3. Sacar un respaldo"
    echo "4. Restaurar respaldo"
    echo "5. Salir"

    #Leer los datos del usuario - Capturar informacion
    read -n1 -p "Ingrese una opcion [1-5]: " opcion

    #Validar la opcion ingresada 
    case $opcion in 
        1)
            instalar_postgres
            sleep 3  # sleep # realiza una congelacion segun la cantidad de tiempo en segundos
            ;;
        2)
            desistalar_postgres
            sleep 3
            ;;
        3)
            read -p "Directorio Backup: " directorioBackup
            sacar_respaldo $directorioBackup
            sleep 3
            ;;
        4)  
            read -p "Directorio de Respaldos: " directorioRespaldos
            restaurar_respaldo $directorioRespaldos
            sleep 3
            ;;
        5)
            echo -e "\nSalir del programa"
            exit 0
            ;;
    esac
done

