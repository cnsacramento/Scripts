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
ERROR_ARG=1

if [[ $# -lt 1 || $# -gt 1 ]]
then
	echo 'Prueba a introducir el nombre del servicio como argumento'
	exit $ERORR_ARG
fi

# systemctl list-units --type=service --all | grep $SERVICIO > /dev/null #Comprueba si existe el servicio
systemctl list-unit-files | grep $SERVICIO > /dev/null
if [[  $? -gt 0 ]]
then
	echo 'Error: Servicio no encontrado'
else
	systemctl is-active $SERVICIO > /dev/null 2&>1 #Comprueba si el servicio está activo
	if [[ $? -eq 0 ]]
	then
		echo -e -n 'El servicio se encuentra activo. ¿Desea desactivarlo? s/n \e[31m '
		read OPCION; echo -e -n '\e[0m'
		if [[ $OPCION == 's' ]]
                then
                        systemctl stop $SERVICIO
                        echo -e '\e[32mEl servicio se ha desactivado\e[0m'
		else
			echo -e '\e[32mEl servicio se mantendrá activo\e[0m'
                fi
	else
		echo -e -n 'El servicio se encuentra inactivo. ¿Desea activarlo? s/n  \e[31m'
		read OPCION; echo -e -n '\e[0m'
		if [[ $OPCION == 's' ]]
		then
			systemctl start $SERVICIO
			echo -e '\e[32mEl servicio se ha activado\e[0m'
		else
			echo -e '\e[32mEl servicio se mantendrá inactivo\e[0m'
		fi
	fi
	systemctl is-enabled $SERVICIO > /dev/null
	if [[ $? -gt 0 ]]
	then
		echo -e -n 'El servicio se encuentra inhabilitado. ¿Desea habilitarlo? s/n  \e[31m'
		read OPCION; echo -e -n '\e[0m'
		if [[ $OPCION == 's' ]]
		then
			sudo systemctl enable $SERVICIO > /dev/null
			echo -e '\e[32mEl servicio se ha habilitado\e[0m'
		else
			echo -e '\e[32mEl servicio permanecerá inhabilitado\e[0m'
		fi
	else
		echo -e -n 'El servicio se encuentra habilitado. ¿Desea inhabilitarlo?  \e[31m'
		read OPCION; echo -e -n '\e[0m'
		if [[ $OPCION == 's' ]]
		then
			sudo systemctl disable $SERVICIO > /dev/null
			echo -e '\e[32mEl servicio se ha inhabilitado\e[0m'
		else
			echo -e '\e[32mEl servicio permanecerá habilitado\e[0m'
		fi
	fi
	systemctl list-unit-files | grep masked | grep $SERVICIO > /dev/null #Comprueba si el servicio se encuentra enmascarado
	if [[ $? -gt 0 ]]
	then
		echo -e -n 'El servicio no se encuentra enmascarado. ¿Deseas enmascararlo? s/n  \e[31m'
		read OPCION; echo -e -n '\e[0m'
		if [[ $OPCION == 's' ]]
		then
			systemctl mask $SERVICIO
			echo -e '\e[32mEl servicio se ha enmascarado\e[0m'
		else
			echo -e '\e[32mEl servicio permanecerá sin enmascarar\e[0m'
		fi
	else
		echo -e -n 'El servicio se encuentra enmascarado. ¿Deseas desenmascararlo? s/n  \e[31m'
                read OPCION; echo -e -n '\e[0m'
                if [[ $OPCION == 's' ]]
                then
                        systemctl unmask $SERVICIO
                        echo -e '\e[32mEl servicio se ha desenmascarado\e[0m'
                else
                        echo -e '\e[32mEl servicio permanecerá enmascarado\e[0m'
                fi
	fi
fi

