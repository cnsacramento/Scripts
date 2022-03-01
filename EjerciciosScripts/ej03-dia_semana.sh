#!/bin/bash

# NOMBRE: dia_semana.sh
# OBJETIVO: Recoge una fecha y devuelve el día de la semana que fue en aquella época
# AUTOR: Christian Novo Sacramento
# FECHA: 25/01/2022

# ENTRADAS(3): 1: Día, 2: mes, 3: año
# SALIDAS: Devuelve el día de la semana según la fecha

# VERSIONES: 1.0


#######################################################


dia=$1
mes=$2
anio=$3
fecha=$anio-$mes-$dia

echo "El día de la semana de la fecha indicada ($dia/$mes/$anio) fue: $(date --date=$fecha +%A)"
