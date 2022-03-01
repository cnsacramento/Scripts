#!/bin/bash

# NOMBRE: ej10-menu_sistema.sh
# OBJETIVO: Implementar un menú con diversas opciones
# AUTOR: Christian Novo Sacramento
# FECHA: 2022/01/24

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

OPCION=$1

if [[ $# -lt 1 ]]
then

	echo "==============================================================="
	echo "||                     MENÚ DEL SISTEMA                      ||"
	echo "==============================================================="
	echo "|| porlibre / 1 ) Espacio libre partición raiz (Porcentaje)  ||"
	echo "|| tamlibre / 2 ) Espacio libre partición raiz (Tamaño)      ||"
	echo "|| usuario  / 3 ) Usuario Actual                             ||"
	echo "|| maquina  / 4 ) Nombre de la máquina                       ||"
	echo "|| usuarios / 5 ) Número de usuarios del sistema             ||"
	echo "|| espacio  / 6 ) Total espacio usado                        ||"
	echo "=============================================================="
	read -p "Opción: " OPCION
fi

case $OPCION in
	1|porlibre)
		echo "opcion 1"
	;;
	2|tamlibre)
		echo -e "Espacio libre partición raíz:\e[32m$( df -h / | tr -s " " | cut -d " " -f 4 | tail -n 1 )\e[0m"
	;;
	3|usuario)
		echo -e "El usuario actual es:\e[32m $USER \e[0m"
	;;
	4|maquina)
		echo -e "El nombre de la máquina es:\e[32m $HOSTNAME \e[0m"
	;;
	5|usuarios)
		echo "opcion 5"
	;;
	6|espacio)
		echo "opcion 6"
	;;
	*)
		echo "Opción no válida. Revisa las opciones"
	;;
esac


