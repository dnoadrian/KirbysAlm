# Cat Jumper

Ein kleines Pixel-Spiel fürs Handy: Deine Katze läuft über eine Bergwiese und springt über alles, was im Weg steht: Wanderer, Gleitschirmflieger, Skifahrer und rote Wollknäuel. Im Hintergrund sitzt Kirby, die schwarz-weiße Katze, und schleckt den Schnee von den Gipfeln.

**Spielen:** https://dnoadrian.github.io/Temp/ oder `index.html` direkt im Browser öffnen.

## Lobby

In der Lobby spielt deine Katze mit einem Wollknäuel. Links oben stehen untereinander **Bestenliste**, **Shop** und **Inventar**, rechts unten der große **Start**-Knopf. Bei Start läuft die Katze einfach los: Die Menüs gleiten weg und die Landschaft zieht vorbei. Nach dem Verlieren geht es mit **Nochmal** genauso sofort weiter oder mit **Lobby** zurück.

## Steuerung

Nur Tippen (bzw. Klicken):

- **Tippen:** springen (im Spiel steht dazu keine Erklärung mehr)
- **In der Luft nochmal tippen:** Doppelsprung (ab Level 2, mit Salto)

Oben rechts installiert der kleine Download-Knopf die App (nur im Browser sichtbar), der Lautsprecher schaltet den Ton.

## Deine Katze

Beim ersten Start legst du den Namen deiner Katze fest, bevor es in die Lobby geht. Alle starten mit der weißen Standard-Katze. Sechs weitere gibt es im Shop unter **Katzen**, jede mit eigener Felllänge:

| Katze | Fell | Fische |
| --- | --- | --- |
| Schneeweiß | Kurzhaar | gratis |
| Grau getigert | Halblanghaar | 30 |
| Mitternacht (schwarz) | Kurzhaar | 40 |
| Orange | Halblanghaar | 60 |
| Siam | Kurzhaar | 90 |
| Goldkatze (glitzert) | Halblanghaar | 150 |
| Galaxie (glitzert) | Langhaar | 200 |

Im Inventar wählst du, mit welcher deiner Katzen du spielst, und kannst den Namen ändern.

## Bestenliste

Die Bestenliste zeigt deine 10 besten Runden auf diesem Gerät: wie viele Hindernisse du übersprungen hast, mit Level und Datum.

## Fische, Shop und Inventar

Es gibt keine Punkte, nur Fische. Sie sind die Währung und werden im Browser gespeichert. Fische gibt es auf der Strecke, bei Events, für jede 5er-Serie (+2) und für jeden Gegner, den du mit Regenbogen-Kraft wegschleuderst.

Im **Shop** gibt es Upgrades (Regenbogen-Stern, Fisch-Magnet, Dreifachsprung, Glückspfote), Katzen (siehe oben) und 8 Cosmetics: Tirolerhut, Weihnachtsmütze, Krone, Sonnenbrille, Goldkette, Schal, Strickpulli und Ringelsocken. Pro Körperstelle (Kopf, Augen, Hals, Körper, Pfoten) ist eines angezogen. Im **Inventar** siehst du deine Katze, wählst eine deiner Katzen, siehst deine Upgrades und ziehst Cosmetics an oder aus. Gekaufte Katzen und Cosmetics kannst du auch direkt im Shop auswählen bzw. an- und ausziehen. Cosmetics zählen nicht zur Hitbox.

## Spannung

- **Sprung-Bewertung:** Super!, Perfekt!, Unglaublich! mit Serie (1x, 2x ...).
- **Regenbogen-Stern:** liegt selten auf der Strecke oder rettet dich einmal pro Runde (Upgrade). 4 bis 5 Sekunden unverwundbar, Gegner fliegen weg.
- **Zufalls-Events:** Sternschauer, Fischregen, Wollknäuel (ab Level 2: rote Wollknäuel rollen heran) und Turbo-Rausch.

## Oberfläche

Große Holzknöpfe mit dezentem Rautengitter und Fenster aus Brettern mit rotem Kopf. Die Schrift ist weiß (Minecraft-Schrift). Grün heißt los oder kaufen, Rot heißt zurück oder schließen, Braun ist alles andere.

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

Mit jedem Level wird es 2,5 Stunden später: Level 1 beginnt um 08:00, Level 2 um 10:30, Level 5 zum Sonnenuntergang um 18:00, Level 7 um 23:00. Level und Uhrzeit stehen kurz im Banner, wenn ein Level beginnt, die Sonne wandert mit. Oben rechts siehst du nur deine Fische.

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
