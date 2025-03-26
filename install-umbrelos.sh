#!/bin/bash

# Variables de configuración de la VM
VM_ID=999  # Cambia este número si ya tienes una VM con este ID
ISO_URL="https://download.umbrel.com/release/latest/umbrelos-amd64-usb-installer.iso"  # URL oficial de la ISO de UmbrelOS
ISO_NAME="umbrelos-amd64-usb-installer.iso"  # Nombre del archivo ISO
STORAGE="local-lvm"  
DISK_SIZE="920G"  # Tamaño del disco de la VM
CORES=4           # Núcleos de CPU
RAM=8192          # Memoria RAM
NET_BRIDGE="vmbr0"  # Configuración de la red (puedes ajustarlo según tu configuración)

# Mensajes iniciales
echo "🚀 Iniciando la instalación de UmbrelOS en una VM de Proxmox..."

# Descargar la ISO de UmbrelOS
echo "📥 Descargando la ISO de UmbrelOS..."
wget -O "/var/lib/vz/template/iso/$ISO_NAME" "$ISO_URL"

# Crear la VM en Proxmox
echo "🖥 Creando la VM..."
qm create $VM_ID --name UmbrelOS --memory $RAM --cores $CORES --net0 virtio,bridge=$NET_BRIDGE --ostype l26

# Agregar la ISO de UmbrelOS como unidad de CD en la VM
echo "💿 Insertando El CD de UmbrelOS..."
qm set $VM_ID --cdrom $STORAGE:iso/$ISO_NAME

# Crear el disco de la VM
echo "💾 Creando un disco de $DISK_SIZE..."
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$DISK_SIZE

# Configurar la VM para arrancar desde la ISO
echo "🚀 Configurando el arranque desde la ISO..."
qm set $VM_ID --boot order=cdrom,scsi0

# Iniciar la VM
echo "🔄 Iniciando la VM..."
echo "🎉 ¡Y recuerda! La tecnología no muerde... pero a veces sí te hace pensar si te está tomando el pelo 😂"
echo "🎉 And remember! Technology doesn't bite... but sometimes it makes you wonder if it's pulling your leg 😂"
qm start $VM_ID

echo "✅ Instalación completada. Ahora puedes acceder a la VM y comenzar la instalación de UmbrelOS."


echo "💡 Consejo: Si algo no funciona, prueba apagarlo y contar hasta 3 😆"
echo "✅ Si te resulta útil, no olvides, Comenta, agradece y se acepta café de agradecimiento"
echo "✅If you find it useful, don't forget to comment, thank you, and a thank you coffee is welcome."

