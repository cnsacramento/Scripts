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
	echo -e "\e[30m¿Dónde se fue el nombre del paquete?\e[0m"
	exit $ERROR_ARGS
fi

dpkg -l $NOMBRE_PAQUETE > /dev/null 2>&1
INSTALADO=$?
if [[ $INSTALADO -eq 0 ]]
then
	echo "El paquete está instalado"
	echo "La versión instalada es:" $(dpkg-query -W $NOMBRE_PAQUETE)
CONTINUAR=true
while ( $CONTINUAR )
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
	echo -e "Opción:\e[32m \c"
	read OPCION
	echo -e "\e[0m \c"
	case $OPCION in
		1)
		  echo ""
		  echo -e "\e[34mSe comienza la actualización\e[0m"
		  sudo apt-get update
		  sudo apt-get install --only-upgrade $NOMBRE_PAQUETE
		  ;;
		2)
		  echo -e "\e[34mSe comienza la reinstalación\e[0m"
		  sudo apt-get update
    		  sudo apt-get install --reinstall $NOMBRE_PAQUETE
		  ;;
		3)
		  echo ""
		  echo -e "\e[34mSe comienza la eliminación sin eliminar configuración\e[0m"
		  sudo apt-get remove $NOMBRE_PAQUETE
		  sudo apt-get update
		  sudo apt-get autoremove
		  ;;
		4)
		  echo ""
		  echo -e "\e[34mSe comienza la eliminación total\e[0m"
		  sudo apt-get purge $NOMBRE_PAQUETE
		  sudo apt-get update
		  sudo apt-get autoremove
		  ;;
		5)
			CONTINUAR=false
		  ;;
		*)
			echo "Parece que has escogido una opción no válida. Prueba de nuevo"
	esac

done

else
	echo -e "El paquete \e[1;31m$NOMBRE_PAQUETE\e[0m no está instalado"
fi
