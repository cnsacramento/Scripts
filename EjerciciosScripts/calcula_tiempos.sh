#!/bin/bash

# NOMBRE: calcula_tiempos.sh
# OBJETIVO:Convertir segundos a días,horas,minutos,segundo. 
# AUTOR: Christian Novo Sacramento
# FECHA: 26/01/2022

# ENTRADAS(1): 1. Indica el número de segundos
# SALIDAS: Convierte los segundos en formato días,horas,minutos y segundo

# VERSIONES: 1.0

#######################################################

#Argumentos de Entrada
segundos=$1
# 1dia = 86400segundos, 1hora = 3600segundos, 1min = 60segundos
dias=$(($segundos/86400))
modDias=$(($segundos%86400))
horas=$(($modDias/3600))
modHoras=$(($modDias%3600))
minutos=$(($modHoras/60))
modMinutos=$(($modHoras%60)) # El resto de los minutos son los segundos restantes
echo "$segundos segundos son: $dias dias $horas horas $minutos minutos $modMinutos segundos"
