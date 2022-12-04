#!/bin/bash
# Bash Menu Script Example
PS3='Please enter your choice: '
options=("Opcion 1" "Opcion 2" "Opcion 3" "Cerrar")
select opt in "${options[@]}"
do
    case $opt in
        "Opcion 1")
            echo "Crear estructura y enlaces simbolicos"
            mkdir /home/$User/easy-rsa
            lsn -s /usr/share/easy-rsa/* /home/$User/easy-rsa/
            cd /home/$User/easy-rsa
	    ./easyrsa init-pki
            ;;
        "Opcion 2")
            echo "Crear certificado CA"
           cd /home/$User/easy-rsa
           ./easyrsa build-ca
            ;;
        "Opcion 3")
            echo "you chose choice $REPLY which is $opt"
            ;;
        "Cerrar")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
