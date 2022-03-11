#!/bin/bash

# NOMBRE: ej05-calcula_tiempos.sh
# OBJETIVO:Convertir segundos a días,horas,minutos,segundo. 
# AUTOR: Alejandro y Christian
# FECHA: 26/01/2022

# ENTRADAS(1): 1. Indica el número de segundos
# SALIDAS: Convierte los segundos en formato días,horas,minutos y segundo

# VERSIONES: 1.0

#######################################################

#Argumentos de Entrada
SEGUNDOS=$1

if [ $# -lt 1 ];
then
	echo "Parece que se te olvidó poner los segundos"
	read -p "Segundos: " SEGUNDOS
fi
# 1dia = 86400segundos, 1hora = 3600segundos, 1min = 60segundos
DIAS=$(($SEGUNDOS/86400))
MOD_DIAS=$(($SEGUNDOS%86400))
HORAS=$(($MOD_DIAS/3600))
MOD_HORAS=$(($MOD_DIAS%3600))
MINUTOS=$(($MOD_HORAS/60))
MOD_MINUTOS=$(($MOD_HORAS%60)) # El resto de los minutos son los segundos restantes
echo "$SEGUNDOS segundos son: $DIAS dias $HORAS horas $MINUTOS minutos $MOD_MINUTOS segundos"
