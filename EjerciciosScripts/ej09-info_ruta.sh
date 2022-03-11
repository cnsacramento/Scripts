#!/bin/bash

# NOMBRE: ej09-info_ruta.sh
# OBJETIVO: Recibe un argumento e indica cierta información
# AUTOR: Alejandro y Christian
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
readonly NUM_PARAMS=1
readonly ERROR_SINTAXIS=1
readonly ERROR_NO_EXISTE=2

# Compruebo que tengo el número de parámetros adecuado
if [ "$#" -ne "$NUM_PARAMS" ]
then
	echo "ERRRORRRRR!!!!!"
	echo "Sintaxis: $0 ruta"
	exit $ERROR_SINTAXIS
fi

# Capturo la ruta
ruta=$1

# Compruebo si existe
if ! [ -e "$ruta" ]
then
	echo "ERROR!!! La ruta $ruta no existe"
	exit $ERROR_NO_EXISTE
else
	echo "$ruta SÍ Existe"
fi

# Indico el tipo

if [ -f "$ruta" ]
then
	echo "$ruta es un fichero"
elif [ -d "$ruta" ]
then
	echo "$ruta es un directorio"
elif [ -h "$ruta" ]
then
	echo "$ruta es un enlace"
else
	echo "$ruta es un tipo especial"
fi

#### PERMISOS

permisos=""

echo -n " - Permiso de lectura: "
if [ -r "$ruta" ]
then
	echo "SÍ"
	permisos="r"
else
	echo "NO"
	permisos="-"
fi
echo -n " - Permiso de escritura: "
if [ -w "$ruta" ]
then
	echo "SÍ"
	permisos+="w"
else
	echo "NO"
	permisos+="-"
fi
echo -n " - Permiso de ejecución/acceso: "
if [ -x "$ruta" ]
then
	echo "SÍ"
	permisos+="x"
else
	echo "NO"
	permisos+="-"
fi
echo "Los permisos de ruta son: $permisos"

if [ -r "$ruta" ] && [ -w "$ruta" ] && [ -x "$ruta" ]
then
	echo "Tiene TODOS los permisos (rwx)"
fi


if [ -s "$ruta" ]
then
	echo "$ruta NO está vacío"
else
	echo "$ruta SÍ está vacío"
fi
