#! /bin/bash
# Programa que permite manejar las utilidades de Postgres
# Profesor: Marco Toscano Freire - @martosfre

opcion=0
fechaActual=`date +%Y%m%d`

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
    echo "Listar las bases de datos"
    sudo -u postgres psql -c "\l"
    read -p "Elegir la base de datos a respaldar: " bddRespaldo
    echo -e "\n"
    if [[ -d "$1" ]]; then
        echo "Establecer persmisos al directorio"
        echo "$password" | sudo -S chmod 755 $1 
        echo "Realizando respaldo..."
        sudo -u postgres pg_dump -Fc $bddRespaldo > "$1/bddRespaldo$fechaActual.bak"
        echo "Respaldo realizado correctamente en la ubicacion: $1/bddRespaldo$fechaActual"

    else
        echo "El directorio $1 no existe"
    fi
        read -n1 -s -r -p "PRESIONES [ENTER] para continuar..."
}

# Funcion para restaurar un respaldo
restaurar_respaldo () {
read -p "Ingresar el directorio donde se encuentran los respaldos   " directorioBackup
if [ -d $directorioBackup ]; then

echo "Listando los archivos de Respaldos..."
sleep 3
ls -la $directorioBackup
read -p "Ingresar el archivo .bak a restaurar:  " respaldoRestaurar
#echo -e "\n"
if [ -f "$directorioBackup/$respaldoRestaurar" ]; then

        read -p "Ingresar nombre BD destino:  " bdDestino
        verifyBdd= $(sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -wq $bdDestino)
        if [ $? -eq 0 ]; then
                  echo "Restaurando en la Base de Datos destino...$bdDestino"
                  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
                  echo "Listar Bases de datos..."
                  sudo -u postgres psql -c "\l"
           else
                  echo  "La BD destino no se encuentra..."
                  echo  "Creando Base de Datos destino..."
                  sleep 4
                  sudo -u postgres psql -c "CREATE DATABASE $bdDestino"
                  sudo -u postgres pg_restore -Fc -d $bdDestino "$directorioBackup/$respaldoRestaurar"
                  echo "Listar Bases de datos..."
                  sudo -u postgres psql -c "\l"
          fi

else
        echo "No se encuentra el archivo de Respaldo Ingresado"
        echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
fi
else
        echo "No se encuentra el directorio de Respaldos ingresado..."
        echo "Verifique nuevamente el nombre y vuelva a intentarlo..."
fi

read -n 1 -s -r -p "Presione [ENTER] para continuar..."

}

lista_de_BD(){

echo -e  "\Las Bases de Datos Actuales: "
sudo -u postgres psql -c "\l"
read -n 1 -s -r -p "Presione [ENTER] para continuar..."
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

