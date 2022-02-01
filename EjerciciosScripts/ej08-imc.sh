#!/bin/bash

# NOMBRE: ej08-imc.sh
# OBJETIVO: Calcula el IMC e indica la clasificación
# AUTOR: Christian Novo Sacramento
# FECHA: 2022-02-01

# ENTRADAS(2): 1.Peso , 2.Altura
# SALIDAS: Muestra el valor del IMC y su clasificación

# VERSIONES: 1.0


#######################################################


ALTURA=$1 # Se necesita en cm
PESO=$2 # Se necesita en kg

echo "Programa para calcular el IMC"
echo "============================="
# Si se recibe un sólo parámetro se solicita el segundo
if [[ $# -eq 1 ]]
then
	read -p "Introduce tú altura en cm: " ALTURA
# Si los parámetros son iguales a 0 se solicitan los dos parámetros
elif [[ $# -eq 0 ]]
then
	read -p "Introduce tú peso en kg: " PESO
	read -p "Introduce tú altura en cm: " ALTURA
fi

ALTURA=$(( $ALTURA / 100 ))
# Fórmula de IMC = kg/m^2
IMC=$(( (10000 * $PESO)/$ALTURA^2 ))
echo "El IMC es: " $IMC

if [[ $IMC -lt 18.]]
