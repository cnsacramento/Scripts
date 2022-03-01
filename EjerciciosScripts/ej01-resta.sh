#!/bin/bash

# NOMBRE: resta.sh
# OBJETIVO: Se recogen dos argumentos y devuelve su resta
# AUTOR: Christian Novo Sacramento
# FECHA: 25/01/2022

# ENTRADAS(2): 1: Primer número que resta, 2: Segundo número de la resta
# SALIDAS:

# VERSIONES:


#######################################################


NUMERO1=$1
NUMERO2=$2

# Comprobación de argumentos


if [ "$#" -le 0 ];
then
	echo "ERROR!!! (Hay que introducir 2 parámetros)"
	read -p "Número 1: " NUMERO1
	read -p "Número 2: " NUMERO2
elif [ $# -le 1 ];
then
	echo "ERROR!!! (Falta el segundo parámetro)"
	read -p "Número 2: " NUMERO2
fi
echo "El resultado de $NUMERO1 - $NUMERO2 es: " $(($NUMERO1 - $NUMERO2))
