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
systemctl list-units --type=service

# Formato antiguo que se ve más bonito que el systemctl
service --status-all

#
systemctl status 'nombre del servicio'

# Parar un servicio
systemctl stop 'nombre servicio'

# Mostrar si un servicio está activo
systemctl is-active openvpn # Para los scripts, también se puede pedir el error echo $?

# Empezar un servicio
systemctl start 'nombre servicio'

# Mostrar un servicio
systemctl stop 'nombre servicio'

# Reiniciar un servicio sin parar el servicio //Normalmente funciona en pocos servicios
systemclt reload 'nombre servicio'

# Segunda cosa a probar para reinciar un servicio //Hace el stop y vuelve a hacer un start
systemctl restart 'nombre servicio'

# Comando que prueba un reload y si no sirve usa el restart
systemctl reload-or-restart 'nombre servicio'

# Si se usa los try no te inicia el servicio si estaba apagado, pero sin el try lo inicia aunque estuviera apagado
systemctl try-reload-or-restart 'nombre servicio'

# Mostrar los archivos de configuracion
systemctl show 'nombre servicio'

# Automatizar que estén activos o inactivos al iniciar el PC
systemctl is-enabled 'nombre servicio'

#
systemctl disable 'nombre servicio'

#
systemctl enable 'nombre servicio'

# Enmascarar un servicio para que no se pueda usar
systemctl mask 'nombre servicio'

# Volver a que un servicio se pueda usar
systemctl umask 'nombre servicio'

# Runlevel como la pantalla negra de windows // ll /etc/rc
runlevel

# Cambiar el runlevel
systemctl isolate runlevel(nivel).target

# Cambiar el runlevel por defecto
systemctl set-default runlevel(nivel).target
