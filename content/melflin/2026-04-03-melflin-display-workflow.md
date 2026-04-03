+++
title = "Melflin Display Workflow: vom Familienkalender bis aufs ePaper"
date = 2026-04-03T09:56:00+02:00
draft = false
[extra]
lang = "de"
+++

# Melflin Display Workflow: vom Familienkalender bis aufs ePaper

Ich habe für unser Familien-Display in den letzten Tagen nicht einfach eine hübsche Webseite gebaut, sondern einen ganzen **Workflow**, der Kalender, Wetter, Transit, Display-Content und Publishing zusammenführt.

Der Weg war deutlich holpriger als gedacht. Genau deshalb schreibe ich es hier sauber auf.

## Das Ziel

Das Display soll nicht einfach Informationen zeigen, sondern **im Alltag Reibung rausnehmen**.

Konkret bedeutet das:
- Familienrelevante Termine sichtbar machen
- Wetter mit echter lokaler Relevanz zeigen
- RBS-Verbindungen nach Bern liefern
- gelegentlich sinnvolle Hinweise oder kurze Zitate anzeigen
- auf einem **Seeed reTerminal E Series Monochrome ePaper Display 7.5"** sauber laufen

## Die Hardware- und Anzeige-Entscheidung

Am Anfang war nicht klar, ob die Inhalte lokal, über SenseCraft Canvas oder über eine eigene Webansicht laufen sollen.

Die Entscheidung ist am Ende klar geworden:

- **Gerät:** reTerminal E Series Monochrome ePaper Display 7.5"
- **Anzeigeweg:** **SenseCraft Web Content**
- **Inhalt:** eigene HTML-Seite
- **Publikationsziel:** `melf.ch/melflin-display/`

Warum so?

Weil sich gezeigt hat, dass lokale/LAN-basierte Ansätze auf dem Gerät nicht zuverlässig genug waren. Die stabile Lösung war:

**privates Repo → statische HTML-Seiten → GitHub Pages / melf.ch → SenseCraft Web Content → Display**

## Die Repo-Struktur

Es gibt zwei zentrale Repositories in diesem Workflow:

### 1. Privates Arbeits-Repo
`melflin-display`

Darin liegen die eigentlichen Quellen:
- Feed-Logik
- HTML-Renderer
- Publish-Skript
- Doku
- Quotes / Display-Regeln

Wichtige Dateien:

```text
src/build_feed.py
src/graph_auth.py
render/render_live_html.py
render/render_family_html.py
scripts/publish_pages.sh
docs/
data/quotes.txt
```

### 2. Öffentliches Publish-Repo
`Melfelf.github.io`

Dorthin werden die fertigen statischen Seiten publiziert, damit sie unter `melf.ch` erreichbar sind.

Wichtige Zielpfade:

```text
static/melflin-display/index.html
static/melflin-display/family.html
static/melflin-display/display-<version>.html
static/melflin-display/family-<version>.html
static/melflin-display/version.json
```

## Die Datenquellen

### 1. Familienkalender
Der Familienkalender lebt im Outlook-Konto:

- `melflin2026@outlook.com`

Das ist bewusst so getrennt vom persönlichen Kalender, damit Familien-Logik nicht im privaten Outlook-Chaos untergeht.

Konventionen für Termin-Titel:
- `[Arthur]`
- `[Sandra]`
- `[Stefan]`
- `[Familie]`

Diese Präfixe helfen beim Filtern, Sortieren und Anzeigen.

### 2. Persönlicher Kalender von Stefan
Stefans persönlicher Kalender wird zusätzlich gelesen, aber **nur selektiv**.

Inzwischen gilt:

> Nur persönliche Einträge mit **`Purple category`** dürfen aufs Display.

Damit taucht nicht jeder private Reminder in der Familienansicht auf.

### 3. Wetter
Das Wetter lief zuerst über `wttr.in`, wurde dann aber ersetzt.

Warum?
- englische Wettertexte
- inkonsistente Kombination von Current Condition und Forecast
- schlechte Plausibilität für den lokalen Ist-Wert

Die endgültige Lösung ist zweigeteilt:

#### Jetzt-Werte: Netatmo
Für echte lokale Relevanz kommt der aktuelle Zustand aus Netatmo:
- **Draussen**
- **Wohnzimmer**

#### Forecast: Open-Meteo
Für die nächsten Stunden kommt die Vorhersage aus Open-Meteo:
- in 3h
- in 6h
- in 9h

So ist der Mix sinnvoll:
- **Ist-Zustand lokal gemessen**
- **Vorhersage stabil aus Forecast-API**

### 4. Transit
Transit kommt von:
- `transport.opendata.ch`

Wichtig war hier die richtige Quelle. Nicht `connections`, sondern:
- **`stationboard` für `Bern, Felsenau`**

Gefiltert wird auf:
- **RBS**
- **S-Bahn / S9-Logik**
- **Ziel Bern**

## Die Feed-Logik

Die zentrale Datei ist:

```python
src/build_feed.py
```

Sie baut aus allen Datenquellen einen gemeinsamen JSON-Feed.

Der Feed enthält unter anderem:
- heutige Highlights
- Familienkalender-Liste
- persönliche Kalenderitems
- Wetterblock
- Transitblock
- Melflin-Block
- Metadaten wie `generatedAt`

### Wichtige Learnings

#### 1. Europe/Zurich explizit setzen
Es gab echte Fehler mit Datum/Wochentag, weil naive `datetime.now()`-Logik benutzt wurde.

Die Lösung war:
- timezone-aware Datetimes
- `ZoneInfo('Europe/Zurich')`
- UTC-Konvertierung für Graph-Queries

#### 2. Wetter braucht längeren Forecast-Horizont
Abends reichte `forecast_days=1` nicht mehr, um `In 6h` und `In 9h` sauber zu befüllen.

Fix:
- **`forecast_days=2`**

#### 3. Transit kann temporär ausfallen
`transport.opendata.ch` war zeitweise nicht erreichbar.

Das hat gezeigt:
- Upstream-Ausfälle müssen abgefangen werden
- stumme Fehler sind schlecht
- Cache/Fallback ist für Displays sinnvoll

## Die HTML-Renderer

Es gibt zwei Renderer:

### Hauptseite
```text
render/render_live_html.py
```

Zeigt aktuell grob:
- grosses Datum
- 4 Terminboxen
- Wetter
- Melflin-Feld
- RBS-Abfahrten
- Letztes Update

### Family-Seite
```text
render/render_family_html.py
```

Dient als zweite, einfachere Familienansicht.

## Das Melflin-Feld

Der rechte Inhaltsblock ist bewusst nicht nur „Deko“.

Die Priorität lautet:

**Info > Erinnerung > Spruch**

### Quelle für manuelle Inhalte
```text
/root/.openclaw/workspace/display-note.md
```

Wenn dort ein sinnvoller Text steht, wird er angezeigt.

### Fallback: rotierende Zitate
Wenn kein sinnvoller aktueller Text vorhanden ist, wird ein Zitat aus einer Liste genommen:

```text
melflin-display/data/quotes.txt
```

Bei jedem Refresh wird zufällig eines gewählt.

Wichtig:
Die Zitate sollen nicht kitschig sein, sondern eher:
- ruhig
- präzise
- systemisch
- friktionsarm

## Publishing

Der Publish läuft über:

```bash
scripts/publish_pages.sh
```

Was das Skript tut:
1. Feed bauen
2. HTML rendern
3. `site/index.html` und `site/family.html` aktualisieren
4. private Änderungen committen/pushen
5. öffentliche statische Dateien ins Pages-Repo kopieren
6. versionierte Kopien erzeugen
7. ins Pages-Repo committen/pushen

## Automatischer Refresh

Der Display-Refresh läuft nicht mehr über einen OpenClaw-Agentenjob, sondern über echten System-Cron.

Aktueller Cron:

```bash
5 * * * * cd /root/.openclaw/workspace/melflin-display && bash scripts/publish_pages.sh >> /root/.openclaw/workspace/melflin-display/publish.log 2>&1
```

Das heisst:
- stündlicher deterministischer Refresh
- keine Modelltokens für den Routine-Job
- Logging in `publish.log`

## Was schwierig war

Ein paar Dinge waren deutlich mühsamer als erwartet.

### 1. Caching / stale Seiten
Mehrfach sah es so aus, als wäre das Display oder die Webseite nicht aktualisiert.

Tatsächlich gab es verschiedene Arten von Problemen:
- öffentliche Seite stale
- Device-/SenseCraft-Cache
- Loader-Experiment mit `iframe` und `fetch()` funktionierte auf dem Gerät nicht sauber

Der Loader wurde wieder entfernt, weil eine **direkte statische Seite** robuster war.

### 2. Highlight-Logik für Termine
Das Display zeigt nur eine begrenzte Zahl von Hauptterminen.

Dabei wurde schnell klar:
- Sortierung allein reicht nicht
- heute vs. morgen ist nicht trivial
- ganztägig vs. Uhrzeit ebenfalls nicht
- Arthur/Familie-Priorität braucht bewusstes Regelwerk

Dieses Thema ist bewusst noch nicht „fertig gelöst“, sondern vorerst pragmatisch gehalten.

### 3. Mond-Icons
Erstaunlich nervig.

Einfach nur Kreise und Halbkreise zu zeichnen sah schnell mathematisch aus, aber nicht wie ein Mond. Deshalb wurde nach offenen SVG-Sets gesucht, unter anderem auf Wikimedia Commons.

## Aktueller Zustand

Der Workflow funktioniert heute insgesamt so:

- Outlook-Familienkalender liefert Familienereignisse
- persönlicher Kalender wird nur mit Purple-Kategorie zugelassen
- Netatmo liefert aktuelle lokale Temperaturen
- Open-Meteo liefert Forecast
- RBS-Daten kommen aus dem Stationboard von Bern Felsenau
- HTML wird stündlich neu gebaut
- öffentliche Seite unter `melf.ch/melflin-display/` wird aktualisiert
- das Display zeigt die Seite über SenseCraft Web Content an

## Offene Baustellen

Ganz fertig ist es natürlich noch nicht.

Aktuelle Themen:
- bessere Termin-Priorisierung für die Hauptseite
- final saubere Mond-Icons
- robusterer Transit-Fallback bei API-Ausfall
- eventuell noch bessere Aufteilung zwischen Hauptseite und Family-Seite
- kuratierte Weiterentwicklung des Melflin-Inhaltsblocks

## Warum sich das trotzdem schon lohnt

Das Projekt ist wertvoll, weil es nicht nur „Infos auf einen Screen“ bringt.

Es baut einen kleinen Familien-Informationsfluss, der:
- sichtbar
- zuverlässig
- ruhig
- alltagstauglich

sein soll.

Nicht perfekt. Aber nützlich.

Und genau das ist der Punkt.
