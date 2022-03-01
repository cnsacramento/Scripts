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
PRECIO_ARTICULO=$1
ERROR_ARGS=1
# Comprobación de argumento
if [ $# -lt 1 ];
then
	echo "Parece ser que no compraste nada"
	exit $ERROR_ARGS
fi

echo "Indique el dinero pagado: "
read DINERO_PAGADO

CAMBIO=$(($DINERO_PAGADO-$PRECIO_ARTICULO))

echo "El cambio son $CAMBIO euros, debe entregar: "
BILLETES_50=0
if [ $CAMBIO -ge 50 ]
then
	BILLETES50=$(($CAMBIO/50))
	CAMBIO=$(($CAMBIO%50))
fi
BILLETES_20=0
if [ $CAMBIO -ge 20 ]
then
        BILLETES_20=$(($CAMBIO/20))
        CAMBIO=$(($CAMBIO%20))
fi
BILLETES_10=0
if [ $CAMBIO -ge 10 ]
then
        BILLETES_10=$(($CAMBIO/10))
        CAMBIO=$(($CAMBIO%10))
fi
BILLETES_5=0
if [ $CAMBIO -ge 5 ]
then
        BILLETES_5=$(($CAMBIO/5))
        CAMBIO=$(($CAMBIO%5))
fi
MONEDAS_2=0
if [ $CAMBIO -ge 2 ]
then
	MONEDAS_2=$(($CAMBIO/2))
	CAMBIO=$(($CAMBIO%2))
fi
MONEDAS_1=0
if [ $CAMBIO -ge 1 ]
then
	MONEDAS_1=1
fi

echo "$BILLETES_50 billetes de 50 euros"
echo "$BILLETES_20 billetes de 20 euros"
echo "$BILLETES_10 billetes de 10 euros"
echo "$BILLETES_5 billetes de 5 euros"
echo "$MONEDAS_2 monedas de 2 euros"
echo "$MONEDAS_1 monedas de 1 euro"
