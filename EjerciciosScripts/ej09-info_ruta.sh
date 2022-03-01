#!/bin/bash

# NOMBRE: ej09-info_ruta.sh
# OBJETIVO: Recibe un argumento e indica cierta información
# AUTOR: Christian Novo Sacramento
# FECHA: 2022-02-01

# ENTRADAS(1): 1. Parámetro
# SALIDAS: 1. Indica si se ha introducido un argumento(En caso de no muestra erro y aborta)
# 2.Indica si el argumento existe o no en el disco (si no existe muestra error y se aborta)
# 3. Si existe, si es un fichero, directorio, enlace simbólico o "tipo especial/"
# 4 Si tiene o no cada uno de los permisos(lectura,escritura y/o ejecución
# 5 Si esta vacío o no

# VERSIONES: 1.0


#######################################################

ARGUMENTO=$1
# Se crean los errores que pueden existir en caso de que no haya errores 
# se retorna 0 y si hay errores se retorna un número distinto. Ej:1,2,3...
ERROR_NO_EXISTE=1
ERROR_NO_ENCONTRADO=2

# Se comprueba si el argumento está vació
if [[ -z $ARGUMENTO ]]
then
	echo "Error!!!! (No se ha introducido ningún argumento)"
	exit $ERROR_NO_EXISTE
elif [[ -e find -iname $ARGUMENTO ]]
then
	echo "Error!!! (El argumento no encontrado)"
	exit $ERROR_NO_ENCONTRADO
fi
