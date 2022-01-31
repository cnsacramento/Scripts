#!/bin/bash

# NOMBRE: calcula_segundos.sh
# OBJETIVO: Se le pasan 4 parámetros (dia,horas,minutos y segundos) y lo convierte todo a segundos
# AUTOR: Christian Novo Sacramento
# FECHA: 31/01/2022

# ENTRADAS(4): 1.Días, 2.Horas, 3.Minutos, 5.Segundos 
# SALIDAS: Convierte los 4 parámetros en segundos

# VERSIONES: 1.0


#######################################################

dia=$1
hora=$2
minuto=$3
segundo=$4

# 1día = 86400segundos, 1hora = 3600segundos, 1minuto = 60 segundos
conversionSegundos=$(($dia*86400 + $hora*3600 + $minuto*60 + $segundo))

echo "$dia días, $hora horas, $minuto minutos, y $segundo segundos son: $conversionSegundos segundos"
