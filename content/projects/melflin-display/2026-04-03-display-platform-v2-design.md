+++
title = "Display Platform v2 Design"
date = 2026-04-03T22:38:00+02:00
draft = false
[extra]
lang = "de"
+++

# Display Platform v2 Design

Das aktuelle Melflin-Display ist inzwischen mehr als ein Experiment. Es liest echte Daten, baut Seiten, publiziert diese regelmässig und funktioniert im Alltag bereits brauchbar.

Genau deshalb ist jetzt der richtige Moment, den nächsten Schritt bewusst zu planen:

> Weg von einer einzelnen Display-Seite.
> Hin zu einer wiederverwendbaren Display-Plattform.

Dieses Dokument beschreibt dafür das Zielbild **Display Platform v2**.

---

## Ziel

Display Platform v2 soll ein **Baukastensystem** werden, das:

- verschiedene Datenquellen einsammelt
- diese einmal sauber normalisiert
- daraus wiederverwendbare Blöcke bildet
- daraus mehrere Seiten komponiert
- diese für unterschiedliche Displaygrössen und Geräteprofile rendert
- und reproduzierbar publiziert

Die Plattform soll nicht nur das aktuelle 7.5"-Display unterstützen, sondern als Grundlage für weitere Anzeigeformate taugen.

---

# 1. Architekturprinzipien

Display Platform v2 folgt bewusst den bereits definierten Architektur- und Agent-Instruktionsprinzipien:

- klare Schichten
- eine Wahrheitsquelle pro Verantwortungsbereich
- deterministische Pipeline
- Trennung von Logik und Darstellung
- Reparierbarkeit vor Cleverness
- Dokumentation als Teil des Systems

---

# 2. Kernideen der Plattform

## 2.1 Daten sind nicht Seiten

Rohdaten und normalisierte Daten dürfen nicht direkt an eine konkrete Seite gekoppelt sein.

Ein Outlook-Termin ist zunächst ein Kalenderobjekt – nicht „eine Karte links oben auf Seite 1“.

## 2.2 Seiten sind Kompositionen

Seiten sollen aus wiederverwendbaren Bausteinen zusammengesetzt werden.

Nicht mehr:
- ein Renderer mit viel Speziallogik

Sondern:
- Seite = definierte Auswahl von Blöcken

## 2.3 Geräte sind Profile

Ein Display ist nicht nur Breite × Höhe, sondern ein Profil mit:
- Auflösung
- Seitenverhältnis
- visueller Dichte
- Zahl sinnvoller Karten
- Typografie-Skalierung
- Icon-Skalierung
- Spacing-Regeln

## 2.4 Renderer setzen um, sie entscheiden nicht

Die Renderer sollen primär die visuelle Umsetzung machen.

Sie sollen nicht die Business-Logik enthalten, welche Daten wichtig sind. Diese Logik gehört vorher in:
- Auswahl
- Priorisierung
- Block-Komposition

---

# 3. Zielarchitektur

Die Plattform wird in folgende Ebenen getrennt.

## 3.1 Sources Layer

Diese Schicht liest Rohdaten aus externen oder lokalen Quellen.

Beispiele:
- Outlook Familienkalender
- Outlook Stefan Purple
- Netatmo
- Open-Meteo
- Transit API
- Display-Notiz
- Quotes
- später evtl. Home Assistant, Tasks, Müllplan, etc.

### Ziel
Nur lesen, nicht schon fürs Display denken.

---

## 3.2 Domain / Normalization Layer

Diese Schicht macht aus den Rohdaten ein gemeinsames Datenmodell.

### Zielobjekte
Beispiele:
- `CalendarItem`
- `WeatherCurrent`
- `WeatherForecastSlot`
- `TransitDeparture`
- `DisplayNote`
- `Quote`
- `BuildMeta`

### Aufgabe
- Zeitlogik bereinigen
- Zeitzonen sauber handhaben
- Quellen normalisieren
- Inkonsistenzen abbauen

---

## 3.3 Block Layer

Diese Schicht erzeugt wiederverwendbare inhaltliche Blöcke.

### Beispiele
- `hero_date`
- `today_cards`
- `family_agenda`
- `weather_summary`
- `weather_forecast`
- `transit_summary`
- `melflin_note`
- `last_update`
- `moon_phase`
- `tomorrow_preview`
- `week_overview`

### Aufgabe
- Inhalte kuratieren
- Prioritätslogik anwenden
- Block-Output definieren

Die Blöcke sind noch nicht an ein bestimmtes Gerät gebunden, sondern liefern neutrale Blockdaten.

---

## 3.4 Page Composition Layer

Seiten werden als Komposition definierter Blöcke beschrieben.

### Beispiele
- `home`
- `family`
- `weather`
- `transit`
- `overview`

### Aufgabe
- Reihenfolge der Blöcke festlegen
- welche Blöcke auf einer Seite erscheinen
- welche optional sind
- welche Prioritäten/Slots gelten

---

## 3.5 Device Profile Layer

Diese Schicht beschreibt Zielgeräte.

### Beispielprofile
- `reterminal_75_landscape`
- `eink_portrait_small`
- `wall_dashboard_large`

### Typische Eigenschaften
- width / height
- aspect ratio
- font scale
- max cards
- spacing scale
- icon scale
- page rotation support

---

## 3.6 Rendering Layer

Renderer bekommen:
- eine Seite
- ein Device-Profil
- die zugehörigen Blockdaten

und erzeugen daraus:
- HTML/CSS
- später vielleicht auch andere Formate

---

## 3.7 Publishing Layer

Diese Schicht ist für:
- Build-Artefakte
- Zielpfade
- Versionierung
- Copy/Pubish
- öffentliche Delivery

zuständig.

---

# 4. Domain-Modell v2

## 4.1 Kalenderobjekt

```text
CalendarItem
- id
- source
- title
- who
- categories
- start
- end
- all_day
- location
- relevance_class
```

## 4.2 Wetter aktuell

```text
WeatherCurrent
- source
- outside_temp_c
- inside_temp_c
- condition_key
- condition_text
- moon_phase_key
- observed_at
```

## 4.3 Wetter-Forecast-Slot

```text
WeatherForecastSlot
- hours_ahead
- temp_c
- condition_key
- condition_text
- rain_probability
```

## 4.4 Transit

```text
TransitDeparture
- line
- destination
- departure_at
- display_time
- platform
- source_state   # live / cache / error
```

## 4.5 Display-Note

```text
DisplayNote
- mode            # info / reminder / quote / auto
- text
- source
- updated_at
```

---

# 5. Block-Katalog v1

Die erste v2-Version sollte mit einem kleinen, stabilen Katalog starten.

## Empfohlene Startblöcke

### A. Header / Orientierung
- `hero_date`
- `last_update`

### B. Kalender
- `today_cards`
- `today_all_day`
- `tomorrow_preview`
- `family_agenda`

### C. Wetter
- `weather_current`
- `weather_forecast`
- `moon_phase`

### D. Mobilität
- `transit_rbs`

### E. Inhalt / Kontext
- `melflin_note`
- `quote_fallback`

---

# 6. Seitenmodell v2

## 6.1 Home

Ziel:
- kuratierte Vorderseite
- wichtigste Tagesinformation

Mögliche Blöcke:
- `hero_date`
- `today_cards`
- `weather_current`
- `transit_rbs`
- `melflin_note`
- `last_update`

## 6.2 Family

Ziel:
- vollständiger als Home
- Kalender-/Familienfokus

Mögliche Blöcke:
- `hero_date`
- `family_agenda`
- `tomorrow_preview`
- `last_update`

## 6.3 Weather

Ziel:
- Wetter-Detailansicht

Mögliche Blöcke:
- `weather_current`
- `weather_forecast`
- `moon_phase`
- `last_update`

## 6.4 Transit

Ziel:
- RBS/Abfahrtsfokus

Mögliche Blöcke:
- `transit_rbs`
- `last_update`

---

# 7. Device Profiles v1

## 7.1 reterminal_75_landscape

```text
width: 800
height: 480
aspect: landscape
font_scale: 1.0
max_cards: 4
icon_scale: 1.0
```

## 7.2 portrait_small (geplantes Ziel)

```text
width: 600
height: 800
aspect: portrait
font_scale: 0.9
max_cards: 5
icon_scale: 0.9
```

## 7.3 large_wall (später)

```text
width: 1440
height: 960
aspect: landscape
font_scale: 1.2
max_cards: 6
icon_scale: 1.2
```

---

# 8. Konfigurationsmodell

Diese Dinge sollten konfigurierbar statt hartcodiert sein:

## Seitenkonfiguration
- welche Blöcke
- Reihenfolge
- Slot-Regeln

## Geräteprofil
- Typografie
- Spacing
- Icongrössen
- Kartenanzahl

## Display-Regeln
- Highlight-Priorität
- Purple-Gating
- Fallback-Verhalten

---

# 9. Ordnerstruktur v2

Vorschlag:

```text
melflin-display/
  src/
    sources/
      calendar_family.py
      calendar_personal.py
      weather_netatmo.py
      weather_openmeteo.py
      transit_rbs.py
      notes.py
    domain/
      models.py
      normalize.py
    blocks/
      hero_date.py
      today_cards.py
      family_agenda.py
      weather_current.py
      weather_forecast.py
      transit_rbs.py
      melflin_note.py
      last_update.py
    pages/
      home.py
      family.py
      weather.py
      transit.py
    devices/
      reterminal_75_landscape.py
      portrait_small.py
    render/
      html_renderer.py
      theme_tokens.py
  config/
    pages/
      home.yaml
      family.yaml
      weather.yaml
      transit.yaml
    devices/
      reterminal_75_landscape.yaml
      portrait_small.yaml
  docs/
  data/
  cache/
  scripts/
  site/
```

---

# 10. Publish-Modell v2

Statt nur:
- `index.html`
- `family.html`

soll v2 mehrere Zielartefakte unterstützen.

## Beispielpfade

```text
/melflin-display/reterminal-75/home.html
/melflin-display/reterminal-75/family.html
/melflin-display/reterminal-75/weather.html
/melflin-display/reterminal-75/transit.html

/melflin-display/portrait-small/home.html
/melflin-display/portrait-small/family.html
```

Damit wird klar:
- welches Gerät
- welche Seite
- welche Variante

---

# 11. Migrationsstrategie

Nicht Big Bang.

## Phase 1
- Domain-Modell definieren
- Block-Katalog definieren
- Device-Profil-Modell definieren

## Phase 2
- aktuelle Home-Seite als erste v2-Seite migrieren
- alte Funktionalität beibehalten
- Vergleich alt vs. neu möglich machen

## Phase 3
- Family-Seite migrieren
- Wetter-/Transit-Seiten ergänzen

## Phase 4
- zweites Device-Profil einführen
- neues Zielrendering testen

## Phase 5
- alte direkte Speziallogik abbauen

---

# 12. Nicht-Ziele von v2

V2 soll nicht sofort:
- unendlich viele Geräte lösen
- jede Layoutvariante dynamisch machen
- ein voll generisches UI-Framework werden
- alles per YAML ohne Python-Logik lösen

V2 soll zuerst nur genug Struktur schaffen, damit Erweiterung sauber möglich wird.

---

# 13. Erfolgsdefinition

Display Platform v2 ist erfolgreich, wenn:

- neue Datenquellen leichter integrierbar sind
- neue Seiten ohne Logikduplikation entstehen
- neue Displaygrössen mit Profilen statt Copy/Paste unterstützt werden
- Renderer weniger Business-Logik enthalten
- Publish mehrere Artefakte klar ausgeben kann
- das System trotz Wachstum ruhig und wartbar bleibt

---

# 14. Kurzfassung

Display Platform v2 bedeutet:

- Daten normalisieren
- Blöcke bauen
- Seiten komponieren
- Geräteprofile definieren
- Renderer getrennt halten
- mehrere Zielartefakte publizieren

Nicht mehr eine einzelne Seite optimieren.
Sondern eine kleine, saubere Display-Plattform bauen.

Das ist der richtige nächste Schritt für das Projekt.
