# ! /bin/bash
# Programa para ejemplificar el uso de los loops anidados.
# Profesor: Marco Toscano Freire - @martosfre

for file in $(ls *.sh)
do
	echo "--------------- $file ---------------------"
	while read -r linea; do
		echo "$linea"
	done < "$file"
done
