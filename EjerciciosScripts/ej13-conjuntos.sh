#!/bin/bash

################################
#
# NOMBRE: ej13-conjuntos.sh
# OBJETIVO:
# AUTOR: Alejandro y Christian
# FECHA: 2022/03/03
#
#
# ENTRADAS:
# SALIDAS:
# VERSIONES:
################################

declare -a A
declare -a B
declare -a C

if [ $# -ne 0 ]; then
	for arg; do
		A=($arg ${A[@]})
	done
	Amedia=0
	Amin=${A[0]}
	Amax=${A[0]}
	for i in ${A[@]}; do
		Amedia=$(($Amedia+$i))
        	if [ $Amin -gt $i ]; then
                	Amin=$i
        	fi
		if [ $Amax -lt $i ]; then
			Amax=$i
		fi
	done
	Amedia=$(echo "scale=2; $Amedia/${#A[@]}" | bc)
else
	echo "No ha introducido ningun parametro para el conjunto A"
	exit
fi
echo
echo "Conjunto A: ${A[@]}"
echo "El valor minimo del conjunto A es: $Amin, el valor maximo es: $Amax y el valor medio es de: $Amedia"
echo

while
	read -p "Introduce un nuevo valor (0 para acabar): " VALOR
	if [ $VALOR -eq 0 ]; then
		break
	fi
        B=(${B[@]} $VALOR)
	[ ${B[-1]} -ne 0 ]
do
	:
done

B_MEDIA=0
B_MIN=${B[0]}
B_MAX=${B[0]}
for i in "${B[@]}"; do
	echo $i
	B_MEDIA=$(($Bmedia+$i))
        if [ $Bmin -gt $i ]; then
                B_MIN=$i
        fi
        if [ $B_MAX -lt $i ]; then
                B_MAX=$i
        fi
done
B_MEDIA=$(echo "scale=2; $Bmedia/${#B[@]}" | bc)
echo
echo "Conjunto B: ${B[@]}"
echo "El valor minimo del conjunto B es: $Bmin, el valor maximo es: $Bmax y el valor medio es de: $Bmedia"
echo

read -p "¿Cuántos valores quieres generar? " NUM_VALORES

if [ -z $NUM_VALORES ]; then
	numVal=30
fi

for (( i=1; i<=$NUM_VALORES; i++ )); do
	parImpar=$(($i%2))
	mitad=$((${#C[@]}/2))
	if [ $PAR_IMPAR -ne 0 ]; then
		C=(${C[@]::$MITAD} $i ${C[@]:$MITAD:100000})
	else
		C=(${C[@]::$MITAD} $RANDOM ${C[@]:$MITAD:100000})
	fi
done

C_MEDIA=0
C_MIN=${C[0]}
C_MAX=${C[0]}
for i in ${C[@]}; do
	C_MEDIA=$(($CMEDIA+$i))
        if [ $C_MIN -gt $i ]; then
                C_MIN=$i
        fi
        if [ $C_MAX -lt $i ]; then 
                C_MAX=$i
        fi
done
C_MEDIA=$(echo "scale=2; $Cmedia/${#C[@]}" | bc)
echo ""
echo "El Conjunto C es: ${C[@]}"
echo "El valor minimo del conjunto C es: $C_MIN, el valor maximo es: $C_MAX y el valor medio es de: $C_MEDIO"


D=(${A[@]} ${B[@]} ${C[@]})
Dmedia=0
Dmin=${D[0]}
Dmax=${D[0]}
for i in ${D[@]}; do
	Dmedia=$(($Dmedia+$i))
        if [ $Dmin -gt $i ]; then
                Dmin=$i
        fi
        if [ $Dmax -lt $i ]; then 
                Dmax=$i
        fi
done
Dmedia=$(echo "scale=2; $Dmedia/${#D[@]}" | bc)
echo
echo "Conjunto D: ${D[@]}"
echo "El valor minimo del conjunto D es: $Dmin, el valor maximo es: $Dmax y el valor medio es de: $Dmedia"
