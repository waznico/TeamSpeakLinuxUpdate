#!/bin/bash

# Root-User Abfrage
if [[ $EUID -ne 0 ]]; then
   echo "Das Update kann nur als Root-Nutzer durchgeführt werden!" 1>&2
   exit 1
fi

# Teamspeak Server installiert, wie benötigt?
if [ ! -d "/usr/share/teamspeak" ]; then
   echo "Der Teamspeak Server konnte nicht gefunden werden. Bitte installieren, wie benötigt!" 1>&2
   exit 1
fi

# Ist der Service vorhanden?
if [ ! -f "/etc/systemd/system/teamspeak.service" ]; then
   echo "Es gibt keinen Systemd Service für den Teamspeak-Server. Bitte den Service unter '/etc/systemd/system/teamspeak.service' anlegen."
   exit 1
fi

# Teamspeak Server stoppen
systemctl stop teamspeak.service

# Neue Teamspeak Server Version eintragen
echo "Bitte geben Sie die Teamspeak Server Version ein, auf die Teamspeak aktualisiert werden soll:"
read version

# Backup erzeugen
echo "Backup erzeugen..."
cp --backup=numbered /usr/share/teamspeak/ts3server.sqlitedb /usr/share/teamspeak/backup/
echo "Abgeschlossen"

# Download des Teamspeak Servers
echo "Download des Updates..."
cd /tmp
wget https://files.teamspeak-services.com/releases/server/${version}/teamspeak3-server_linux_amd64-${version}.tar.bz2
echo "Abgeschlossen"

# Entpacken des neuen TS-Servers
echo "Installation des Teamspeak-Updates..."
if [ ! -d "/tmp/teamspeak" ]; then
  mkdir teamspeak
fi
tar -xjf teamspeak3-server_linux_amd64-${version}.tar.bz2 -C /tmp/teamspeak

# Alten TS-Server löschen
echo "Vorgängerversion entfernen..."
rm -f /usr/share/teamspeak/ts3server

# Kopieren der neuen Dateien
echo "Neue Daten kopieren..."
cp -r /tmp/teamspeak/teamspeak3-server_linux_amd64/* /usr/share/teamspeak
echo "Abgeschlosssen"

# Neu: EULA akzeptieren
echo "EULA wird akzeptiert"
touch /usr/share/teamspeak/.ts3server_license_accepted

# Teamspeak Server starten
echo "Teamspeak Server starten..."
systemctl start teamspeak.service
echo "Das Update wurde durchgeführt!"
