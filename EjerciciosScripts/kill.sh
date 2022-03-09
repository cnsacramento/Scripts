#!/bin/bash

# NOMBRE: kill.sh
# OBJETIVO: Interrumpir las señales de kill
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################

trap 'echo no puedes parar' INT
trap 'echo ¿te crees muy listo?' 15
trap 'echo felicidades' KILL

echo "Soy el proceso $$ manda una señal"
while :
do
	sleep 1
	((i++))
done

