#!/bin/bash

# NOMBRE: ej03-dia_semana.sh
# OBJETIVO: Recoge una fecha y devuelve el día de la semana que fue en aquella época
# AUTOR: Christian Novo Sacramento
# FECHA: 25/01/2022

# ENTRADAS(3): 1: Día, 2: mes, 3: año
# SALIDAS: Devuelve el día de la semana según la fecha

# VERSIONES: 1.0


#######################################################


DIA=$1
MES=$2
ANYO=$3

if [ $# -le 0 ];
then
	echo "No has introducido ningún parámetro. Prueba a introducirlos: "
	read -p "Día: " DIA
	read -p "Mes: " MES
	read -p "Año: " ANYO
elif [ $# -le 1 ];
then
	echo "Falta introducir el MES y el AÑO"
	read -p "Mes: " MES
	read -p "Año: " ANYO
elif [ $# -le 2 ];
then
	echo "Falta introducir el año"
	read -p "Año: " ANYO
fi

FECHA=$ANYO-$MES-$DIA
echo "El día de la semana de la fecha indicada ($DIA/$MES/$ANYO) fue: $(date --date=$FECHA +%A)"

