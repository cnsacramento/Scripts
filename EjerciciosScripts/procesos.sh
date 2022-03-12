#!/bin/bash

# NOMBRE: procesos.sh
# OBJETIVO: (poner lo que hace el Script)
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

ARG=$1

# Desactivan el comando kill
#

#Comprueba que el argumento no está vacío, no hay más de un argumento
#Y también controla que el argumento que se introduzca sea CPU/MEM/TIME
if [[ -z $ARG || $# -gt 1 || $ARG != "CPU" || $ARG != "MEM" || $ARG != "TIME" ]]
then
	ARG="CPU"
fi

if [[ $ARG = "CPU" ]] #Muestra el proceso que más CPU está consumiendo
then
	#Indica el número de la columna en el que se encuentra el CPU en ps aux
	COLUMN=3
	# Obtiene la información del comando ps aux referente a la CPU
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El proceso que más %CPU está consumiendo es: ' ${INFO[10]} 'con un ' ${INFO[2]} '%'
        for i in {0..3};do #Bucle que muestra la información en pantalla
                echo $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
        done
	for i in {7..10};do #Continuación del bucle anterior
		echo $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
	done
elif [[ $ARG = "MEM" ]] #Muestra el proceso que más memoria está consumiendo
then
	# Indica la columna de la RAM
	COLUMN=4
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El proceso que más %MEM está consumiendo es: ' ${INFO[10]} 'con un ' ${INFO[3]} '%'
	for i in {0..3};do
		echo $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
	done
	for i in {7..10};do
                echo $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
        done
elif [[ $ARG = "TIME" ]] #Muestra el proceso que más tiempo lleva activo
then
	#Indica la columna donde se encuntra el TIME en ps aux
	COLUMN=10
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El procesos que más tiempo lleva activo es: ' ${INFO[10]} 'durante' ${INFO[9]} 'minutos'
        echo 'El proceso que más %MEM está consumiendo es: ' ${INFO[10]} 'con un ' ${INFO[3]} '%'
        for i in {0..3};do
                echo $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
        done
	for i in {7..10};do
                echo  $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':' ${INFO[$i]}
        done
fi

CONTINUAR=true
while ($CONTINUAR)
do
	echo "#################################################"
	echo "#                     MENÚ                      #"
	echo "#################################################"
	echo "# 1. Interrumpir proceso                        #"
	echo "# 2. Terminar proceso                           #"
	echo "# 3. Matar el proceso                           #"
	echo "# 4. Detener y pasar el proceso a segundo plano #"
	echo "# 5. Reanudar el proceso en segundo plano       #"
	echo "# 6. Pasar el proceso a segundo plano           #"
	echo "# 7. Asignarle la pero prioridad                #"
	echo "# 8. Evitar muerte al cerrar la shell           #"
	echo "# 9. Salir                                      #"
	echo "#################################################"
	read -p "Opción: " OPCION
	printf "\033c" # Secuencia para limpiar terminal
	case $OPCION in
		1)
		  ;;
		2)
		  ;;
		3)
		  pkill ${INFO[10]}
		  echo 'El proceso:' ${INFO[10]} 'se ha eliminado correctamente.'
		  ;;
		4)
		  ;;
		5)
		  ;;
		6)
		  ;;
		7)
		  ;;
		8)
		  
		  ;;
		9)
		  CONTINUAR=false
		  echo "No tengas un buen día, ten un gran día"
		  ;;
		*)
		  echo "Opción no válida. Prueba de nuevo"
		  ;;
	esac
done
