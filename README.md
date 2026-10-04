# Cat Jumper

Ein kleines Pixel-Spiel fürs Handy: Deine Katze läuft über eine Bergwiese und springt über alles, was im Weg steht: Wanderer, Gleitschirmflieger, Skifahrer und rote Wollknäuel. Im Hintergrund sitzt Kirby, die schwarz-weiße Katze, und schleckt den Schnee von den Gipfeln.

**Spielen:** https://dnoadrian.github.io/Temp/ oder `index.html` direkt im Browser öffnen.

## Lobby

In der Lobby stehen links unten **Shop**, **Inventar**, **Bestenliste** und **Start**. Start öffnet mit einem Kreis-Übergang das Spiel. Nach dem Verlieren geht es mit **Nochmal** direkt weiter oder mit **Lobby** zurück.

## Steuerung

Nur Tippen (bzw. Klicken):

- **Tippen:** springen
- **In der Luft nochmal tippen:** Doppelsprung (ab Level 2, mit Salto)

Oben rechts lädt der Pfeil-Knopf die Seite bzw. App neu und holt die neueste Version, der Lautsprecher schaltet den Ton.

## Deine Katze

Beim ersten Start gibst du deiner Katze nur einen Namen. Alle starten mit der weißen Katze. Weitere Katzen gibt es im Shop unter **Katzen**, jede mit eigener Felllänge:

| Katze | Fell | Fische |
| --- | --- | --- |
| Schneeweiß | Kurzhaar | gratis |
| Grau getigert | Halblanghaar | 30 |
| Mitternacht (schwarz) | Kurzhaar | 40 |
| Weiß-Braun | Langhaar | 50 |
| Orange | Halblanghaar | 60 |
| Schoko (braun) | Kurzhaar | 60 |
| Moppel (dicker grau-weißer Kater) | Kurzhaar | 80 |
| Siam | Kurzhaar | 90 |
| Goldkatze (glitzert) | Halblanghaar | 150 |
| Galaxie (glitzert) | Langhaar | 200 |

Im Inventar wählst du, mit welcher deiner Katzen du spielst, und kannst den Namen ändern.

## Bestenliste

Die Bestenliste zeigt deine 10 besten Runden auf diesem Gerät: wie viele Hindernisse du übersprungen hast, mit Level und Datum.

## Fische, Shop und Inventar

Es gibt keine Punkte, nur Fische. Sie sind die Währung und werden im Browser gespeichert. Fische gibt es auf der Strecke, bei Events, für jede 5er-Serie (+2) und für jeden Gegner, den du mit Regenbogen-Kraft wegschleuderst.

Im **Shop** gibt es Upgrades (Regenbogen-Stern, Fisch-Magnet, Dreifachsprung, Glückspfote), Katzen (siehe oben) und 8 Cosmetics: Tirolerhut, Weihnachtsmütze, Krone, Sonnenbrille, Goldkette, Schal, Strickpulli und Ringelsocken. Pro Körperstelle (Kopf, Augen, Hals, Körper, Pfoten) ist eines angezogen. Im **Inventar** siehst du deine Katze, wählst eine deiner Katzen, siehst deine Upgrades und ziehst Cosmetics an oder aus. Cosmetics zählen nicht zur Hitbox.

## Spannung

- **Sprung-Bewertung:** Super!, Perfekt!, Unglaublich! mit Serie (1x, 2x ...).
- **Regenbogen-Stern:** liegt selten auf der Strecke oder rettet dich einmal pro Runde (Upgrade). 4 bis 5 Sekunden unverwundbar, Gegner fliegen weg.
- **Zufalls-Events:** Sternschauer, Fischregen, Wollknäuel (ab Level 2: rote Wollknäuel rollen heran) und Turbo-Rausch.

## Oberfläche

Farben: Stein und Holz, dazu Grün und Rot. Die Schrift ist immer weiß (Minecraft-Schrift). Grün heißt los oder kaufen, Rot heißt zurück oder schließen, Braun ist alles andere.

**Stein & Holz:** Alle Knöpfe, Anzeigen und Fenster sind aus Stein mit Rautengitter und in Holz mit Nägeln eingefasst. Fensterköpfe sind Holzbretter, die Kärtchen dunkler Stein. Das Menü steht unten links.

Die drei Vorschläge davor gibt es zum Vergleich noch mit einem Zusatz hinten an der Adresse: `#v1` Gitterholz, `#v2` Moosbretter, `#v3` Block-Leiste.

## Level

| Level | Name | Neu |
| --- | --- | --- |
| 1 | Almwiese | Wanderer stehen im Weg |
| 2 | Menschenturm | Zu zweit, und einer steht auf den Schultern des anderen |
| 3 | Gleitschirm | Fliegt jemand tief: drüber springen, hoch: drunter durchlaufen |
| 4 | Skipiste | Skifahrer kommen schneller entgegen |
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
