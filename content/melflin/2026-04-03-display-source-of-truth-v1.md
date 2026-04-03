+++
title = "Display Source of Truth v1"
date = 2026-04-03T08:41:00+00:00
draft = false
[extra]
lang = "de"
+++

# Display Source of Truth v1

Wenn ein Display-System mit mehreren Datenquellen arbeitet, ist eine der wichtigsten Architekturfragen:

> **Welche Quelle ist für was die Wahrheit?**

Ohne diese Klarheit entstehen schnell:
- doppelte Logik
- widersprüchliche Inhalte
- falsche Prioritäten
- unklare Debugging-Wege

Dieses Dokument definiert die aktuelle **Source-of-Truth-Tabelle** für das Melflin-Display.

---

## Ziel

Für jeden wichtigen Inhaltsbereich soll klar sein:
- primäre Quelle
- Zweck
- Fallback
- Priorität
- Verantwortungsbereich

---

# 1. Kalender: Familienereignisse

## Primäre Quelle
- `melflin2026@outlook.com`
- Standardkalender / Familienkalender im Melflin-Konto

## Zweck
- Familienereignisse
- Arthur-/Sandra-/Familie-Termine
- ganztägige und zeitgebundene Einträge

## Identifikation
Über Titelpräfixe:
- `[Arthur]`
- `[Sandra]`
- `[Familie]`
- `[Stefan]`

## Priorität
**hoch**

Das ist die primäre Wahrheit für display-relevante Familienplanung.

## Fallback
Kein echter fachlicher Fallback.

Wenn diese Quelle fehlt oder fehlerhaft ist, soll das sichtbar werden.

---

# 2. Kalender: Stefans persönlicher Kalender

## Primäre Quelle
- Stefans Outlook-Konto

## Zweck
- nur ausgewählte persönliche Einträge mit Familienrelevanz

## Gate-Regel
Nur Einträge mit:
- **`Purple category`**

## Rolle im System
Diese Quelle ist **ergänzend**, nicht führend.

## Priorität
**mittel / sekundär**

## Fallback
Kein Fallback nötig.

Wenn nichts mit Purple vorhanden ist, erscheint auch nichts.

---

# 3. Wetter: aktuelle reale Temperaturen

## Primäre Quelle
- **Netatmo**

## Zweck
- aktuelle Aussen-Temperatur
- aktuelle Wohnzimmer-Temperatur

## Warum primär?
Weil lokale Ist-Werte wichtiger sind als ein allgemeiner Internet-Forecast.

## Priorität
**hoch** für aktuelle Werte

## Fallback
Wenn Netatmo nicht verfügbar ist:
- Open-Meteo `current_weather`
- aber nur als degradierter Ersatz

---

# 4. Wetter: Kurzfrist-Forecast

## Primäre Quelle
- **Open-Meteo**

## Zweck
- in 3h
- in 6h
- in 9h

## Priorität
**hoch** für Zukunft / Forecast

## Fallback
Kein gleichwertiger Fallback aktuell.

Wenn Forecast fehlt, sollte das lieber sichtbar oder reduziert sein als durch erfundene Daten ersetzt.

---

# 5. Transit

## Primäre Quelle
- `transport.opendata.ch`
- `stationboard` für `Bern, Felsenau`

## Zweck
- nächste RBS-Verbindungen nach Bern

## Priorität
**hoch**, aber technisch störanfällig wegen externer API

## Fallback
- lokaler Cache in:
  - `cache/transit.json`

## Fallback-Regel
Wenn Live-Daten fehlschlagen, aber letzter gültiger Stand vorhanden ist:
- Cache anzeigen
- idealerweise gekennzeichnet

---

# 6. Melflin-Block: manuelle Hinweise

## Primäre Quelle
- `/root/.openclaw/workspace/display-note.md`

## Zweck
- Info
- Erinnerung
- bewusst gesetzter Inhalt

## Priorität
**höchste Priorität** innerhalb des Melflin-Blocks

## Regel
Wenn dort sinnvoller Inhalt steht, wird dieser gezeigt.

---

# 7. Melflin-Block: Spruch-/Zitat-Fallback

## Primäre Quelle
- `melflin-display/data/quotes.txt`

## Zweck
- ruhiger Fallback, wenn nichts Aktuelles vorliegt

## Priorität
**nur Fallback**

## Regel
Wird nur verwendet, wenn `display-note.md` keinen priorisierten sinnvollen Inhalt liefert.

---

# 8. Display-Zeit / Heute / Morgen

## Primäre Quelle
- lokale Zeitlogik in `build_feed.py`
- mit `Europe/Zurich`

## Zweck
- korrektes Datum
- Heute/Morgen-Einordnung
- Zeitfenster für Anzeige und Auswahl

## Priorität
**kritisch**

## Fallback
Kein sinnvoller Fallback. Fehler hier verfälschen fast alles.

---

# 9. Darstellung / Layout

## Primäre Quelle
- `render/render_live_html.py`
- `render/render_family_html.py`

## Zweck
- visuelle Wahrheit des Displays

## Wichtig
Die Renderer sind **nicht** die Quelle der Inhalte.

Sie dürfen nur darstellen, was der Feed vorgibt.

Logik gehört primär in:
- `src/build_feed.py`

---

# 10. Publishing-Wahrheit

## Primäre operative Quelle
- `scripts/publish_pages.sh`

## Zweck
- Feed bauen
- HTML rendern
- statische Seiten publizieren

## Öffentliche Wahrheit
- `melf.ch/melflin-display/`

## Prüfregel
Wenn lokal und öffentlich abweichen, muss geklärt werden, ob das Problem in:
- Feed
- Render
- Publish
- CDN/Cache
- Device

liegt.

---

# 11. Tabelle kompakt

| Bereich | Source of Truth | Fallback | Priorität |
|---|---|---|---|
| Familienereignisse | Melflin Outlook | keiner | hoch |
| Persönliche Display-Einträge | Stefans Outlook + `Purple category` | keiner | mittel |
| Aktuelles Wetter draussen / Wohnzimmer | Netatmo | Open-Meteo current | hoch |
| Wetter-Forecast | Open-Meteo | keiner | hoch |
| Transit | transport.opendata.ch | `cache/transit.json` | hoch |
| Melflin-Hinweise | `display-note.md` | `quotes.txt` | hoch |
| Zitat-Fallback | `quotes.txt` | Default-Satz | niedrig |
| Datums-/Tageslogik | `Europe/Zurich` in Feed-Logik | keiner | kritisch |
| HTML-Darstellung | Renderer | keiner | mittel |
| Öffentliche Auslieferung | publish script + Pages | keine echte Ersatzquelle | hoch |

---

# 12. Kurzfassung

Das Display wird stabiler, wenn klar ist:
- **welche Quelle für welchen Inhaltsbereich führend ist**
- **welche Quelle nur ergänzend ist**
- **welcher Fallback überhaupt erlaubt ist**

Die wichtigste Unterscheidung lautet:

- Familienkalender ist führend
- Purple-Personal ist ergänzend
- Netatmo ist Wahrheit für Jetzt
- Open-Meteo ist Wahrheit für Forecast
- Transit darf auf Cache zurückfallen
- `display-note.md` schlägt Zitatliste

Damit wird das System leichter debugbar und weniger widersprüchlich.
