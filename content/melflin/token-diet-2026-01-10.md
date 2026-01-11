+++
title = "Token-Diät: Wie ich meinen AI-Assistenten schlank gemacht habe"
date = 2026-01-10T20:37:00+01:00
updated = 2026-01-10T20:37:00+01:00
tags = ["Melflin", "Token Savings", "AI Assistant", "Clawdbot"]
+++

Heute stand eine ungewöhnliche Aufgabe an: meinen AI-Assistenten auf Token-Diät setzen. Warum? Weil jeder Request unnötig viel Kontext mitschleppte und die Rate Limits nervten.

## Das Problem

Clawdbot lädt automatisch alle Markdown-Dateien aus dem Workspace. Praktisch – aber auch verschwenderisch. Mein Workspace hatte sich mit der Zeit vollgemüllt:

- **2653 Wörter** in verschiedenen `.md` Dateien
- Davon wurden **bei jedem Request** alle geladen
- Abo-Tracking, Setup-Dokumentation, Blog-Guidelines – alles dabei
- Auch wenn ich nur "Wie ist das Wetter?" fragte

Das ist wie wenn du bei jedem Telefonat erstmal deine komplette Lebensgeschichte erzählst.

## Die Lösung: Radikales Ausmisten

**Phase 1: Workspace-Dateien komprimieren**
- `AGENTS.md`: 1084 → 108 Bytes (-90%)
- `SOUL.md`: 234 → 48 Bytes (-80%)
- `TOOLS.md`: 494 → 45 Bytes (-91%)

**Phase 2: Skills entrümpeln**
8 ungenutzte Skills gelöscht:
- Discord, Slack, WhatsApp (nutze ich nicht)
- Trello, Things, Bear (redundant zu meinen Tools)
- Food-Order, OrderCLI (nie gebraucht)

**Phase 3: Dateien verschieben statt laden**
Erstellt `data/` Ordner für:
- `abo-tracking.md` → nur bei Abo-Themen laden
- `README.md` → nur bei Setup-Fragen
- `HEARTBEAT.md` → nur bei Heartbeat-Runs

**Ergebnis:**
- Von **2653 → 489 Wörter** im Projekt-Context
- **-82% Token-Verbrauch** pro Request
- System-Prompt deutlich schlanker

## Was ich gelernt habe

1. **Weniger ist mehr** – Nicht alles muss immer geladen sein
2. **Lazy Loading** – Daten nur holen wenn gebraucht
3. **Regelmäßig aufräumen** – Workspace-Hygiene ist wichtig

Der Assistant funktioniert jetzt genauso gut, verbraucht aber nur einen Bruchteil der Tokens. Perfekt.

### Technische Details

- Workspace: lokaler Arbeitsbereich
- Essential Dateien (immer geladen): IDENTITY, USER, SOUL, TOOLS, AGENTS
- On-Demand Dateien: `data/*` und `archive/*`
- Tool: Clawdbot (lokaler AI-Agent auf Basis von Claude)

Manchmal braucht's halt eine Token-Diät. Und die hat funktioniert.
