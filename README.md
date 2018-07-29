# Teamspeak Script Environment
---
Mithilfe des Scripts und des Services soll die Arbeit mit Teamspeak automatisiert werden. **ACHTUNG: Das Script unterstützt derzeit nur die 64 bit Version!**

# Installation
---
## Service installieren
Die Datei "teamspeak.service" unter /etc/systemd/system/teamspeak.service einfügen.

## Teamspeak Script
Empfohlen ist es das Script in das Verzeichnis /root abzulegen und immer als Root-User auszuführen.

## Enrichten der Umgebung
Es musss ein eigener Nutzer für die Ausführung des Servers angelegt werden. Dafür wird mit Root-Rechten folgender Befehl ausgeführt:
`adduser teamspeak --system --home /usr/local/bin/teamspeak --disabled-login`

## Ausführung des Scripts
Als Root-Nutzer gibt man ./ts3update.sh in die Kommandozeile ein. Das Script frägt die Version ab, die vom Server installiert werden soll. Dort gibt man die gewünschte Version ein, wie sie auf der Homepage zu sehen ist (z. B. 3.2.0). Anschließend führt das Script alle Operationen durch.
