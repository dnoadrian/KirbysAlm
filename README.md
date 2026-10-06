# Kirbys Alm

Ein kleines Pixel-Spiel fürs Handy und den PC: Deine Katze läuft über eine Bergwiese und springt über alles, was im Weg steht: Wanderer in Lederhose, Wanderinnen im Dirndl, Gleitschirmflieger, Skifahrer und rote Wollknäuel. Im Hintergrund sitzt Kirby, die schwarz-weiße Katze, und schleckt den Schnee von seinem Gipfel.

**Spielen:** https://dnoadrian.github.io/Temp/ oder `index.html` direkt im Browser öffnen.

## Konto

Beim ersten Start gibst du den Namen deiner Katze und ein Passwort ein. Ist der Name auf diesem Gerät neu, wird ein Konto angelegt, sonst wirst du angemeldet. In den Einstellungen kannst du dich abmelden, so können mehrere Leute auf einem Gerät spielen.

Das Spiel hat keinen Server. Konten und Spielstände liegen nur im Browser des jeweiligen Geräts. Passwörter werden nie im Klartext gespeichert, sondern als PBKDF2-SHA-256-Hash (150 000 Runden, zufälliges Salz). Eine `.env`-Datei ist auf GitHub Pages nicht möglich: Die Seite kann keine Dateien schreiben, und alles im Repository ist öffentlich.

## Lobby

Links oben stehen **Shop**, **Inventar** und **Missionen**, rechts unten der große **Start**-Knopf, oben rechts Fische und Einstellungen. Tippst du deine Katze an, rollt sie sich auf den Rücken; tippst du Kirby an, schnurrt er mit geschlossenen Augen. Der Boden steht in der Lobby still, nur die Wolken ziehen.

Bei Start stupst ein Schmetterling die Katze an die Nase, sie rennt ihm hinterher, die Menüs gleiten weg. Nach dem Verlieren geht es mit **Nochmal** sofort weiter oder mit **Lobby** zurück.

## Steuerung

- **Handy:** Tippen = springen, in der Luft nochmal tippen = Doppelsprung (ab 250 m).
- **PC:** Leertaste, Pfeil hoch oder W springen; Enter startet; Escape pausiert. Auf großen Bildschirmen zoomt das Spiel hinein, damit man nicht weiter vorausschaut als am Handy.
- Oben links im Spiel öffnet **≡** das Menü mit Fortsetzen, Lobby und Einstellungen.

## Meter statt Level

Gezählt werden Meter. Bei 250, 550, 900, 1300 und 1750 m ändert sich die Strecke (Menschenturm, Gleitschirm, Skipiste, Alpenglühen, Sternennacht), danach geht es endlos weiter. Dabei wird es immer später am Tag. Nach dem Verlieren siehst du Meter, Fische und Hürden.

## Spannung

- **Sprung-Bewertung** neben der Katze: Super!, Perfekt!, Unglaublich! mit Serie. Ganz knappe Sprünge bringen einen Bonus-Fisch, jede 5er-Serie zwei Fische.
- **Fisch-Fieber:** Bei jeder 10er-Serie gibt es 6 Sekunden doppelte Fische.
- **Goldfische** sind 10 Fische wert.
- **Zufalls-Events:** Sternschauer (nur abends und nachts), Fischregen, Wollknäuel, Turbo-Rausch und Goldfisch-Schwarm.
- **Sturz:** Zeitlupe, Blitz, die Katze wirbelt durch die Luft, landet mit X-Augen und sieht Sterne.
- **5 Easter Eggs** im Hintergrund: Almhütte mit Rauch, Murmeltier, Lawine, Heißluftballon und ein kreisender Adler. Sie sind selten.

## Shop

Alles kostet Fische, und zwar deutlich mehr als früher, damit sich Spielen lohnt.

- **Upgrades**, jedes in 3 Stufen: Regenbogen-Stern (rettet dich), Fisch-Magnet (einmal erfasste Fische fliegen sicher zu dir), Glückspfote (mehr Fische), Goldnase (mehr Goldfische).
- **Katzen:** Schneeweiß (Standard), Grau getigert, Mitternacht, Orange, Siam, Goldkatze.
- **Cosmetics:** 20 Stück, je 4 für Kopf, Augen, Hals, Körper und Pfoten. Jeden Tag sind 4 davon im Shop. Jedes gibt einen kleinen Bonus (z. B. +3 % Fische). Gekaufte Cosmetics zieht man im Shop oder Inventar an und aus.
- **Begleiter:** Spatz, Murmeltier oder Schneehase laufen mit und bringen dir regelmäßig einen Fisch.

Den Namen zu ändern kostet 1000 Fische.

## Missionen

Jeden Tag gibt es 3 Missionen (z. B. 600 m laufen, 90 Fische sammeln, ein Easter Egg entdecken) und eine Login-Belohnung, die 7 Tage lang wächst.

## Einstellungen

Lautstärke, Spiel-Sounds und Knopf-Sounds einzeln, Vibration an/aus, Sprache (Deutsch/English) und Abmelden. Die Sounds laufen über einen Kompressor, damit man sie auch bei leiser Handy-Lautstärke gut hört.

## Admin

Taste **0** öffnet das Admin-Panel (Benutzer `Adrian`, Passwort `1234`): Fische vergeben und alle Konten auf diesem Gerät löschen. Benutzer und Passwort stehen im Quelltext, das ist also kein echter Schutz.

## Als App installieren

Die Seite ist eine Progressive Web App (`manifest.webmanifest`, `sw.js`, `icons/`) und läuft danach im Vollbild im Querformat, auch offline.

- **Android (Chrome):** Download-Knopf oben rechts oder im Browser-Menü „App installieren“.
- **iPhone (Safari):** Teilen-Knopf, dann „Zum Home-Bildschirm“.

Wenn du das Spiel änderst, erhöhe die Versionsnummer `CACHE` in `sw.js`, damit installierte Apps die neue Version laden.

## Schrift

Die Oberfläche nutzt die Schrift [„Minecraft“ von Pwnage_Block](http://fontstruct.com/fontstructions/show/432966) unter [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/), um die Zeichen Ä Ö Ü ä ö ü ß · ergänzt. Die ergänzte Schrift ist direkt in `index.html` eingebettet und steht unter derselben Lizenz.
