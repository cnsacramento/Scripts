#!/bin/bash

# NOMBRE: ejer09-info_ruta.sh
# OBJETIVO: (poner lo que hace el Script)
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

numParams=1
ERROR_SINTAXIS=1
ERROR_NO_EXISTE=2
# Se comprueba que se tiene el número de parámetros adecuados
if [ "$#" -ne 1 ]
then
	echo"Error!!!!!"
	echo"Sintaxis: $0 ruta"
	exit $ERROR_SINTAXIS
fi

# Se captura la ruta
ruta=$1

if ! [ -e "$ruta" ]
then
	echo "Error!! La ruta $ruta no existe"
	exit $ERROR_NO_EXISTE
fi

# Se indica el tipo

if [ -f "$ruta" ]
then
	echo"$ruta es un fichero"
elif [ -d "$ruta" ]
then
        echo"$ruta es un directorio"
elif [ -h "$ruta" ]
then
	echo "$ruta es un enlace"
else
	echo "$ruta es un tipo especial"
fi

# Permisos

echo -n " - Permiso de lectura: "
if [ -r "$ruta" ]
then
	echo "Si"
	permisos="w"
else
	echo "No"
	permisos="-"
fi
