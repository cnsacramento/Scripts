#!/bin/bash

# NOMBRE: ej07-compara.sh
# OBJETIVO: Compara con un condicional 2 números
# AUTOR: Alejandro y Christian
# FECHA: 27/01/2022

# ENTRADAS(2): a: Número1, b: Número2
# SALIDAS: Compara dos números con un condicional

# VERSIONES: 1.0


#######################################################



NUMERO_1=$1
NUMERO_2=$2

if [[ $# -eq 0 ]];
then
	echo "Parece ser que los números se dieron a la fuga"
	read -p "Número 1: " NUMERO_1
	read -p "Número 2: " NUMERO_2
elif [[ $# -lt 2 ]];
then
	echo "Upss, puede ser que si no tenemos otro número no podamos comparar"
	read -p "Número 2: " NUMERO_2
fi
echo -e "\n"
if [[ NUMERO_1 -eq NUMERO_2 ]];
then
	echo "$NUMERO_1 es igual que $NUMERO_2"
elif [[ NUMERO_1 -gt NUMERO_2 ]];
then
	echo "$NUMERO_1 es mayor que $NUMERO_2"
else
	echo "$NUMERO_2 es mayor que $NUMERO_1"
fi
