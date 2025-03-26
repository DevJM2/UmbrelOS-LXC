#!/bin/bash

# Configuración de la VM
VM_ID=999  # Cambia este número si ya tienes una VM con este ID
ISO_URL="https://download.umbrel.com/release/latest/umbrelos-amd64-usb-installer.iso"
ISO_NAME="umbrelos-amd64-usb-installer.iso"
STORAGE="local-lvm"  
DISK_SIZE="920G"  
CORES=4  
RAM=8192  

echo "🚀 Iniciando la misión: Instalación de UmbrelOS en Proxmox... ¡Ajusta tu casco espacial! 🧑‍🚀"

# Descargar la ISO de UmbrelOS
echo "📥 Descargando UmbrelOS... (Sí, Internet sigue siendo más lento de lo que quisiéramos)"
wget -O "/var/lib/vz/template/iso/$ISO_NAME" "$ISO_URL"

# Crear la VM en Proxmox
echo "🖥 Creando la VM en Proxmox... ¡Vamos a darle vida a este pequeño Frankenstein! 🧟"
qm create $VM_ID --name UmbrelOS --memory $RAM --cores $CORES --net0 virtio,bridge=vmbr0 --ostype l26

# Agregar la ISO como unidad de CD
echo "💿 Insertando el CD virtual... Aunque nadie usa CDs desde 2025 😅"
qm set $VM_ID --cdrom $STORAGE:iso/$ISO_NAME

# Crear el disco de la VM
echo "💾 Creando disco de almacenamiento de $DISK_SIZE...  🖼️"
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$DISK_SIZE

# Configurar arranque desde la ISO
echo "🚀 Configurando el arranque... ¿Listo para despegar?"
qm set $VM_ID --boot order=cdrom,scsi0

# Iniciar la VM
echo "🔄 Iniciando la VM... Cruza los dedos 🤞 (y espera lo mejor)"
qm start $VM_ID

echo "✅ Instalación completada. Ahora puedes acceder a la VM y terminar de configurar UmbrelOS."
echo "💡 Consejo: Si algo no funciona, prueba apagarlo y contar hasta 3 😆"
echo "✅ Si te resulta útil, no olvides, Comenta, agradece y se acepta café de agradecimiento"
echo "✅If you find it useful, don't forget to comment, thank you, and a thank you coffee is welcome."

# Frase final con toque de humor
echo "🎉 ¡Y recuerda! La tecnología no muerde... pero a veces sí te hace pensar si te está tomando el pelo 😂"
echo "🎉 And remember! Technology doesn't bite... but sometimes it makes you wonder if it's pulling your leg 😂"
