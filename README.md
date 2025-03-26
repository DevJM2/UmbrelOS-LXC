# Proxmox Scripts para Instalar UmbrelOS

Este repositorio contiene un script automatizado para facilitar la instalación de **UmbrelOS** en una máquina virtual en **Proxmox**. El script realiza todo el proceso de creación de la VM, configuración del disco y arranque desde la ISO de UmbrelOS, todo con un toque de humor para hacerlo más divertido.

## Características:
- **Creación automática de VM** con configuración personalizada (CPU, RAM, disco).
- **Descarga e instalación automática de la ISO** de UmbrelOS.
- **Configuración de arranque** desde la ISO para realizar la instalación de UmbrelOS.
- Mensajes de **toques de humor** para hacerlo más ameno.

## Requisitos:
- **Proxmox VE** instalado y funcionando.
- Conexión a **Internet** para descargar la ISO de UmbrelOS.

## Uso:
1. Descarga o clona este repositorio.
2. Ejecuta el script en tu servidor Proxmox:  
   ```bash
   bash -c "$(wget -qLO - https://raw.githubusercontent.com/TU_USUARIO/proxmox-scripts/main/install-umbrelos.sh)"



# Proxmox Scripts to Install UmbrelOS

This repository contains an automated script to simplify the installation of **UmbrelOS** in a virtual machine on **Proxmox**. The script automates the creation of the VM, disk configuration, and boot setup from the UmbrelOS ISO, all with a touch of humor to make it more fun.

## Features:
- **Automated VM creation** with customizable configuration (CPU, RAM, disk).
- **Automatic download and installation** of the UmbrelOS ISO.
- **Boot setup** from the ISO to perform the UmbrelOS installation.
- **Humorous messages** to make the process more enjoyable.

## Requirements:
- **Proxmox VE** installed and running.
- **Internet connection** to download the UmbrelOS ISO.

## Usage:
1. Download or clone this repository.
2. Run the script on your Proxmox server:  
   ```bash
   bash -c "$(wget -qLO - https://raw.githubusercontent.com/TU_USUARIO/proxmox-scripts/main/install-umbrelos.sh)"
