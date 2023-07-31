#!/bin/bash

# Author: Guillermo Ferreira

# COLORES
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
# FIN COLORES

# DECLARACION DE VARIABLES
ip=$1
# FIN DECLARACION DE VARIABLES

# FUNCIONES
# NMAP1 SUBMENU1 OPCION 2
portScanner () {
    echo -e "${GREEN}Realizando escaneo rapido${ENDCOLOR}"
    echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}\n"
    for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2_/dev/null && echo "[+] Port $port - OPEN" &
    done; wait
    echo -e "${YELLOW}\nTerminado con exito ${ENDCOLOR}"
}
# FIN NMAP1 SUBMENU1 OPCION 1

# NMAP1 SUBMENU1 OPCION 2
nmapscann1 () {
    # BUSCA NMAP EN EL PATH EN SEGUNDO PLANO
    which nmap > /dev/null 2>&1

    # DIFERENTES FORMAS DE ESCANEO
    # CREAR O NO ARCHIVO
    if [ $? -eq 0 ]; then
        read -p "¿Quieres crear un archivo con los resultados? [S/N]" createfile
        echo -e "\n"
        if [ $createfile == S ] || [ $createfile == s ]; then
            read -p "¿En que formato quieres crear el archivo? Normal(N) Grepeable(G) XML(X) Todos(A) [N/G/X/A]" optfile
            echo -e "\n"
            # FORMATO NORMAL
            if [ $optfile == N ] || [ $optfile == n ]; then
                echo -e "${GREEN}Realizando escaneo y guardando en formato Normal${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oN allPorts ${ENDCOLOR}\n"
                nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oN allPorts
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo allPorts${ENDCOLOR}"
                exit
            # FORMATO GREPEABLE
            elif [ $optfile == G ] || [ $optfile == g ]; then
                echo -e "${GREEN}Realizando escaneo guardando en formato Grepeable${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oG allPorts ${ENDCOLOR}\n"
                nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oG allPorts
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo allPorts${ENDCOLOR}"
                exit
            # FORMATO XML
            elif [ $optfile == X ] || [ $optfile == x ]; then
                echo -e "${GREEN}Realizando escaneo guardando en formato XML${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oX allPorts ${ENDCOLOR}\n"
                nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oX allPorts
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo allPorts${ENDCOLOR}"
                exit
            # TODOS LOS FORMATOS
            elif [ $optfile == A ] || [ $optfile == a ]; then
                echo -e "${GREEN}Realizando escaneo guardando en todos los formatos${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oA allPorts ${ENDCOLOR}\n"
                nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip -oA allPorts
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo allPorts${ENDCOLOR}"
                exit
            else
                echo -e "${RED}Formato no valido${ENDCOLOR}"
            fi
        # REALIZAR ESCANEO SIN GUARDAR EN ARCHIVO
        elif [ $createfile == N ] || [ $createfile == n ]; then
            echo -e "${GREEN}Realizando escaneo sin crear archivo${ENDCOLOR}"
            echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
            echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip ${ENDCOLOR}\n"
            nmap -p- --open -sS --min-rate 5000 -n -vvv -Pn $ip
            echo -e "${GREEN}Escaneo realizado con exito${ENDCOLOR}"
            exit
        else
            echo -e "${RED}Formato no valido${ENDCOLOR}"
        fi
    else
            echo -e "${RED}nmap no encontrado en el Path, instalelo usando sudo apt install nmap ${ENDCOLOR}"
    fi
}
# FIN NMAP1 SUBMENU1 OPCION 2

# NMAP2 SUBMENU1 OPCION 3
nmapscann2 () {
    # BUSCA NMAP EN EL PATH EN SEGUNDO PLANO
    which nmap > /dev/null 2>&1

    # DIFERENTES FORMAS DE ESCANEO
    # CREAR O NO ARCHIVO
    if [ $? -eq 0 ]; then
        read -p "¿Quieres crear un archivo con los resultados? [S/N]" createfile
        echo -e "\n"
        if [ $createfile == S ] || [ $createfile == s ]; then
            read -p "¿En que formato quieres crear el archivo? Normal(N) Grepeable(G) XML(X) Todos(A) [N/G/X/A]" optfile
            echo -e "\n"
            # FORMATO NORMAL
            if [ $optfile == N ] || [ $optfile == n ]; then
                echo -e "${GREEN}Realizando escaneo y guardando en formato Normal${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- -sCV $ip -oN targeted  ${ENDCOLOR}\n"
                nmap -p- -sCV $ip -oN targeted
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo targeted${ENDCOLOR}"
                exit
            # FORMATO GREPEABLE
            elif [ $optfile == G ] || [ $optfile == g ]; then
                echo -e "${GREEN}Realizando escaneo guardando en formato Grepeable${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- -sCV $ip -oG targeted ${ENDCOLOR}\n"
                nmap -p- -sCV $ip -oG targeted
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo targeted${ENDCOLOR}"
                exit
            # FORMATO XML
            elif [ $optfile == X ] || [ $optfile == x ]; then
                echo -e "${GREEN}Realizando escaneo guardando en formato XML${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- -sCV $ip -oX targeted ${ENDCOLOR}\n"
                nmap -p- -sCV $ip -oX targeted
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo targeted${ENDCOLOR}"
                exit
            # TODOS LOS FORMATOS
            elif [ $optfile == A ] || [ $optfile == a ]; then
                echo -e "${GREEN}Realizando escaneo guardando en todos los formatos${ENDCOLOR}"
                echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
                echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- -sCV $ip -oA targeted ${ENDCOLOR}\n"
                nmap -p- -sCV $ip -oA targeted
                echo -e "${GREEN}Escaneo y guardado realizado con exito en archivo targeted${ENDCOLOR}"
                exit
            else
                echo -e "${RED}Formato no valido${ENDCOLOR}"
            fi
        # REALIZAR ESCANEO SIN GUARDAR EN ARCHIVO
        elif [ $createfile == N ] || [ $createfile == n ]; then
            echo -e "${GREEN}Realizando escaneo sin crear archivo${ENDCOLOR}"
            echo -e "${YELLOW}Escaneando ${ENDCOLOR}$ip ${YELLOW}por favor no cancele este proceso ${ENDCOLOR}"
            echo -e "${GREEN}Comando realizado:${ENDCOLOR} ${YELLOW}nmap -p- -sCV $ip ${ENDCOLOR}\n"
            nmap -p- -sCV $ip
            echo -e "${GREEN}Escaneo realizado con exito${ENDCOLOR}"
            exit
        else
            echo -e "${RED}Formato no valido${ENDCOLOR}"
        fi
    else
            echo -e "${RED}nmap no encontrado en el Path, instalelo usando sudo apt install nmap${ENDCOLOR}"
    fi
}
# FIN NMAP2 SUBMENU1 OPCION 3

# SUBMENU1
submenu1 () {
    echo -e "\n${GREEN}Seleccione una opcion de escaneo: ${ENDCOLOR}"
    echo -e "1) Escaner de puertos (Silencioso y Rapido)"
    echo -e "2) Escaner de puertos usando nmap (Ruidoso y Rapido)"
    echo -e "3) Escaner de puertos y servicios + scripts usando nmap (Ruidoso y Lento)"
    echo -e "4) Salir\n"

    # LEER OPCION INTRODUCIADA POR TECLADO
    read -p "Opcion: " scannoption
    echo -e "\n"

    case $scannoption in
        1)
            portScanner
            ;;
        2)
            nmapscann1
            ;;
        3)
            nmapscann2
            ;;
        4)
            echo -e "Saliendo..."
            ;;
        *)
            echo -e "${RED}Opcion no valida ${ENDCOLOR}"
    esac
}
# FIN SUBMENU1

# FUNCION DNS SUBMENU2
funcdns () {
    which dig > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Antes de usar esta herramienta le recomendamos que incluya el nombre del Dominio en el archivo /etc/hosts${ENDCOLOR}"
        read -p "Introduzca el nombre del Dominio, tenga en cuenta las mayusculas: " domname
        echo -e "\n"
        read -p "Que quiere hacer, listar los Name Servers(N), listar los Servidores de Correo(M), efectuar un ataque Domain Zone Transfer(D), Todos(A) [N/M/D/A]" respdns

        # LISTAR NAME SERVERS
        if [ $respdns == N ] || [ $respdns == n ]; then
            echo -e "${GREEN}Listando los Name Serveres ${ENDCOLOR}"
            dig @$ip $domname ns

            # LISTAR SERVIDORES DE CORREO
            elif [ $respdns == M ] || [ $respdns == m ]; then
                echo -e "${GREEN}Listando los Servidores de Correo ${ENDCOLOR}"
                dig @$ip $domname mx

            # EFECTUAR AXFR ATTACK
            elif [ $respdns == D ] || [ $respdns == d ]; then
                echo -e "${GREEN}Efectuando ataque AXFR${ENDCOLOR}"
                dig @$ip $domname axfr

            # REALIZAR TODAS LAS ACCIONES ANTERIORES
            elif [ $respdns == A ] || [ $respdns == a ]; then
                # NAME SERVERES
                echo -e "${GREEN}Listando los Name Serveres ${ENDCOLOR}"
                dig @$ip $domname ns
                echo -e "\n"
                # SERVIDORES DE CORREO
                echo -e "${GREEN}Listando los Servidores de Correo ${ENDCOLOR}"
                dig @$ip $domname mx
                echo -e "\n"
                # AXFR ATTACK
                echo -e "${GREEN}Efectuando ataque AXFR${ENDCOLOR}"
                dig @$ip $domname axfr
                echo -e "\n${GREEN}Todos las opciones han sido realizadas con exito ${ENDCOLOR}"

        else
            echo -e "${RED}Formato no valido${ENDCOLOR}"
        fi
    else
        echo -e "${RED}dig no encontrado en el Path, instalelo usando sudo apt install dig${ENDCOLOR}"
    fi
}
# FIN FUNCION DNS SUBMENU2

# FUNCION HTTP SUBMENU2
funchttp () {
    which whatweb > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Usando whatweb para enumerar la web: ${ENDCOLOR}"
        whatweb $ip
        echo -e "${GREEN}Esta es toda la informacion que podemos mostrarte, tendras que observar la web manualmente"
    else
        echo -e "\n${RED}whatweb no encontrado en el Path, instalelo usando sudo apt install whatweb${ENDCOLOR}"
    fi
}
# FIN FUNCION HTTP SUBMENU2

# MENU FUNCION KERBEROS SUBMENU2
menufunckerberos () {
    #echo -e "${GREEN}Abriendo kerberos para efectuar su peticion ${ENDCOLOR}\n"
    read -p "Introduzca el nombre del Dominio: " domainnamekerberos
    echo -e "\n${GREEN}Seleccione una opcion: ${ENDCOLOR}"
    echo -e "1) Enumerar usuarios del dominio"
    echo -e "2) AsRepRoast Attack (TGT)"
    echo -e "3) Kerberoasting Attack (TGS)"
    echo -e "4) Salir\n"

    # LEER OPCION INTRODUCIDA POR TECLADO
    read -p "Opcion: " kerberosoption
    echo -e "\n"

    case $kerberosoption in
        1)
            read -p "Introduzca el nombre del diccionario de usuarios: " usersfilekerberosenumusers
            kerbrute userenum -d $domainnamekerberos --dc $ip $usersfilekerberosenumusers
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        2)
            which impacket-GetNPUsers > /dev/null 2>&1

            if [ $? -eq 0 ]; then
                read -p "Introduzca el nombre del diccionario de usuarios: " usersfilekerberosasreproast
                impacket-GetNPUsers $domainnamekerberos/ -no-pass -usersfile $usersfilekerberosasreproast
                echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            else
                echo -e "\n${RED}impacket-GetNPUsers no encontrado en el Path, instalelo usando sudo apt install impacket-GetNPUsers ${ENDCOLOR}"
            fi
            ;;

        3)
            which impacket-GetUserSPNs > /dev/null 2>&1

            if [ $? -eq 0 ]; then
                echo -e "${GREEN}Para usar esta opcion necesita las credenciales de al menos un usuario ${ENDCOLOR}"
                read -p "Introduzca el nombre del usuario: " userkerberos
                read -p "Introduzca la contraseña: " passkerberos
                impacket-GetUserSPNs $domainnamekerberos/$userkerberos:$passkerberos -request
                echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            else
                echo -e "\n${RED}impacket-GetUserSPNs no encontrado en el Path, instalelo usando sudo apt install impacket-GetUserSPNs ${ENDCOLOR}"
            fi
            ;;
        
        4)
            echo -e "Saliendo..."
            ;;
        
        *)
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
            ;;
    esac
}
# FIN MENU FUNCION KERBEROS SUBMENU2

# FUNCION KERBEROS SUBMENU2
funckerberos () {
    which kerbrute > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Le recomendamos que antes de usar esta herramienta${ENDCOLOR} ${YELLOW}sincronice el reloj de su equipo con el del AD e incluya el nombre del dominio${ENDCOLOR} ${GREEN}en el archivo${ENDCOLOR} ${YELLOW}/etc/hosts${ENDCOLOR} ${GREEN}para evitar posibles problemas ${ENDCOLOR}"
        read -p "¿Quiere sincronizar ahora la hora de su equipo con el del AD? [S/N]: " respsinhora
        if [ $respsinhora == S ] || [ $respsinhora == s ]; then
            echo -e "${GREEN}Sincronizando hora ${ENDCOLOR}"
            sinchora
            echo -e "${GREEN}Completado correctamente ${ENDCOLOR}"
        elif [ $respsinhora == N ] || [ $respsinhora == n ]; then
            menufunckerberos
        else
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
        fi
    else
        echo -e "\n${RED}kerbrute no encontrado en el Path, instalelo usando sudo apt install kerbrute ${ENDCOLOR}"
    fi
}
# FUNCION KERBEROS SUBMENU2

# MENU OPCIONES RPCCLIENT SIN CREDENCIALES
menurpcclient () {
    echo -e "${GREEN}Seleccione una opcion: ${ENDCOLOR}"
    echo -e "1) Enumerar usuarios del dominio"
    echo -e "2) Enumerar grupos del dominio"
    echo -e "3) Listar las descripciones de los usuarios"
    echo -e "4) Listar la informacion de un usuario"
    echo -e "5) Listar la informacion de un grupo"
    echo -e "6) Salir\n"

    # LEER OPCION INTRODUCIDA POR TECLADO
    read -p "Opcion: " rpcoption
    echo -e "\n"

    case $rpcoption in
        1)
            read -p "¿Quiere crear una lista con los usuarios? [S/N]: " resprpcclient
            if [ $resprpcclient == S ] || [ $resprpcclient == s ]; then
                read -p "¿Como quieres llamar al archivo de los usuarios?: " usersfile
                echo -e "${GREEN}Enumerando usuarios del dominio ${ENDCOLOR}\n"
                rpcclient -U "" $ip -N -c "enumdomusers" | grep -oP '\[.*?*\]' | grep -v "0x" | tr -d '[]' > $usersfile
                echo -e "\n${GREEN}Archivo${ENDCOLOR} ${YELLOW}$usersfile${ENDCOLOR} ${GREEN}creado exitosamente ${ENDCOLOR}"
            elif [ $resprpcclient == N ] || [ $resprpcclient == n ]; then
                echo -e "${GREEN}Enumerando usuarios del dominio ${ENDCOLOR}\n"
                rpcclient -U "" $ip -N -c "enumdomusers"
                echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            else
                echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
            fi
            ;;

        2)
            echo -e "${GREEN}Enumerando grupos del dominio ${ENDCOLOR}"
            rpcclient -U "" $ip -N -c "enumdomgroups"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        3)
            echo -e "${GREEN}Listando descripciones de los usuarios ${ENDCOLOR}"
            rpcclient -U "" $ip -N -c "querydispinfo"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        4)
            read -p "Indique el RID del usuario: " riduser
            echo -e "${GREEN}Listando informacion del usuaio con RID${ENDCOLOR} ${YELLOW}$riduser ${ENDCOLOR}\n"
            rpcclient -U "" $ip -N -c "queryuser $riduser"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        5)
            read -p "Indique el RID del grupo: " ridgroup
            echo -e "${GREEN}Listando informacion del grupo con RID${ENDCOLOR} ${YELLOW}$ridgroup ${ENDCOLOR}\n"
            rpcclient -U "" $ip -N -c "querygroupmem $ridgroup"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        6)
            echo -e "Saliendo..."
            ;;

        *)
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
            ;;
    esac
}
# FIN MENU OPCIONES RPCCLIENT SIN CREDENCIALES

# MENU OPCIONES RPCCLIENT CON CREDENCIALES
menurpcclientcred () {
    echo -e "${GREEN}Seleccione una opcion: ${ENDCOLOR}"
    echo -e "1) Enumerar usuarios del dominio"
    echo -e "2) Enumerar grupos del dominio"
    echo -e "3) Listar las descripciones de los usuarios"
    echo -e "4) Listar la informacion de un usuario"
    echo -e "5) Listar la informacion de un grupo"
    echo -e "6) Salir\n"

    # LEER OPCION INTRODUCIDA POR TECLADO
    read -p "Opcion: " rpcoptioncred
    echo -e "\n"

    case $rpcoptioncred in
        1)
            read -p "¿Quiere crear una lista con los usuarios? [S/N]: " resprpcclientcred
            if [ $resprpcclientcred == S ] || [ $resprpcclientcred == s ]; then
                read -p "¿Como quieres llamar al archivo de los usuarios?: " usersfilecred
                echo -e "${GREEN}Enumerando usuarios del dominio ${ENDCOLOR}\n"
                rpcclient -U "$userrpc%$passrpc" $ip -c "enumdomusers" | grep -oP '\[.*?\]' | grep -v "0x" | tr -d '[]' > $usersfilecred
                echo -e "\n${GREEN}Archivo${ENDCOLOR} ${YELLOW}$usersfilecred${ENDCOLOR} ${GREEN}creado exitosamente ${ENDCOLOR}"
            elif [ $resprpcclientcred == N ] || [ $resprpcclientcred == n ]; then
                echo -e "${GREEN}Enumerando usuarios del dominio ${ENDCOLOR}\n"
                rpcclient -U "$userrpc%$passrpc" $ip -c "enumdomusers"
                echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            else
                echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
            fi
            ;;

        2)
            echo -e "${GREEN}Enumerando grupos del dominio ${ENDCOLOR}"
            rpcclient -U "$userrpc%$passrpc" $ip -c "enumdomgroups"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        3)
            echo -e "${GREEN}Listando descripciones de los usuarios ${ENDCOLOR}"
            rpcclient -U "$userrpc%$passrpc" $ip -c "querydispinfo"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        4)
            read -p "Indique el RID del usuario: " ridusercred
            echo -e "${GREEN}Listando informacion del usuaio con RID${ENDCOLOR} ${YELLOW}$ridusercred ${ENDCOLOR}\n"
            rpcclient -U "$userrpc%$passrpc" $ip -c "queryuser $ridusercred"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        5)
            read -p "Indique el RID del grupo: " ridgroupcred
            echo -e "${GREEN}Listando informacion del grupo con RID${ENDCOLOR} ${YELLOW}$ridgroupcred ${ENDCOLOR}\n"
            rpcclient -U "$userrpc%$passrpc" $ip -c "querygroupmem $ridgroupcred"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
            ;;

        6)
            echo -e "Saliendo..."
            ;;

        *)
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
            ;;
    esac
}
# FIN MENU OPCIONES RPCCLIENT CON CREDENCIALES

# FUNCION RPC SUBMENU2
funcrpc () {
    which rpcclient > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        read -p "¿Dispones de credenciales? [S/N]: " credoptionrpc
        if [ $credoptionrpc == S ] || [ $credoptionrpc == s ]; then
            read -p "Introduzca el nombre del usuario: " userrpc
            read -p "Introduzca la contraseña: " passrpc
            menurpcclientcred
        elif [ $credoptionrpc == N ] || [ $credoptionrpc == n ]; then
            menurpcclient
        else
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
        fi
    else
        echo -e "\n${RED}rpcclient no encontrado en el Path, instalelo usando sudo apt install rpcclient${ENDCOLOR}"
    fi
}
# FIN FUNCION RPC SUBMENU2

# FUNCION LDAP SUBMENU2
funcldap () {
    which ldapsearch > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        read -p "¿Posee el nombre del Dominio y del TLD? [S/N]: " respldap
        if [ $respldap == S ] || [ $respldap == s ]; then
            read -p "Introduzca el nombre del Dominio: " domainnameldap
            read -p "Introduzca el TLD: " tldnameldap
            echo -e "${GREEN}Usando ldapsearch para enumerar en profundidad: ${ENDCOLOR}"
            ldapsearch -x -H ldap://$ip -D '' -w '' -b "DC=$domainnameldap,DC=$tldnameldap"
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"

        elif [ $respldap == N ] || [ $respldap == n ]; then
            echo -e "${GREEN}Usando ldapsearch para enumerar: ${ENDCOLOR}"
            ldapsearch -x -H ldap://$ip -s base namingcontexts
            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
        else
            echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
        fi
    else
        echo -e "\n${RED}ldapsearch no encontrado en el Path, instalelo usando sudo apt install ldapsearch${ENDCOLOR}"
    fi
}
# FIN FUNCION LDAP SUBMEU2

# FUNCION SMB SUBMENU2
funcsmb () {
    which crackmapexec > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}Seleccione una opcion: ${ENDCOLOR}"
        echo -e "1) Informacion del dominio usando crakmapexec"
        echo -e "2) Listar recursos compartidos\n"

        # LEER OPCION INTRODUCIDA POR TECLADO
        read -p "Opcion: " smboption
        echo -e "\n"

        case $smboption in
            1)
                echo -e "${GREEN}Listando informacion del dominio con crackmapexec ${ENDCOLOR}"
                crackmapexec smb $ip
                echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                ;;
            2)
                # PREGUNTAR AL USUARIO SI DISPONE DE CREDENCIALES
                read -p "¿Dispones de credenciales? [S/N]: " credoption
                if [ $credoption == S ] || [ $credoption == s ]; then
                    read -p "Escribe el nombre de usuario: " username
                    read -p "Escribe la contraseña: " pass

                    # LISTAR RECURSOS COMPARTIDOS CON CREDENCIALES
                    read -p "Con que herramienta quiere listar los recursos compartidos crackmapexec(C), smbmap(M), smbclient(L) [C/M/L]: " sharesoptioncred
                    # CRACKMAPEXEC
                    if [ $sharesoptioncred == C ] || [ $sharesoptioncred == c ]; then
                        echo -e "\n${GREEN}Listando recursos compartidos con crackmapexec usando credenciales${ENDCOLOR}"
                        crackmapexec smb $ip -u "$username" -p "$pass" --shares
                        echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                    # SMBMAP
                    elif [ $sharesoptioncred == M ] || [ $sharesoptioncred == m ]; then
                        read -p "Introduce el nombre del dominio: " domnameshared
                        echo -e "\n${GREEN}Listando recursos compartidos con smbmap usando credenciales${ENDCOLOR}"
                        smbmap -H $ip -u "$username" -p "$pass" -d "$domnameshared"
                        echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                    # SMBCLIENT
                    elif [ $sharesoptioncred == L ] || [ $sharesoptioncred == l ]; then
                        echo -e "\n${GREEN}Listando recursos compartidos con smbclient usando credenciales${ENDCOLOR}"
                        smbclient -U "$username%$pass" -L //$ip
                        echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                    else
                        echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
                    fi
                elif [ $credoption == N ] || [ $credoption == n ]; then
                    read -p "Con que herramienta quiere listar los recursos compartidos crackmapexec(C), smbmap(M), smbclient(L) [C/M/L]: " sharesoption
                    # CRACKMAPEXEC NULL SESSION
                    if [ $sharesoption == C ] || [ $sharesoption == c ]; then
                        echo -e "\n${GREEN}Listando recursos compartidos con crackmapexec usando credenciales${ENDCOLOR}"
                        crackmapexec smb $ip --shares
                        echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                        # SMBMAP NULL SESSION
                        elif [ $sharesoption == M ] || [ $sharesoption == m ]; then
                            echo -e "\n${GREEN}Listando recursos compartidos con smbmap usando credenciales${ENDCOLOR}"
                            smbmap -H $ip
                            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                        # SMBCLIENT NULL SESSION
                        elif [ $sharesoption == L ] || [ $sharesoption == l ]; then
                            echo -e "\n${GREEN}Listando recursos compartidos con smbclient usando credenciales${ENDCOLOR}"
                            smbclient -L //$ip -N
                            echo -e "\n${GREEN}Terminado con exito ${ENDCOLOR}"
                    fi
                else
                   echo -e "\n${RED}Opcion no valida ${ENDCOLOR}" 
                fi
                ;;
            *)
                echo -e "\n${RED}Opcion no valida ${ENDCOLOR}"
                ;;
        esac
    else
         echo -e "\n${RED}crackmapexec no encontrado en el Path, instalelo usando sudo apt install crackmapexec${ENDCOLOR}"
    fi
}
# FIN FUNCION SMB SUBMENU2

# SUBMENU2
submenu2 () {
    echo -e "\n${GREEN}Seleccione una opcion de puerto a escanear: ${ENDCOLOR}"
    echo -e "1) Puerto 53 DNS"
    echo -e "2) Puerto 80 HTTP"
    echo -e "3) Puerto 88 KERBEROS"
    echo -e "4) Puerto 135 RPC"
    echo -e "5) Puerto 389 LDAP"
    echo -e "6) Puerto 445 SMB"
    echo -e "7) Salir\n"

    # LEER OPCION INTRODUCIADA POR TECLADO
    read -p "Opcion: " enumoption
    echo -e "\n"

    case $enumoption in
        1)
            funcdns
            ;;
        2)
            funchttp
            ;;
        3)
            funckerberos
            ;;
        4)
            funcrpc
            ;;
        5)
            funcldap
            ;;
        6)
            funcsmb
            ;;
        7)
            echo -e "Saliendo..."
            ;;
        *)
            echo -e "${RED}Opcion no valida ${ENDCOLOR}"
            ;;
    esac
}
# FIN SUBMENU2

# SINCRONIZAR HORA
sinchora () {
# BUSCA NTPDATE EN EL PATH EN SEGUNDO PLANO
    which ntpdate > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        ntpdate $ip
        echo -e "${GREEN}Hora actualizada con exito${ENDCOLOR}"
    else
        echo -e "${RED}ntpdate no encontrado en el PATH, instalelo usando sudo apt install ntpdate${ENDCOLOR}"
    fi
}
# FIN SINCRONIZAR HORA
# FIN FUNCIONES

# FUNCION PRINCIPAL
# COMPRUEBA SI ERES ROOT
if [ "$(echo $UID)" == "0" ]; then
    # COMPRUEBA QUE SE EJECUTA CON UN ARGUMENTO
    if [ $# -eq 1 ]; then
        # BIENVENIDA
        echo -e "${GREEN}Bienvenido a la herramietna de enumeracion de Active Directory ${ENDCOLOR}\n"

        # MENU
        echo -e "\n${GREEN}Seleccione una opcion de enumeracion: ${ENDCOLOR}"
        echo -e "1) Escaner de puertos"
        echo -e "2) Enumeracion en profundidad de puertos especificos"
        echo -e "3) Sincroizar hora con el AD"
        echo -e "4) Salir\n"

        # LEER OPCION INTRODUCIADA POR TECLADO
        read -p "Opcion: " option
        echo -e "\n"

        case $option in
            1)
                submenu1
                ;;
            2)
                submenu2
                ;;
            3)
                sinchora
                ;;
            4)
                echo -e "Saliendo...\n"
                ;;
            *)
                echo -e "${RED}Opcion no valida ${ENDCOLOR}\n"
                ;;
        esac

    # FIN COMPRUEBA QUE SE EJECUTA CON UN ARGUMENTO
    else
        echo -e "${RED} USO: ./AD_Scanner [IP] ${ENDCOLOR}"
        echo -e "${RED} EJEMPLO: ./AD_Scanner 192.168.1.10 ${ENDCOLOR}"
    fi
# FIN COMPRUEBA SI ERES ROOT
else
    echo -e "${RED} Este programa es necesario que lo corras como root ${ENDCOLOR}"
fi
# FIN FUNCION PRINCIPAL


