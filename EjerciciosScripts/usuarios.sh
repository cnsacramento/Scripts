#!/bin/bash

# NOMBRE: usuarios.sh
# OBJETIVO: Administración de usuarios
# AUTOR: Christian y Oliver
# FECHA: 2022-05-10

# ENTRADAS(numDatos): 1. usuario, 2. grupo
# SALIDAS: (poner acción del Script)

# VERSIONES: 1.0.0


#######################################################


usuario=$1
grupo=$2

if [ $# -lt 2 ]
then
	echo "
  =================================================================
  ||		     	      MENU            	                 ||
  =================================================================
  || 1. Mostrar grupos al que pertenece el usuario (Sólo nombre) ||
  || 2. Mostrar grupos al que pertenece el usuario (Nombre y id) ||
  || 3. Mostrar usuarios conectados actualmente                  ||
  || 4. Mostrar los usuarios conectados reciéntemente            ||
  ================================================================= "
  read -p "Opción: " opcion
  case $opcion in
	1)
	   id -Gn $USER
	;;
	2)
	   id $USER
	;;
	3)
	   users
	;;
	4)
	   last
	;;
	*)
	;;
  esac
fi
