#!/bin/bash

# NOMBRE: crear_usuario
# OBJETIVO: Simular el dar de alta a un usuario
# AUTOR: Alejandro y Christian
# FECHA: 25/01/2022

# ENTRADAS(3): 1: nombre, 2: apellido, 3: usuario
# SALIDAS: Mensajes

# VERSIONES: 1.0


#######################################################

NOMBRE=$1
APELLIDO=$2
USUARIO=$3
ALEATORIO=$RANDOM
ERROR_ARG=1
if [ $# -lt 3 ]
then
	echo "Error!!! ¿Dónde se fueron los argumentos? "
	exit $ERROR_ARG
fi
echo "Bienvenido $NOMBRE"
echo "Tus datos son: $NOMBRE, $APELLIDO"
echo "Vamos a crear tu usuario $USUARIO"
echo "Tú nueva ID es $ALEATORIO"
