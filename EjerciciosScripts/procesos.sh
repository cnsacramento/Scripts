#!/bin/bash

# NOMBRE: procesos.sh
# OBJETIVO: Obtener el proceso que más CPU/MEM/TIME contenga y ejercer acciones sobre dicho proceso
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

ARG=$1

# Desactivan el comando kill
trap 'echo Prueba a usar la opción 9 del menú' INT
trap 'echo Buen intento pero tienes que usar la opción 9 del menú' 15

#Comprueba que el argumento no está vacío, no hay más de un argumento
#Y también controla que el argumento que se introduzca sea CPU/MEM/TIME
if [[ -z $ARG || $# -gt 1 || $ARG != "CPU" && $ARG != "MEM" && $ARG != "TIME" ]]
then
	ARG="CPU"
fi

if [[ $ARG = "CPU" ]] #Muestra el proceso que más CPU está consumiendo
then
	#Indica el número de la columna en el que se encuentra el CPU en ps aux
	COLUMN=3
	# Obtiene la información del comando ps aux referente a la CPU
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo -e '\e[34mEl proceso que más %CPU está consumiendo es:\e[32m ' ${INFO[10]} '\e[34mcon un\e[32m ' ${INFO[2]} '\e[34m%\e[0m'
        for i in {0..3};do #Bucle que muestra toda la información del proceso
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
        done
        for i in {7..10};do
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
        done
elif [[ $ARG = "MEM" ]] #Muestra el proceso que más memoria está consumiendo
then
	# Indica la columna de la MEM
	COLUMN=4
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo -e '\e[34mEl proceso que más %MEM está consumiendo es: \e[32m' ${INFO[10]} '\e[34mcon un \e[32m' ${INFO[3]} '\e[34m%\e[0m'
	for i in {0..3};do
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
        done
        for i in {7..10};do
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
        done
elif [[ $ARG = "TIME" ]] #Muestra el proceso que más tiempo lleva activo
then
	#Indica la columna donde se encuentra el TIME en ps aux
	COLUMN=10
	INFO=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo -e '\e[34mEl procesos que más tiempo lleva activo es:\e[32m ' ${INFO[10]} '\e[34mdurante\e[32m' ${INFO[9]} '\e[34mminutos\e[0m'
        for i in {0..3};do
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
        done
	for i in {7..10};do
                echo -e '\e[34m' $(ps aux | tr -s " " | cut -f $(( $i + 1 )) -d " " | head -n 1)':\e[32m' ${INFO[$i]} '\e[0m'
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
	echo "# 7. Asignarle la peor prioridad                #"
	echo "# 8. Evitar muerte al cerrar la shell           #"
	echo "# 9. Salir                                      #"
	echo "#################################################"
	read -p "Opción: " OPCION
	printf "\033c" # Secuencia para limpiar terminal
	echo -e "\n"
	case $OPCION in
		1) #Detiene el proceso
		  pkill -STOP ${INFO[10]}
		  if [[ $? -eq 0 ]]
		  then
			echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mse ha detenido\e[0m'
		  else
			echo -e "\e[31mOupss, parece que no se ha podido detener el proceso\e[0m" ${INFO[10]}
		  fi
		  ;;
		2)
		  ;;
		3) #Mata el proceso
		  pkill -SIGKILL ${INFO[10]}
		  if [[ $? -eq 0 ]]
		  then
		    	echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mse ha eliminado correctamente.\e[0m'
		  else
			echo -e '\e[31mParece que no se puede eliminar el proceso:\e[0m' ${INFO[10]}
		  fi
		  ;;
		4) #Detiene y pone en segundo plano el proceso
		  pkill -STOP ${INFO[10]}
		  pkill -CONT ${INFO[10]}
		  if [[ $? -eq 0 ]]
		  then
			echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mse ha detenido y puesto en segundo plano correctamente.\e[0m'
                  else
                        echo -e '\e[31mParece que no se puede poner el proceso:\e[0m' ${INFO[10]} '\e[31men segundo plano\e[0m'
		  fi
		  ;;
		5)
		  fg ${INFO[10]}
		  if [[ $? -eq 0 ]]
                  then
                        echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mya se encuentra en primer plano.\e[0m'
                  else
                        echo -e'\e[31mParece que el proceso:\e[32m' ${INFO[10]} '\e[31mno se encontraba en segundo plano\e[0m'
                  fi
		  ;;
		6)
		  ;;
		7) #Cambia la prioridad del proceso a la peor de todas
		  renice -n 19 -p ${INFO[1]}
		  if [[ $? -eq 0 ]]
                  then
                        echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mdesde ahora tiene la peor prioridad de todas.\e[0m'
                  else
                        echo -e '\e[31mVaya, parece ser que no se le puede asignar la peor prioridad\e[32m' ${INFO[10]} '\e[0m'
                  fi
		  ;;
		8) #Impide que un proceso muera al cerrar la terminal
		  disown -h  ${INFO[10]}
		  if [[ $? -eq 0 ]]
                  then
                        echo -e '\e[34mEl proceso:\e[32m' ${INFO[10]} '\e[34mya no morirá al cerrar la terminal.\e[0m'
                  else
                        echo -e '\e[31mParece que no se puede prolongar la vida del proceso:\e32m' ${INFO[10]} '\e[0m'
                  fi
		  ;;
		9) #Sale del bucle
		  CONTINUAR=false
		  echo -e "\e[34mNo tengas un buen día, ten un gran día\e[0m"
		  ;;
		*)
		  echo -e "\e[31mOpción no válida. Prueba de nuevo\e[0m"
		  ;;
	esac
	echo
done
