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

if [[ -z $ARG && $# -gt 1 && $ARG != "CPU" && $ARG != "MEM" && $ARG && "TIME" ]]
then
	ARG="CPU"
	echo "Está vacío"
fi

if [[ $ARG = "CPU" ]]
then
	echo "Es la CPU"
	#Indica el número de la columna en el que se encuntra el CPU en ps aux
	COLUMN=3
	# Obtiene la información del comando ps aux referente a la CPU
	info=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El proceso que más %CPU está consumiendo es: ' ${info[10]} 'con un ' ${info[2]} '%'
elif [[ $ARG = "MEM" ]]
then
	# Indica la columna de la RAM
	COLUMN=4
	info=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El proceso que más %MEM está consumiendo es: ' ${info[10]} 'con un ' ${info[3]} '%' 
elif [[ $ARG = "TIME" ]]
then
	#Indica la columna donde se encuntra el TIME en ps aux
	COLUMN=10
	info=(`ps aux | tr -s " " | tail -n +2 | sort -hrk $COLUMN | head -n 1`)
	echo 'El procesos que más tiempo lleva activo es: ' ${info[10]} 'durante' ${info[9]} 'minutos'
fi

