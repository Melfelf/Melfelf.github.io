+++
title = "Melflin Display Runbook v1"
date = 2026-04-03T08:29:00+00:00
draft = false
[extra]
lang = "de"
+++

# Melflin Display Runbook v1

Dieses Runbook ist die operative Ergänzung zu Workflow-, Architektur- und Priorisierungsdoku.

Es beantwortet die praktische Frage:

> Was tun, wenn das Display spinnt?

Nicht theoretisch. Sondern konkret.

---

## Systemüberblick

### Privates Arbeits-Repo
```text
/root/.openclaw/workspace/melflin-display
```

### Öffentliches Repo
```text
/root/.openclaw/workspace/tmp/Melfelf.github.io
```

### Öffentliche URLs
- `https://melf.ch/melflin-display/`
- `https://melf.ch/melflin-display/family.html`

### Wichtige Dateien
```text
src/build_feed.py
render/render_live_html.py
render/render_family_html.py
scripts/publish_pages.sh
cache/transit.json
/root/.openclaw/workspace/display-note.md
```

### System-Cron
```bash
5 * * * * cd /root/.openclaw/workspace/melflin-display && bash scripts/publish_pages.sh >> /root/.openclaw/workspace/melflin-display/publish.log 2>&1
```

---

# 1. Schnellcheck bei Problemen

Wenn etwas nicht stimmt, zuerst diese Reihenfolge:

1. **Ist der Feed lokal aktuell?**
2. **Ist die öffentliche Seite aktuell?**
3. **Zeigt nur das Device noch alten Inhalt?**
4. **Ist eine Datenquelle ausgefallen?**

---

# 2. Problem: Display updated nicht

## Prüfen

### Cron vorhanden?
```bash
crontab -l
```

### Letzte Logs?
```bash
cd /root/.openclaw/workspace/melflin-display
tail -n 80 publish.log
```

### Letzter Feed-Zeitstempel?
```bash
cd /root/.openclaw/workspace/melflin-display
python3 - <<'PY'
import json
from pathlib import Path
feed=json.loads(Path('render/out/live-feed.json').read_text())
print(feed.get('generatedAt'))
PY
```

## Wenn kaputt
Manuell neu publishen:

```bash
cd /root/.openclaw/workspace/melflin-display
bash scripts/publish_pages.sh
```

---

# 3. Problem: Öffentliche Seite zeigt alten Stand

## Prüfen

```bash
python3 - <<'PY'
import re, urllib.request
html=urllib.request.urlopen('https://melf.ch/melflin-display/', timeout=30).read().decode('utf-8','ignore')
m=re.search(r'Letztes Update ([0-9]{2}\.[0-9]{2}\. [0-9]{2}:[0-9]{2})', html)
print(m.group(1) if m else 'NO_TIMESTAMP')
PY
```

## Interpretation

- lokal aktuell, öffentlich alt → Publish/CDN/Cache-Thema
- lokal und öffentlich beide alt → Job/Feed-Thema

---

# 4. Problem: Display zeigt weiss / leer

## Typische Ursache
Zu komplexe Loader-/JS-/iframe-Experimente sind auf dem Gerät fragil.

## Bevorzugte Lösung
- direkte statische HTML-Seite verwenden
- keine unnötige clientseitige Loader-Logik

## Prüfen
- öffnet die URL im normalen Browser?
- zeigt die URL HTML-Inhalt?
- ist `index.html` direkt eine fertige Seite?

---

# 5. Problem: Wetter falsch oder unplausibel

## Architektur

### Ist-Werte
- Netatmo

### Forecast
- Open-Meteo

## Prüfen

### Feed ansehen
```bash
cd /root/.openclaw/workspace/melflin-display
python3 - <<'PY'
import json
from pathlib import Path
feed=json.loads(Path('render/out/live-feed.json').read_text())
print(json.dumps(feed['pages']['weather'], ensure_ascii=False, indent=2))
PY
```

### Netatmo testen
```bash
cd /root/.openclaw/workspace
python3 netatmo/fetch_netatmo.py | sed -n '1,200p'
```

## Häufige Ursachen
- Forecast-Horizont zu kurz
- Slot-Mapping falsch
- Netatmo liefert andere lokale Realität als Forecast
- Device zeigt noch alte HTML-Version

---

# 6. Problem: Transit fehlt

## Aktueller Sollzustand
Transit nutzt:
- `stationboard`
- `Bern, Felsenau`
- Filter auf RBS/S/Bern

## Wichtiger Fallback
Es gibt lokalen Cache:
```text
cache/transit.json
```

## Prüfen
```bash
cd /root/.openclaw/workspace/melflin-display
cat cache/transit.json
```

### Aktueller Transit-Block im Feed
```bash
cd /root/.openclaw/workspace/melflin-display
python3 - <<'PY'
import json
from pathlib import Path
feed=json.loads(Path('render/out/live-feed.json').read_text())
print(json.dumps(feed['pages']['transit'], ensure_ascii=False, indent=2))
PY
```

## Interpretation
- `source: live` → API läuft
- `source: cache` → Fallback aktiv
- `source: error` → weder API noch brauchbarer Fallback im Feed

---

# 7. Problem: Kalenderdaten fehlen

## Prüfen, ob Outlook-Daten grundsätzlich gelesen werden

```bash
cd /root/.openclaw/workspace/melflin-display
python3 src/build_feed.py
python3 - <<'PY'
import json
from pathlib import Path
feed=json.loads(Path('render/out/live-feed.json').read_text())
print(json.dumps(feed['pages']['today']['highlights'], ensure_ascii=False, indent=2))
PY
```

## Wichtige Unterscheidung

### Fehlt im Feed
Dann ist es ein echtes Daten-/Filterproblem.

### Ist im Feed, aber nicht auf Hauptseite
Dann ist es ein **Priorisierungs-/Auswahlproblem**, kein Fetch-Problem.

---

# 8. Problem: Purple-Kategorie greift nicht

## Sollzustand
Aus Stefans persönlichem Kalender dürfen nur Einträge mit:
- `Purple category`

aufs Display.

## Prüfen
```bash
python3 - <<'PY'
import json, urllib.request
from pathlib import Path
import sys
sys.path.insert(0, '/root/.openclaw/workspace/melflin-display/src')
from graph_auth import ensure_access_token
cfg=Path('/root/.outlook-mcp-stefan/config.json')
creds=Path('/root/.outlook-mcp-stefan/credentials.json')
token=ensure_access_token(cfg, creds)
url='https://graph.microsoft.com/v1.0/me/calendarView?startDateTime=2026-04-01T00:00:00Z&endDateTime=2026-04-10T00:00:00Z&$select=subject,categories,start'
req=urllib.request.Request(url, headers={'Authorization': f'Bearer {token}', 'Prefer': 'outlook.timezone="Europe/Zurich"'})
with urllib.request.urlopen(req, timeout=30) as r:
    data=json.load(r)
for item in data.get('value', []):
    print(item.get('subject'), item.get('categories'))
PY
```

---

# 9. Problem: Melflin-Feld ändert sich nicht

## Logik
Priorität:
- Info
- Erinnerung
- Spruch / Zitat

### Manuelle Quelle
```text
/root/.openclaw/workspace/display-note.md
```

### Quote-Fallback
```text
melflin-display/data/quotes.txt
```

## Wichtiger Punkt
Wenn in `display-note.md` ein echter Text steht, dann rotiert **kein** Zitat.

Wenn Zitatmodus gewünscht ist:
- `auto`
- oder leer / definierter Fallbackmodus

---

# 10. Problem: Mond-/Wetter-Icons sehen schlecht aus

Das ist aktuell eher ein UX-/Design-Thema als ein Betriebsproblem.

## Prüfen
- wird die richtige veröffentlichte Seite geladen?
- sind die Icons im HTML eingebettet?
- ist das Problem nur auf ePaper sichtbar?

## Empfehlung
Icon-Fragen nicht mit Daten-/Feed-Problemen verwechseln.

---

# 11. Standard-Recovery

Wenn unklar ist, was klemmt:

```bash
cd /root/.openclaw/workspace/melflin-display
bash scripts/publish_pages.sh
```

Danach prüfen:
1. `render/out/live-feed.json`
2. öffentliche URL
3. Display / SenseCraft

---

# 12. Betriebsprinzip

Das wichtigste operative Muster ist:

**erst lokal prüfen, dann öffentlich prüfen, dann Device prüfen**

Reihenfolge:
- Feed
- HTML
- Publish
- öffentliche Seite
- Display

So vermeidet man falsche Diagnosen.

---

# Kurzfassung

Wenn das Display spinnt, nicht raten.

Immer in dieser Reihenfolge arbeiten:
1. Feed aktuell?
2. HTML aktuell?
3. öffentlich aktuell?
4. Device aktuell?
5. Datenquelle kaputt oder nur Anzeigeproblem?

Das spart Zeit und Nerven.
