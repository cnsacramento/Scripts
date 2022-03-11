#!/bin/bash

# NOMBRE: ej08-imc.sh
# OBJETIVO: Calcula el IMC e indica la clasificación
# AUTOR: Alejandro y Christian
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
	read -p "Introduce tu peso en kg: " PESO
# Si los parámetros son iguales a 0 se solicitan los dos parámetros
elif [[ $# -eq 0 ]]
then
	read -p "Introduce tu altura en cm: " ALTURA
	read -p "Introduce tu peso en kg: " PESO
fi

# Fórmula de IMC = kg/m^2

ALTURA_EN_METROS=$( echo "scale=2; $ALTURA / 100" | bc )
echo $ALTURA_EN_METROS

#Se realiza la operación con decimales
IMC=$( echo "scale=1; ( $PESO / ($ALTURA_EN_METROS^2) )" | bc )
echo "El IMC es: " $IMC

# Se le quitan los decimales para poder comparar
IMC=$( echo "scale=0; ( $IMC * 10 ) / 1" | bc )


# Todos los indices son múltiplicados por 10 para comparar con el IMC

if [[ $IMC -lt 185 ]]
then
	echo "Se encuentra en bajo de peso. Es recomendable que acuda su médico"
elif [[ $IMC -ge 185 && $IMC -lt 250 ]]
then
	echo "Todo se encuentra normal, sigue así"
elif [[ $IMC -ge 250 && $IMC -lt 300 ]]
then
	echo "Se encuentra en sobrepeso. Habrá que hacer más ejercicio y comer mejor"
else
	echo "Se encuentra en Obesidad. Acuda a su médico"
	echo "¿Sabía que la obesidad es la segunda causa de mortalidad prevenible?"
fi
