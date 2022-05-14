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
while true
do
	echo "
  =================================================================
  ||		     	      MENU            	                 ||
  =================================================================
  || 1. Mostrar grupos al que pertenece el usuario (Sólo nombre) ||
  || 2. Mostrar grupos al que pertenece el usuario (Nombre y id) ||
  || 3. Mostrar usuarios conectados actualmente                  ||
  || 4. Mostrar los usuarios conectados reciéntemente            ||
  || 5. Salir                                  			 ||
  ================================================================= "
  read -p "Opción: " opcion
  echo -e "\n"
  case $opcion in
	1)
	   echo -e "\e[34mLos grupos a los que pertenece $USER son: \n\e[32m $(id -Gn) $USER \e[0m"
	;;
	2)
	   echo -e "\e[34mLos grupos a los que pertenece $USER son: \n\e[32m $(id $USER) \e[0m"
	;;
	3)
	   echo -e "\e[34mLos usuarios conectados actualmente son: \n \e[32m $(users) \e[0m"
	;;
	4)
	   echo -e "\e[34m Los usuarios conectados reciéntemente son:\n \e[32m $(last) \e[0m"
	;;
	5)
	   echo -e "\e[34mHasta la próxima\e[0m"
	   break;
	;;
  esac
done
elif [ $# -eq 2 ]
then
	id $usuario > /dev/null 2>&1
	if [ $? -eq 0 ]
	then
	while(true)
	do
		echo "
  =====================================================================
  ||                              MENU                               ||
  =====================================================================
  || 1. Bloquear la cuenta del usuario                               ||
  || 2. Desbloquear la cuenta del usuario                            ||
  || 3. Cambiar la shell de arranque del usuario a /bin/false        ||
  || 4. Cambiar la shell de arranque del usuario a /bin/bash         ||
  || 5. Caducar contraseña a los 45 días y tras cambio de contraseña ||
  ||     no se pueda volver a cambiar en 3 días			     ||
  || 6. Añadir al usuario al grupo secundario indicado (parámetro 2) ||
  || 7. Eliminar el usuario                                          ||
  || 8. Salir							     ||
  ===================================================================== "
	read -p "Opción: " opcion
	echo -e "\n"
	case $opcion in
		1)
			sudo usermod -L $usuario
			echo -e "\e[32m$usuario bloqueado\e[0m"
		;;
		2)
			sudo usermod -U $usuario
			echo -e "\e[32m$usuario desbloqueado\e[0m"
		;;
		3)
			sudo usermod -s /bin/false $usuario
			echo -e "\e[32m$usuario cambió de shell a -> /bin/false\e[0m"
		;;
		4)
			sudo usermod -s /bin/bash $usuario
			echo -e "\e[32m$usuario cambió de shell a -> /bin/bash\e[0m"
		;;
		5)
			sudo chage -M 45 -m 3
		;;
		6)
			sudo usermod -aG $grupo $usuario
			echo -e "\e[32mUsuario añadido al grupo $grupo\e[0m"
		;;
		7)
			sudo deluser $usuario
			echo -e "\e[32m$usuario eliminado\e[0m"
		;;
		8)
			echo -e "\e[34mHasta la próxima\e[0m"
			break
		;;
	esac
	done
	else
		echo -e "\e[34mAgregando usuario \e[0m"
		sudo useradd -m $usuario
		cat /etc/group | grep "^$grupo.*"  > /dev/null 2>&1
		if [ $? -eq 0 ]
		then
			echo -e "\e[34mAgregando grupo\e[0m"
			sudo usermod -g $grupo $usuario -s /bin/bash
			echo -e "\e[34mAgregando /bin/bash"
			echo -e "\e[34mAgregado home \e[0m"
			echo -e "\e[32mContraseña\e[0m"
			sudo passwd $usuario
		else
			sudo groupadd $grupo
			echo -e "\e[34mCreando grupo\e[0m"
			sudo usermod -g $grupo $usuario -s /bin/bash
                        echo -e "\e[34mAgregando /bin/bash"
                        echo -e "\e[34mAgregado home \e[0m"
                        echo -e "\e[32mContraseña\e[0m"
                        sudo passwd $usuario
		fi
	fi
fi
