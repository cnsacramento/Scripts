#!/bin/bash

# Ruta donde se guardaran las estructuras de datos con la ruta de las imagenes
ruta_guardado="$HOME/.local/share/backgrounds/.listado_imagenes.csv"

# Ruta donde se encuentran las imagenes 
ruta_imagenes="$HOME/.local/share/backgrounds"

# Exportar variable para usar con crontab DBUS_SESSION_BUS_ADDRESS
# Para usar gsettings junto a crontab hay que actualizar su variable de entorno
# Ubuntu
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"

# Comando a poner en crontab (importante el sleep para que cargue)
# Al reiniciar
# @reboot sleep 10 && ruta_script

#Imágenes presentes en el directorio
imagenes_disponibles=`ls $ruta_imagenes`


imagenes_no_usadas=("no_usadas;")
imagenes_usadas=("usadas;")


function guardar_listado() {
	
	echo ${imagenes_no_usadas[@]} | tr -s " " ";" > $ruta_guardado
	echo ${imagenes_usadas[@]} | tr -s " " ";" >> $ruta_guardado
	
}


function escoger_imagen() {
	
	numero_aleatorio=$(( $RANDOM%(${#imagenes_no_usadas[@]} - 1) + 1 ))
     	imagen_nueva=${imagenes_no_usadas[$numero_aleatorio]}
     	gsettings set org.gnome.desktop.background picture-uri-dark file:///$ruta_imagenes/$imagen_nueva
}


function cambiar_imagen() {
 
     	imagenes_no_usadas=$(head -1 $ruta_guardado | tr -s ";" " ")
     	imagenes_no_usadas=($imagenes_no_usadas)

	escoger_imagen

	imagenes_usadas=$( head -2 $ruta_guardado | tail -1 | tr -s ";" " " )  
	imagenes_usadas=($imagenes_usadas)
	imagenes_usadas+=( "${imagenes_no_usadas[$numero_aleatorio]}" )

	unset imagenes_no_usadas[$numero_aleatorio]

	guardar_listado	
}



function leer_fichero() {

	imagenes_no_usadas=$(head -1 $ruta_guardado | tr -s ";" " ")
	imagenes_no_usadas=($imagenes_no_usadas)
	imagenes_usadas=$(head -2 $ruta_guardado | tail -1 | tr -s ";" " ")
	imagenes_usadas=($imagenes_usadas)
	
	total_imagenes=( "${imagenes_no_usadas[@]:1:${#imagenes_no_usadas[@]}}" "${imagenes_usadas[@]:1:${#imagenes_usadas[@]}}")
}


function eliminar_imagenes_antiguas() {

	antiguas_imagenes=$(echo ${imagenes_disponibles[@]} ${total_imagenes[@]} | tr " " "\n" | sort | uniq -u | tr -s "\n" " ")
	antiguas_imagenes=($antiguas_imagenes)

	for i in "${antiguas_imagenes[@]}"; do
		if [[ $(echo ${imagenes_no_usadas[@]} | tr -s " " "\n" |  grep "^$i$") ]]; then
			
			index=$( echo ${imagenes_no_usadas[@]} | tr -s " " "\n" | grep -n "^$i$" | cut -d ":" -f 1 )
			index=$(( $index - 1 ))
			unset imagenes_no_usadas[$index]

			guardar_listado
			cambiar_imagen

		elif [[ $(echo ${imagenes_usadas[@]} | tr -s " " "\n" | grep -n "^$i$") ]]; then

			index=$( echo ${imagenes_usadas[@]} | tr -s " " "\n" | grep -n "^$i$" | cut -d ":" -f 1 )
			index=$(( $index - 1 ))
			unset imagenes_usadas[$index]

			guardar_listado
			cambiar_imagen
		fi
	done
}


function agregar_nuevas_imagenes() {

	
	nuevas_imagenes=$(echo ${imagenes_disponibles[@]} ${total_imagenes[@]} | tr " " "\n" | sort | uniq -u | tr -s "\n" " " )
	nuevas_imagenes=($nuevas_imagenes)
	imagenes_no_usadas+=( "${nuevas_imagenes[@]}" )
	
	guardar_listado
	cambiar_imagen

}


function inicializar() {
	
	imagenes_no_usadas+=( "${imagenes_disponibles[@]}" )
	echo ${imagenes_no_usadas[@]} | tr -s " " ";" > $ruta_guardado
	imagenes_usadas=("usadas")
	echo ${imagenes_usadas[@]} >> $ruta_guardado


}


function comprobar_directorio() {

	leer_fichero

	imagenes_disponibles=($imagenes_disponibles)

	if [[ ${#imagenes_disponibles[@]} -gt ${#total_imagenes[@]} ]]; then
		
		agregar_nuevas_imagenes
	
	elif [[ ${#imagenes_disponibles[@]} -lt ${#total_imagenes[@]} ]]; then
		
		eliminar_imagenes_antiguas

	elif [[ ${#imagenes_no_usadas[@]} -eq 1 ]]; then
	
		inicializar
		cambiar_imagen
	
	else
		cambiar_imagen
	fi
}



if [[ ! -s $ruta_guardado ]]; then
	inicializar	
else 
	comprobar_directorio
fi


