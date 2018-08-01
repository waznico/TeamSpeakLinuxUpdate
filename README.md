_English version below_

_DE_
# Teamspeak Script Environment
Mithilfe des Scripts und des Services soll die Arbeit mit Teamspeak automatisiert werden. **ACHTUNG: Das Script unterstützt derzeit nur die 64 bit Version!**

# Installation
## Service installieren
Die Datei "teamspeak.service" unter /etc/systemd/system/teamspeak.service einfügen.

## Teamspeak Script
Empfohlen ist es das Script in das Verzeichnis /root abzulegen und immer als Root-User auszuführen.

## Enrichten der Umgebung
Es musss ein eigener Nutzer für die Ausführung des Servers angelegt werden. Dafür wird mit Root-Rechten folgender Befehl ausgeführt:
`adduser teamspeak --system --home /usr/local/bin/teamspeak --disabled-login`

## Ausführung des Scripts
Als Root-Nutzer gibt man ./ts3update.sh in die Kommandozeile ein. Das Script frägt die Version ab, die vom Server installiert werden soll. Dort gibt man die gewünschte Version ein, wie sie auf der Homepage zu sehen ist (z. B. 3.2.0). Anschließend führt das Script alle Operationen durch.

# Projekt unterstützen
Über die Issue-Funktion von GitHub können Fehler gemeldet oder Vorschläge unterbreitet werden.

_EN_
# Teamspeak Script Environment
This script and service supports you to install and upgrade the TeamSpeak server component. **ATTENTION: Currently only 64-bit version of the TeamSpeak server is supported!**

# Installation
## Install service
Copy the file "teamspeak.service" into the following directory: /etc/systemd/system/teamspeak.service

## Teamspeak Script
I recommend to store the 'ts3update.sh' script file at the directory /root. Root privilegues are also required to run the script.

## Configure the environment
A user has to be setup for running the teamspeak server. Run the following command with root privilegues to setup the user:
`adduser teamspeak --system --home /usr/local/bin/teamspeak --disabled-login`

## Execute the script
If you're logged in as root user, you can type `./ts3update.sh` into the command line. At first the script asks you which version of TeamSpeak you want to install. Type in the version you want to install, like you can see on the homepage (i. e. 3.2.0). After that the script will update your teamspeak server.

# Contribute to the project
With the issue feature you can report a bug or purpose improvements.
