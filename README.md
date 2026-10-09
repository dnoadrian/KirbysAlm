# Kirbys Alm

Ein kleines Pixel-Spiel fürs Handy und den PC: Deine Katze läuft über eine Bergwiese und springt über alles, was im Weg steht: Wanderer in Lederhose, Wanderinnen im Dirndl, Gleitschirmflieger, Skifahrer und rote Wollknäuel. Im Hintergrund sitzt Kirby, die schwarz-weiße Katze, und schleckt den Schnee von seinem Gipfel.

**Spielen:** https://dnoadrian.github.io/KirbysAlm/ oder `index.html` direkt im Browser öffnen.

## Konto

Beim ersten Start gibst du den Namen deiner Katze und ein Passwort ein. Ist der Name auf diesem Gerät neu, wird ein Konto angelegt, sonst wirst du angemeldet. In den Einstellungen kannst du dich abmelden, so können mehrere Leute auf einem Gerät spielen.

Passwörter werden nie im Klartext gespeichert oder verschickt, sondern als PBKDF2-SHA-256-Hash (150 000 Runden, zufälliges Salz).

**Wichtig:** So wie das Spiel ausgeliefert wird, ist die Cloud noch nicht eingerichtet (`url` und `key` in `index.html` sind leer). Dann liegen Konten und Spielstände nur im Browser des jeweiligen Geräts: Ein Konto, das du am Handy anlegst, gibt es am PC nicht. Denselben Spielstand auf Handy und PC gibt es erst nach der einmaligen Einrichtung unten.

### Ein Konto auf Handy und PC (Cloud)

Nach einer einmaligen Einrichtung mit einem kostenlosen [Supabase](https://supabase.com)-Projekt (ca. 5 Minuten) gibt es denselben Spielstand auf allen Geräten: Konto am Handy anlegen, am PC mit Name und Passwort anmelden, fertig. Nach jedem Neuladen, beim Zurückwechseln ins Spiel und kurz nach jeder Änderung wird abgeglichen. Ohne Netz spielt man lokal weiter, später wird zusammengeführt (Fische zusammengezählt, Gekauftes vereint, höchste Upgrade-Stufe und höchster Missionsfortschritt, Angezogenes vom letzten Gerät). Lautstärke, Vibration und Sprache bleiben pro Gerät.

1. Auf supabase.com kostenlos registrieren und ein neues Projekt anlegen (Region z. B. Frankfurt).
2. Im Projekt **SQL Editor** öffnen, den ganzen Inhalt von `cloud/supabase.sql` einfügen und **Run** drücken.
3. Unter **Project Settings → API** (bzw. **API Keys**) die **Project URL** und den **anon**- oder **Publishable**-Key kopieren.
4. In `index.html` ganz oben im Script die Zeile `const CLOUD = Object.assign({ url: '', key: '' }, …)` suchen und beide eintragen, z. B. `{ url: 'https://abcd.supabase.co', key: 'sb_publishable_…' }`.
5. Committen, fertig. Der Key darf öffentlich sein: Die Tabelle ist von außen gesperrt, das Spiel ruft nur die Funktionen aus `cloud/supabase.sql` auf, und Spielstände gibt es nur mit dem passenden Passwort-Hash.

Bleibt `url` leer, gibt es keinen Abgleich: Jedes Gerät hat seine eigenen Konten. Eine `.env`-Datei ist auf GitHub Pages nicht möglich: Die Seite kann keine Dateien schreiben, und alles im Repository ist öffentlich.

## Lobby

Links oben stehen **Shop**, **Inventar** und **Missionen**, rechts unten der große **Start**-Knopf, oben rechts Fische und Einstellungen (dazu, wo der Browser es anbietet, ein Knopf zum Installieren). Deine Katze spielt mit einem Wollknäuel. Tippst du Kirby an, schnurrt er einmal kurz mit geschlossenen Augen (danach braucht er ein paar Sekunden Pause). Der Boden steht in der Lobby still, nur die Wolken ziehen.

Bei Start stupst ein Schmetterling die Katze an die Nase, sie rennt ihm hinterher, die Menüs gleiten weg. Nach dem Verlieren geht es mit **Nochmal** sofort weiter oder mit **Lobby** zurück.

## Steuerung

- **Handy:** Tippen = springen, in der Luft nochmal tippen = Doppelsprung (ab 250 m).
- **PC:** Leertaste, Pfeil hoch oder W springen; Enter startet; Escape pausiert. Auf großen Bildschirmen zoomt das Spiel hinein, damit man nicht weiter vorausschaut als am Handy.
- Oben rechts neben den Fischen öffnet **≡** das Menü mit Fortsetzen, Einstellungen und Lobby (am PC auch Escape). Escape geht immer einen Schritt zurück.
- Wo in der Lobby der Titel steht, zeigt das Spiel klein die gelaufenen Meter.

## Meter statt Level

Gezählt werden Meter. Bei 250, 550, 900, 1300 und 1750 m ändert sich die Strecke (Menschenturm, Gleitschirm, Skipiste, Alpenglühen, Sternennacht), danach geht es endlos weiter und alle 500 m wird es etwas schneller. Dabei läuft die Tageszeit weiter, vom Morgen über Abend und Nacht wieder in den Morgen (ohne eingeblendete Uhrzeit). Nach dem Verlieren siehst du Meter, Fische und Hürden.

## Spannung

- **Goldfische** sind 10 Fische wert.
- **Zufalls-Events:** Sternschauer (nur abends und nachts), Fischregen, Wollknäuel, Turbo-Rausch und Goldfisch-Schwarm.
- **Sturz:** Zeitlupe und Blitz, die Katze wird nach hinten geschleudert, landet mit X-Augen und sieht Sterne.
- **5 Easter Eggs** im Hintergrund: Almhütte mit Rauch, Murmeltier, Lawine, Heißluftballon und ein kreisender Adler. Sie sind selten.

## Shop

Alles kostet Fische, und zwar deutlich mehr als früher, damit sich Spielen lohnt.

- **Upgrades**, jedes in 3 Stufen: Regenbogen-Stern (rettet dich), Fisch-Magnet (einmal erfasste Fische fliegen sicher zu dir), Glückspfote (mehr Fische), Goldnase (mehr Goldfische).
- **Katzen:** Schneeweiß (Standard), Grau getigert, Mitternacht, Orange, Siam.
- **Cosmetics:** 20 Stück, je 4 für Kopf (Tirolerhut, Pudelmütze, Blumenkranz, Krone), Augen (Sonnenbrille, Herzbrille, Skibrille, Monokel), Hals (Schal, Fliege, Glöckchen, Goldkette), Körper (Strickpulli, Regenjacke, Trachtenweste, Heldenumhang) und Pfoten (Ringelsocken, Hüttenschuhe, Bergstiefel, Turnschuhe). Jeden Tag sind 3 davon im Shop. Jedes gibt einen kleinen Bonus (z. B. +3 % Fische). Gekaufte Cosmetics zieht man im Shop oder Inventar an und aus. Sie sitzen in jeder Pose fest an Kopf, Hals, Körper und Pfoten.

Die Goldkatze und die Begleiter gibt es nicht mehr. Wer sie gekauft hatte, bekommt die Fische dafür einmal zurück.

Den Namen zu ändern kostet 1000 Fische.

## Missionen

Jeden Tag gibt es 3 Missionen (z. B. 600 m laufen, 90 Fische sammeln, ein Easter Egg entdecken) und eine Login-Belohnung, die 7 Tage lang wächst.

## Einstellungen

Zwei Regler: **Musik** (Standard 40 %) und **Sounds** (Spiel und Knöpfe zusammen). Dazu Vibration an/aus, Sprache (Deutsch/English) und Abmelden. Während einer Runde erreichst du die Einstellungen über **≡**. Die Sounds laufen über einen Kompressor, damit man sie auch bei leiser Handy-Lautstärke gut hört; am Handy ist alles etwas lauter.

## Admin

Taste **0** öffnet das Admin-Panel (Benutzer `Adrian`, Passwort `1234`): Fische vergeben und alle Konten auf diesem Gerät löschen. Benutzer und Passwort stehen im Quelltext, das ist also kein echter Schutz.

## Als App installieren

Die Seite ist eine Progressive Web App (`manifest.webmanifest`, `sw.js`, `icons/`) und läuft danach im Vollbild im Querformat, auch offline.

- **Android (Chrome):** Download-Knopf oben rechts oder im Browser-Menü „App installieren“.
- **iPhone (Safari):** Teilen-Knopf, dann „Zum Home-Bildschirm“.

Wenn du das Spiel änderst, erhöhe die Versionsnummer `CACHE` in `sw.js`, damit installierte Apps die neue Version laden.

## Oberfläche

Stil **Trachtenstoff**: Knöpfe sind flache Bänder mit Schwalbenschwanz-Enden (Grün, Rot, Braun), Fenster haben einen schmalen rot-weißen Karorand und innen Leinen. Alle Rahmen sind kleine Pixel-SVGs direkt im Code.

## Klang

Alle Sounds und die Musik laufen durch einen weichen Tiefpass, damit nichts schrill klingt. Die Musik ist eine kleine Almmusik in D-Dur (Bass, Zither, Flöte in mittlerer Lage, warme Fläche).

## Schrift

**Almschrift** ist eine eigene, schlichte Pixelschrift für dieses Spiel: Großbuchstaben 5×7 Pixel, feine Serifen bei I, i, l und 1, mit Umlauten und ß. Sie ist als TrueType direkt in `index.html` eingebettet und sieht bei 10, 20, 30 … px am schärfsten aus.
