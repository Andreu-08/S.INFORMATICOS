#!/bin/bash
#No escribir aquí
select_random_movies(){

	local new_maxfilas=$1
    	numrdn=$(( RANDOM % $new_maxfilas ))
	head -$numrdn netflix.csv | tail -1
	

}
    
select_movies_by_year(){
	echo "Indica el año"
	
	read year
	
	if (($year >=1950 && $year <= 2024)) 
	
	then
	
	grep "$year" netflix.csv 
	
	else 
	  
	echo "año no valido. Cerrando el programa"
	
	fi
}


maxfilas="$(wc -l < netflix2.csv)"
maxfilas=$((maxfilas -1))
tail -$maxfilas netflix2.csv | sort | uniq > netflix.csv




new_maxfilas="$(wc -l < netflix.csv)"
		
# Mostrar menú de opciones al usuario
echo "Netflix"
echo "1.Recomendacion rapida"
echo "2.Listar por año"
echo "Ingrese el numero de la opcion deseada: "

read option

	
case $option in
    	1) select_random_movies $new_maxfilas ;;
    	2) select_movies_by_year ;;
    	*) echo "Opción no válida. Saliendo del programa." ;;
esac
