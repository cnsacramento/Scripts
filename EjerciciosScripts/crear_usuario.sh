#!/bin/bash

# NOMBRE: crear_usuario
# OBJETIVO: Simular el dar de alta a un usuario
# AUTOR: Christian Novo Sacramento
# FECHA: 25/01/2022

# ENTRADAS(3): 1: nombre, 2: apellido, 3: usuario
# SALIDAS: Mensajes

# VERSIONES: 1.0


#######################################################

nombre=$1
apellido=$2
usuario=$3
aleatorio=$RANDOM

echo "Bienvenido $nombre"
echo "Tus datos son: $nombre, $apellido"
echo "Vamos a crear tu usuario $usuario"
echo "Tú nueva ID es $aleatorio"
