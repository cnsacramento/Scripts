#!/bin/bash

# NOMBRE: practicaII.sh
# OBJETIVO: Comprobar si un paquete está instalado, mostrar menú con opción de
# actualizar, reinstalar eliminar dejando configuración, eliminar por completo y salir
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): 1. Nombre paquete
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

NOMBRE_PAQUETE=$1
ERROR_ARGS=1

echo ""
if [[ $# -lt 1  ]]
then
	echo "Prueba a escribir el argumento"
	exit $ERROR_ARGS
fi

if [[ $(dpkg -s $NOMBRE_PAQUETE | grep Status) == "Status: install ok installed" ]]
then
	echo "El paquete está instalado"
	echo "La versión instalada es:" $(dpkg-query -W $NOMBRE_PAQUETE)

while ( true )
do
	echo ""
	echo "========================================="
	echo "||                 MENÚ                ||"
	echo "========================================="
	echo "|| 1. Actualizar                       ||"
	echo "|| 2. Reinstalar                       ||"
	echo "|| 3. Eliminar (dejando configuración) ||"
	echo "|| 4. Eliminar (totalmente)            ||"
	echo "|| 5. Salir                            ||"
	echo "========================================="
	read -p "Opción: " OPCION
	case $OPCION in
		1)
		  echo ""
		  echo "Se comienza la actualización"
		  sudo apt-get update
		  sudo apt-get install --only-upgrade $NOMBRE_PAQUETE
		  ;;
		2)
		  echo ""
		  echo "Se comienza la reinstalación"
		  sudo apt-get update
    		  sudo apt-get install --reinstall $NOMBRE_PAQUETE
		  ;;
		3)
		  echo ""
		  echo "Se comienza la eliminación sin eliminar configuración"
		  sudo apt-get remove $NOMBRE_PAQUETE
		  sudo apt-get update
		  sudo apt-get autoremove
		  ;;
		4)
		  echo ""
		  echo "Se comienza la eliminación total"
		  sudo apt-get purge $NOMBRE_PAQUETE
		  sudo apt-get update
		  sudo apt-get autoremove
		  ;;
		5)
			break
		  ;;
		*)
			echo "Parece que has escogido una opción no válida. Prueba de nuevo"
	esac

done
else
	echo "El paquete no está instalado"
fi
