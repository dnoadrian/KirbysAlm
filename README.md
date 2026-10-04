# Cat Jumper

Spring über Adrian und Valentina! Ein kleines Pixel-Spiel fürs Handy: Eine weiße Katze läuft über eine Bergwiese und springt über Adrian und Valentina (das Mädchen mit den braunen Haaren). Im Hintergrund sitzt Kirby, die schwarz-weiße Katze, und schleckt den Schnee von den Gipfeln.

**Spielen:** https://dnoadrian.github.io/Temp/ (sobald GitHub Pages eingeschaltet ist), oder `index.html` direkt im Browser öffnen.

## Lobby

In der Lobby stehen links unten **Shop**, **Inventar** und **Start**. Start öffnet mit einem Kreis-Übergang das Spiel. Nach dem Verlieren geht es mit **Nochmal** direkt weiter oder mit **Lobby** zurück.

## Steuerung

Nur Tippen (bzw. Klicken):

- **Tippen:** springen
- **In der Luft nochmal tippen:** Doppelsprung (ab Level 2, mit Salto)

Oben rechts lädt der Pfeil-Knopf die Seite bzw. App neu und holt die neueste Version, der Lautsprecher schaltet den Ton.

## Fische, Shop und Inventar

Es gibt keine Punkte mehr, nur Fische. Sie sind die Währung und werden im Browser gespeichert. Fische gibt es auf der Strecke, bei Events, für jede 5er-Serie (+2) und für jeden Gegner, den du mit Regenbogen-Kraft wegschleuderst.

Im **Shop** gibt es Upgrades (Regenbogen-Stern, Fisch-Magnet, Dreifachsprung, Glückspfote) und Katzen-Skins (Silbergrau, Mitternacht, Rotes Tigerle, Siam, Goldkatze, Galaxie). Im **Inventar** siehst du deine Upgrades und ziehst Skins an.

## Spannung

- **Sprung-Bewertung:** Super!, Perfekt!, Unglaublich! mit Serie (1x, 2x ...).
- **Regenbogen-Stern:** liegt selten auf der Strecke oder rettet dich einmal pro Runde (Upgrade). 4 bis 5 Sekunden unverwundbar, Gegner fliegen weg.
- **Zufalls-Events:** Sternschauer, Fischregen, Lawine (ab Level 2) und Turbo-Rausch.

## Oberfläche

Drei Stile zum Ausprobieren: Almhütte (Standard), `#bonbon` und `#neon` an die Adresse anhängen.

## Level

| Level | Name | Neu |
| --- | --- | --- |
| 1 | Almwiese | Adrian und Valentina stehen im Weg |
| 2 | Adrian-Turm | Adrian und Valentina zu zweit, Valentina auf Adrians Schultern |
| 3 | Gleitschirm | Adrian fliegt: tief drüber springen, hoch drunter durchlaufen |
| 4 | Skipiste | Ski-Adrian kommt schneller entgegen |
| 5 | Alpenglühen | Drei auf einmal, Kombinationen |
| 6 | Sternennacht | Alles zusammen, bei Nacht |
| 7+ | Endlos-Alm | Immer schneller |

Mit jedem Level wird es 2,5 Stunden später: Level 1 beginnt um 08:00, Level 2 um 10:30, Level 5 zum Sonnenuntergang um 18:00, Level 7 um 23:00. Die Uhrzeit steht oben links, die Sonne wandert mit. Fische geben 20 Bonuspunkte.

## Als App installieren

Die Seite ist eine Progressive Web App (`manifest.webmanifest`, `sw.js`, `icons/`) und läuft danach im Vollbild im Querformat, auch offline.

- **Android (Chrome):** Auf dem Startbildschirm erscheint „Als App installieren“, oder im Browser-Menü „App installieren“.
- **iPhone (Safari):** Teilen-Knopf, dann „Zum Home-Bildschirm“.

Das funktioniert nur über `https://` (also über GitHub Pages), nicht beim direkten Öffnen der Datei.

## Online stellen

In den Repository-Einstellungen unter *Settings → Pages* bei *Source* „Deploy from a branch“ wählen, dann den Branch mit `index.html` und den Ordner `/ (root)`.

Wenn du das Spiel änderst, erhöhe die Versionsnummer `CACHE` in `sw.js`, damit installierte Apps die neue Version laden.

## Schrift

Die Oberfläche nutzt die Schrift [„Minecraft“ von Pwnage_Block](http://fontstruct.com/fontstructions/show/432966) unter [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/), um die Zeichen Ä Ö Ü ä ö ü ß · ergänzt. Die ergänzte Schrift ist direkt in `index.html` eingebettet und steht unter derselben Lizenz.
