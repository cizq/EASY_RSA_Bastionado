!/bin/sh

while true; do

	echo "-------------------------------------------";
	echo "| [ CONFIGURACIÓN CA-RAIZ]         |";
	echo "-------------------------------------------";
	echo " 1.- Crear estructura para la pki";
	echo " 2.- Iniciar la PKI";
	echo " 3.- Crear entidad de certificación.";
	echo " 4.- Generar certificado público de la CA y clave privada.";
	echo " 5.- Distribuir certificado público de la CA";
	echo " 6.- Salir";
	echo "\n";


	read -p "Seleccione una opción de las siguientes: " op
	case $op in
		[1]* )	 echo "Creando estructura de directorio pki";
			   cd ~;
			   mkdir easy-rsa;
			   ln -s /usr/share/easy-rsa/* /home/equipo1/easy-rsa;
			   sudo chmod 700 easy-rsa;
			 echo "Acción realizada corréctamente";;

		[2]* )	 echo "Iniciando la PKI...";
			   cd /home/equipo1/easy-rsa/;
			  sudo  ./easyrsa init-pki;
			 echo "PKI iniciada corréctamente";;

		[3]* )	 echo "Creando la entidad de certificación";
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

		[4]* )   echo "Generando certificado público y clave privada.";
			 cd /home/equipo1/easy-rsa/;
			 sudo ./easyrsa build-ca;;

		[5]* ) 	 cd /home/equipo1/easy-rsa/pki/
			 echo "Asistente de distribución del certificado publico de la CA";
			 echo "Proporcione ruta de destino. Ej: carmoy@192.168.1.100:/home/carmoy/tools/";
			 echo "La carpeta destino debe existir";
			 read -p "¿Usuario en máquina destino?" user;
			 read -p "¿IP de máquina destino?" ip_dest;
			 read -p "¿Ruta de destino?" route_dest;
			 scp  /home/$USER/easy-rsa/pki/ca.crt $user@$ip_dest:$route_dest;;

		[6]*)	 echo "Ha escogido salir del programa. Hasta luego.";
			 break;;

		* ) clear;
		    echo "Opción incorrecta, vuelve a seleccionar.\n";;
	esac
done
