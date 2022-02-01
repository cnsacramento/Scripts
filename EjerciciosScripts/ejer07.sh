#!/bin/bash

# NOMBRE: ejer07
# OBJETIVO: Pedir dos argumentos y si no se le pasa 1 pedir por teclado,
# el script debe decir cuál de los dos números es mayor o sin son iguales
# AUTOR: Christian Novo Sacramento
# FECHA: 2022-02-01

# ENTRADAS(2): 1.Numero 1, 2. Numero 2
# SALIDAS: Pedir si falta algún argumento y mostrar el mayor o igual

# VERSIONES: 1.0


#######################################################


numero1=$1
numero2=$2

if [ $# -eq 0  ]
then
	echo"Dame el parámetro 1: "
	read numero1
	read -p "Dame el parámetro 2: " numero2
elif [ $# -eq 1 ]
then
	echo "Error!! Te falta un parámetro"
	read -p "Dame el parámetro que te falta" numero2
fi

if [[ numero1 -gt numero2 ]]
then
	echo "$numero1 es mayor que $numero2"
elif [[ numero1 -eq numero2 ]]
then
	echo "$numero1 es igual que $numero2"
else
	echo "$numero2 es mayor que $numero1"
fi
