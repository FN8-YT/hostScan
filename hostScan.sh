#!/bin/bash
figlet FN8

# Ctrl + C

function ctrl_c(){
    echo -e "\n\n[!] Saliendo...\n"
    exit 1
}

# Ctrl + C
trap ctrl_c INT

read -p "Cual es tu Direccion de red? Ej: [192.168.1 - 172.16.1 - 10.0.0] : " rango

echo -e "\nHost Activos en tu Red...\n"

for i in $(seq 1 254); do
    timeout 1 bash -c "ping -c 1 $rango.$i" &>/dev/null && echo " [+] Host -> 192.168.1.$i - ACTIVE" &
done; wait
