#!/bin/bash

# NOMBRE: servicio.sh
# OBJETIVO: Trabajar con los servicios
# AUTOR: Christian y Oliver
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

SERVICIO=$1

if [[ $# -lt 1 || $# -gt 1 ]]
then
	echo 'Prueba a introducir el nombre del servicio como argumento'
elif [[  -1 -gt 0 ]]
then
	echo 'Error: Servicio no encontrado'
else
	systemctl is-active $SERVICIO
	if [[ $? -eq 0 ]]
	then
		read -p 'El servicio se encuentra activo. ¿Desea desactivarlo? s/n' $OPCION
		 if [[ $OPCION = 's' ]] 
                then
                        systemctl stop $SERVICIO
                        echo 'El servicio se ha activado'
                fi
	else
		read -p 'El servicio se encuentra inactivo. ¿Desea activarlo? s/n' $OPCION
		if [[ $OPCION = 's' ]]
		then
			systemctl start $SERVICIO
			echo 'El servicio se ha activado'
		fi
	fi
	echo 'Macara:' $(systemctl is-enabled $SERVICIO)
fi
