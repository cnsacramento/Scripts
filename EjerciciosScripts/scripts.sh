#!/bin/bash

# NOMBRE: scripts.sh
# OBJETIVO: Script que ayuda a crear un nuevo script con plantilla
# AUTOR: Christian Novo Sacramento
# FECHA: 2022/02/28

# ENTRADAS(numDatos):
# SALIDAS:

# VERSIONES: 1.0


#######################################################


#Así se hace para poner color con el echo \n salta línea  \e lee color y \c evita salto línea
#echo -e \n\e[34m Nombre del script: \e[32m\c"; read NOMBRE_SCRIPT
read -p $'\n\e[34m Nombre del script: \e[32m' NOMBRE_SCRIPT
NOMBRE_SCRIPT+=".sh"
#echo -e  \e[0m" finaliza el color
cat $HOME/Scripts/EjerciciosScripts/plantillaCabecera > $HOME/Scripts/EjerciciosScripts/$NOMBRE_SCRIPT
chmod u+x $HOME/Scripts/EjerciciosScripts/$NOMBRE_SCRIPT
nano $HOME/Scripts/EjerciciosScripts/$NOMBRE_SCRIPT
echo -e "\n\e[34m Script creado y permisos concedidos \e[0m"

#NOTA = El script no funciona con los espacios
