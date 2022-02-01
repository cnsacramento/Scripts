#!/bin/bash

# NOMBRE: resta.sh
# OBJETIVO: Se recogen dos argumentos y devuelve su resta
# AUTOR: Christian Novo Sacramento
# FECHA: 25/01/2022

# ENTRADAS(2): 1: Primer número que resta, 2: Segundo número de la resta
# SALIDAS:

# VERSIONES:


#######################################################


numero1=$1
numero2=$2

# Comprobación de argumentos

if [ $# -le 0 ];
then
	echo "Hay que introducir 2 parámetros"
fi
echo "El resultado de $numero1 - $numero2 es: " $(($numero1 - $numero2))
