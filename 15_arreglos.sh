# ! /bin/bash
# Programa para ejemplificar el uso de los arreglos
# Profesor: Marco Toscano Freire - @martosfre

arregloNumeros=(1 2 3 4 5 6)
arregloCadenas=(Brandon, Antonio, Pedro, Maria)
arregloRangos=({A..Z} {10..20})

# Imprimir todos los valores
echo "Arreglo de numeros: ${arregloNumeros[*]}"
echo "Arreglo de Cadenas: ${arregloCadenas[*]}"
echo "Arreglo de Rangos: ${arregloRangos[*]}"

# Imprimir los tamaños de los arreglos
echo "Tamaño Arreglo de Numeros: ${#arregloNumeros[*]}"
echo "Tamaño Arreglo de Cadenas: ${#arregloCadenas[*]}"
echo "Tamaño Arreglo de Rangos: ${#arregloRangos[*]}"

# Imprimir la posicion 3 del arreglo de numero, cadenas de rango
echo "Posicion 3 Arreglo de numeros: ${arregloNumeros[3]}"
echo "Posicion 3 Arreglo de Cadenas: ${arregloCadenas[3]}"
echo "Posicion 3 Arreglo de Rangos: ${arregloRangos[3]}"

# Añadir y eliminar valores en un arreglo
arregloNumeros[7]=20
unset arregloNumeros[0]
echo "Arreglo de numeros: ${arregloNumeros[*]}"
echo "Tamaño arreglo de numeros: ${#arreglonumeros[*]}"


