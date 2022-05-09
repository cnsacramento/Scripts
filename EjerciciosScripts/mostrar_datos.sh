#!/bin/bash

# NOMBRE: mostrar_datos.sh
# OBJETIVO: Imprime por pantalla los argumentos indicados
#	y añade la fecha, hora actual y carga del sistema
# AUTOR: Christian y Oliver
# FECHA: 2022-05-09

# ENTRADAS(2): 1. arg1; 2. arg2
# SALIDAS: Argumentos solicitados

# VERSIONES: 1.0.0


#######################################################

arg1=$1
arg2=$2
error_args=1

if [[ $# -lt 2  || $# -lt 1 ]]
then
	exit $error_args
else
	echo -n "$(date '+Fecha: %y-%m-%d    Hora: %T')"
	echo "  Carga del sistema: $(uptime | tr -s " " ";" | cut -d ";" -f 10,11,12 | tr -s ";" " ")"
	echo "Argumento 1: $1 y Argumento 2: $2"
	exit 0
fi
