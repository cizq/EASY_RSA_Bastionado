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
             echo "Creando la entidad de certificación";
			 echo "Generando archivo vars";
			 echo "Introduzca los valores entre comillas dobles";
			 cd /home/equipo1/easy-rsa/;
			 read -p "COUNTRY?" country;
			 echo set_var EASYRSA_REQ_CONTRY $country >> vars;
			 read -p "PROVINCE?" province;
			 echo set_var EASYRSA_REQ_PROVINCE $province >> vars;
			 read -p "CITY?" city;
			 echo set_var EASYRSA_REQ_CITY $city >> vars;
			 read -p "ORGANIZATION?" organization;
			 echo set_var EASYRSA_REQ_ORG $organization >> vars;
			 read -p "EMAIL?" email;
			 echo set_var EASYRSA_REQ_EMAIL $email >> vars;
			 read -p "ORGANIZATIONAL UNIT?" ou;
			 echo set_var EASYRSA_REQ_OU $ou >> vars;
			 read -p "ALGO?" algo;
			 echo set_var EASYRSA_ALGO $algo >> vars;
			 read -p "DIGEST?" digest;
			 echo set_var EASYRSA_DIGEST $digest >> vars;
			 clear
			 echo "El fichero vars generado es el siguiente: \n";
			 cat vars;
			 echo "\nAhora debe geneerar el certificado público de la CA";;
            ;;
        "Cerrar")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
