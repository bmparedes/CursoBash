# !/bin/bash
# Reto 3: Solicitar que se ingrese un valor del 1 al 5. Según el valor ingresado valor a validarlo utilizando las condicionales e imprimir según el valor ingresado. Construir expresiones de validaciòn númericas, cadenas y archivos según la opción ingresada.
# Se uso la base del Reto 2. 
# Autor: Brandom Paredes

# Variables iniciales
opcion=0

nombre=""
edad=0
pais=""
telefono=0
pathArchivo=""

# VariablesRegex
nombreRegex="^[Aa-Zz]+$"
edadRegex="^[0-9]$"
paisSur="AR|BO|COL|CL|EC|UR|PE|VE|BR$"
paisNor="CA|MX|EEUU$"
tlfRegex="^[0-9]{15}$"

# Variables Complemento
ano=2020
nacimiento=0

echo "Informacion personal del usuario"
echo -e "\n"
read -p "Elija una opcion (1 -> 5): " opcion
    case $opcion in
        "1") read -p "Ingrese su nombre: " nombre
             if [[ $nombre =~ $nombreRegex ]]; then
                echo "Nombre Valido"
            else 
                echo "Nombre Invalido"
            fi;;
         "2") read -n2 -p "Ingrese su edad: " edad
              nacimiento=$(($ano - $edad))
              if [[ $edad =~ $edadRegex && $edad -lt 18 ]]; then
                echo -e "\nUsted nacio en el año: $nacimiento y es un menor de edad"
                elif [[ $edad -ge 18 && $edad -le 65 ]]; then
                    echo -e "\nUsted es un adulto y nacio en $nacimiento"
                else
                    echo -e "\nUstedes se encuentra en la tercera edad, nacio en $nacimiento"
                fi;;
          "3") read -p "Ingrese las siglas de su Pais: " pais
                if [[ $pais =~ $paisSur ]]; then
                    echo -e "\nUsted vive en el Sur de America"
                elif [[ $pais =~ $paisNor ]]; then
                    echo -e "\nUsted vive en el Norte de America"
                else
                    echo -e "\nSe desconoce su nacionalidad"
                fi;;
           "4") read -p "Ingrese su numero de telefono (15 digitos): +" telefono
                if [[ $telefono =~ $tlfRegex ]]; then
                    echo -e "\nSu telefono es aceptado"
                else
                    echo -e "\nSe telefono $telefono fue rechazado, vuelve a intentar" 
                fi;;
           "5") read -p "Ingrese su directorio de archivos: " pathArchivo
                if [ -d $pathArchivo ]; then
                    echo "El directorio $pathArchivo existe"
                else 
                    echo "El directorio $pathArchivo no existe"
                fi;;
            *) echo -e "\nOpcion incorrecta"
esac
