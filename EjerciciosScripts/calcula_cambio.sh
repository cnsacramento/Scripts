#!/bin/bash

# NOMBRE: calcula_cambio.sh
# OBJETIVO: Calcula el cambio en billetas y monedas de un artículo
# AUTOR: Christian Novo Sacramento
# FECHA: 2022-01-31

# ENTRADAS(2): 1. Precio del artículo, 2.Dinero Pagado
# SALIDAS: Calcula el cambio a devolver

# VERSIONES: 1.0


#######################################################

# Argumentos de entrada
precioArticulo=$1

echo "Indique el dinero pagado: "
read dineroPagado

cambio=$(($dineroPagado-$precioArticulo))

echo "El cambio son $cambio euros, debe entregar: "
billetes50=0
if [ $cambio -ge 50 ]
then
	billetes50=$(($cambio/50))
	cambio=$(($cambio%50))
fi
billetes20=0
if [ $cambio -ge 20 ]
then
        billetes20=$(($cambio/20))
        cambio=$(($cambio%20))
fi
billetes10=0
if [ $cambio -ge 10 ]
then
        billetes10=$(($cambio/10))
        cambio=$(($cambio%10))
fi
billetes5=0
if [ $cambio -ge 5 ]
then
        billetes5=$(($cambio/5))
        cambio=$(($cambio%5))
fi
monedas2=0
if [ $cambio -ge 2 ]
then
	monedas2=$(($cambio/2))
	cambio=$(($cambio%2))
fi
monedas1=0
if [ $cambio -ge 1 ]
then
	cambio=1
fi

echo "$billetes50 billetes de 50 euros"
echo "$billetes20 billetes de 20 euros"
echo "$billetes10 billetes de 10 euros"
echo "$billetes5 billetes de 5 euros"
echo "$monedas2 monedas de 2 euros"
echo "$monedas1 monedas de 1 euro"
