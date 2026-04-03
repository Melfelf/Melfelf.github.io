+++
title = "Melflin Display Architektur: Übersicht, Datenfluss und Verantwortlichkeiten"
date = 2026-04-03T10:13:00+02:00
draft = false
[extra]
lang = "de"
+++

# Melflin Display Architektur: Übersicht, Datenfluss und Verantwortlichkeiten

Nachdem der Workflow dokumentiert ist, lohnt sich ein zweiter Blick auf die **Architektur** des Systems. Nicht im Sinne von Buzzwords, sondern als klare Übersicht:

- welche Teile gibt es
- was ist deren Aufgabe
- wie fliessen die Daten
- wo liegen die typischen Fehlerquellen

## Architektur in einem Satz

Das Melflin-Display ist ein **statisch publiziertes Familien-Dashboard**, dessen Inhalte stündlich aus Kalender-, Wetter- und Transit-Datenquellen neu gebaut und über GitHub Pages bzw. `melf.ch` auf ein ePaper-Display ausgeliefert werden.

## Die grossen Bausteine

Man kann das System in fünf Ebenen aufteilen:

1. **Datenquellen**
2. **Feed-/Logikschicht**
3. **Rendering-Schicht**
4. **Publishing-Schicht**
5. **Anzeige-Schicht**

---

## 1. Datenquellen

### Outlook / Microsoft Graph
Es gibt zwei relevante Outlook-Kontexte:

#### Familienkonto
- `melflin2026@outlook.com`
- dient als primärer Familienkalender

#### Stefans persönliches Outlook-Konto
- wird nur ergänzend gelesen
- nur ausgewählte Einträge dürfen aufs Display
- aktuell nur Einträge mit **`Purple category`**

### Netatmo
Netatmo liefert die **lokalen Ist-Werte**:
- Draussen
- Wohnzimmer

Das ist wichtig, weil Forecast-Dienste für den aktuellen Zustand lokal oft zu ungenau sind.

### Open-Meteo
Open-Meteo liefert die **Vorhersage**:
- in 3h
- in 6h
- in 9h

### Transport Open Data
Transit kommt aus:
- `transport.opendata.ch`

Konkret für:
- **Bern, Felsenau**
- Richtung **Bern**
- RBS/S-Bahn-Logik

---

## 2. Feed- und Logikschicht

Die zentrale Orchestrierungsdatei ist:

```text
src/build_feed.py
```

Sie ist das Herzstück des Systems.

### Aufgabe von `build_feed.py`

Diese Datei:
- authentifiziert sich bei Graph
- liest Kalenderdaten
- liest Netatmo-Werte
- liest Open-Meteo-Forecasts
- liest Transit-Daten
- normalisiert und priorisiert Inhalte
- baut daraus einen gemeinsamen JSON-Feed

### Warum dieser Schritt wichtig ist

Ohne zentrale Feed-Schicht würde jede HTML-Seite ihre eigene Logik tragen. Das wäre schwer wartbar.

Mit der Feed-Schicht gilt:
- erst Daten normalisieren
- dann einmal sauber entscheiden
- erst danach rendern

## Das Feed-Objekt

Der erzeugte Feed enthält unter anderem:
- `today`
- `familyCalendar`
- `personalCalendar`
- `transit`
- `weather`
- `briefing`
- `message`
- `generatedAt`

Damit hat die Rendering-Schicht eine klare Eingabe.

---

## 3. Rendering-Schicht

### Hauptseite
```text
render/render_live_html.py
```

Diese Datei erzeugt die eigentliche Hauptansicht des Displays.

Sie rendert:
- Datum/Header
- Terminboxen
- Wetterblock
- Melflin-Block
- RBS-Abfahrten
- Update-Zeitstempel

### Familienseite
```text
render/render_family_html.py
```

Die zweite Seite ist schlichter und stärker auf Kalender/Familienübersicht fokussiert.

### Warum getrennte Renderer?

Weil sich damit Layout und Verantwortung besser trennen lassen:
- ein Renderer für die kuratierte Hauptseite
- ein Renderer für die Kalender-/Family-Ansicht

---

## 4. Publishing-Schicht

### Publish-Skript
```text
scripts/publish_pages.sh
```

Das Skript ist für die operative Ausführung zuständig.

### Schritte im Publish

1. Feed neu bauen
2. HTML-Seiten rendern
3. lokale `site/`-Artefakte aktualisieren
4. versionierte statische Dateien erzeugen
5. Inhalte ins Pages-Repo kopieren
6. Änderungen committen und pushen

### Warum versionierte Dateien?

Weil Caching ein echtes Problem war.

Daher existieren heute zusätzlich:
- `display-<timestamp>.html`
- `family-<timestamp>.html`
- `version.json`
- `latest.txt`

Das hilft beim Nachvollziehen und bei Debugging.

---

## 5. Anzeige-Schicht

### Öffentliches Hosting
Die fertigen Dateien landen im GitHub-Pages-Repo:
- `Melfelf.github.io`

und sind dann öffentlich erreichbar über:
- `https://melf.ch/melflin-display/`

### Device-Ausgabe
Das ePaper-Display lädt diese Seite über:
- **SenseCraft Web Content**

Wichtig war dabei die Erkenntnis:
- nicht lokale URLs
- nicht Canvas als Hauptworkflow
- sondern externe, statische Webauslieferung

Das war der stabilste Pfad.

---

## Datenfluss Ende-zu-Ende

So sieht der Ablauf logisch aus:

```text
Outlook / Netatmo / Open-Meteo / Transit API
        ↓
   src/build_feed.py
        ↓
   render/out/live-feed.json
        ↓
render/render_live_html.py + render/render_family_html.py
        ↓
   site/index.html + site/family.html
        ↓
scripts/publish_pages.sh
        ↓
Melfelf.github.io / static/melflin-display/
        ↓
https://melf.ch/melflin-display/
        ↓
SenseCraft Web Content
        ↓
reTerminal ePaper Display
```

---

## Wichtige Regeln im System

### Kalenderregeln
- Familienereignisse leben primär im Melflin-Konto
- Titelpräfixe helfen beim Filtern
- persönliche Einträge von Stefan nur mit `Purple category`

### Melflin-Content-Regeln
Der rechte Inhaltsblock folgt dieser Priorität:

**Info > Erinnerung > Spruch**

Quelle:
- `/root/.openclaw/workspace/display-note.md`

Fallback:
- `melflin-display/data/quotes.txt`

### Zeitregeln
- Display-Logik arbeitet mit **`Europe/Zurich`**
- UTC wird nur für API-Grenzen / Query-Fenster benutzt

---

## Typische Schwachstellen der Architektur

### 1. Upstream-Ausfälle
- Transit kann temporär nicht erreichbar sein
- Wetterquellen können unplausibel sein
- Outlook kann Auth-/Sync-Probleme haben

### 2. Caching
Mehrfach war nicht sofort klar, ob:
- Feed alt ist
- Webseite alt ist
- Device alt cached

### 3. Priorisierungslogik
Technisch funktioniert die Architektur, aber die inhaltliche Auswahl ist schwer:
- heute vs. morgen
- ganztägig vs. Uhrzeit
- Arthur/Familie vs. persönliche Purple-Termine

Das ist weniger ein Technikproblem als ein Produktentscheid.

---

## Verantwortlichkeiten im System

### Datenquellen
Liefern Rohdaten, aber keine Anzeige-Logik.

### `build_feed.py`
Verantwortlich für:
- Vereinheitlichung
- Priorisierung
- Zusammenbau

### Renderer
Verantwortlich für:
- visuelle Darstellung
- Lesbarkeit auf ePaper
- feste Layout-Entscheidungen

### Publish-Skript
Verantwortlich für:
- Build-Ablauf
- Dateiausgabe
- Übergabe ans öffentliche Repo

### GitHub Pages / melf.ch
Verantwortlich für:
- öffentliche Auslieferung

### Display / SenseCraft
Verantwortlich für:
- tatsächliche Anzeige auf dem Gerät

---

## Warum diese Architektur gut genug ist

Sie ist nicht maximal elegant, aber für den Zweck stark:

- nachvollziehbar
- scriptbar
- reparierbar
- günstig im Betrieb
- klar getrennt zwischen Quelle, Logik, Rendering und Hosting

Vor allem aber:

Sie ist **alltagstauglich**.

Nicht fancy-first. Sondern useful-first.

---

## Nächste sinnvolle Ausbaustufen

Wenn das System weiter wachsen soll, wären diese Schritte logisch:

1. **bessere Highlight-Auswahl** auf der Hauptseite
2. **robusterer Transit-Fallback/Cache**
3. **finale Moon- / Wetter-Icon-Bibliothek**
4. **mehrere Seiten / Rotationslogik**
5. **klarere Inhaltsstrategie für den Melflin-Block**
6. optional: **Tests für Feed-Bausteine**

---

## Kurzfazit

Die Melflin-Display-Architektur ist kein monolithisches Produkt, sondern ein bewusst pragmatisches System aus kleinen klaren Bausteinen.

Das macht sie wertvoll.

Denn wenn ein Teil spinnt, muss nicht alles neu erfunden werden. Man kann gezielt reparieren.

Und genau so sollte Familien-Automation eigentlich sein.
