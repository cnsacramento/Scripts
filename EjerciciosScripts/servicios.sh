#!/bin/bash

# NOMBRE: servicios.sh
# OBJETIVO: (poner lo que hace el Script)
# AUTOR: (poner el creador del Script)
# FECHA: (poner la fecha de creación del Script)

# ENTRADAS(numDatos): (poner que hace cada dato)
# SALIDAS: (poner acción del Script)

# VERSIONES: (poner la versión del Script)


#######################################################


# Ver servicios
systemctl

# Ver solo servicios
systemctl list-unit --type=service

# Formato antiguo que se ve más bonito que el systemctl
service --status-all

#
systemctl status 'nombre del servicio'

# Parar un servicio
systemctl stop 'nombre servicio'
systemctl is-active openvpn # Para los scripts, también se puede pedir el error echo $?

# Empezar un servicio
systemctl start 'nombre servicio'

# Mostrar un servicio
systemctl stop 'nombre servicio'

