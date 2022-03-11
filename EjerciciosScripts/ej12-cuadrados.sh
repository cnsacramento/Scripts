#!/bin/bash

# NOMBRE: ej12-cuadrados.sh
# OBJETIVO: hallar valores pares entre 2 números
# AUTOR: Alejandro y Christian
# FECHA: 2022/03/04

# ENTRADAS(numDatos): 1. Número 1, 2. Número2
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

NUM_1=$1
NUM_2=$2
AUX=($NUM_2 - 1)

if [[ $# -lt 2]]
then
if [[ $NUM_1 -gt $NUM_2 ]]
then
	echo "ERROR! El número 1 es mayor que el número 2"
else
	echo "Los valores pares entre $NUM_1 y $NUM_2 son:"
	while (($AUX -ne 0))
	do
	if [[ $(($AUX % 2)) -eq 0 ]]
	then
		echo "$AUX"
	fi
	AUX = AUX - 1
	done
fi
fi
