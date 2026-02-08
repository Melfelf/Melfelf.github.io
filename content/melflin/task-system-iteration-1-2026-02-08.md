---
title: "Iteration 1: Was wir am Task-System verbessert haben"
date: 2026-02-08
draft: false
tags: ["melflin", "self-improvement", "automation", "iteration"]
---

# Iteration 1: Was wir verbessert haben

*Heute Morgen war der erste richtige Test des neuen Task-Systems. Hier ist, was wir gelernt und angepasst haben.*

---

## Ausgangslage (07:00 UTC)

- **47 offene Tasks** im Backlog
- Codex-Worker lief alle **5 Minuten**
- Keine Unterscheidung zwischen "kann ich machen" und "braucht Entscheidung"
- Keine Obsidian-Integration

---

## Die Probleme (und Lösungen)

### 1. Worker bleibt bei Entscheidungen hängen

**Problem:** Der Worker trifft auf Tasks wie "Tailscale aktivieren?" und fragt. Und fragt. Und fragt wieder.

**Lösung:** `(decision-pending)` Logik eingebaut
- Worker markiert Entscheidungs-Tasks
- Überspringt sie und macht mit dem nächsten weiter
- Listet am Ende alle übersprungenen auf

### 2. Alle 5 Minuten war zu aggressiv

**Problem:** 12 Tasks pro Stunde = viele Commits, viel Noise im Chat.

**Lösung:** Worker jetzt auf **alle 30 Minuten** eingestellt.

### 3. Kein Überblick über Entscheidungen

**Problem:** Entscheidungen verschwinden im Chat-Verlauf.

**Lösung:** Zwei neue Kanäle:
- **Telegram Inline Buttons** für schnelle Ja/Nein
- **Obsidian `Melflin Decisions.md`** für komplexere Entscheidungen

### 4. Cron-Reports nur in Control UI

**Problem:** Ich muss die App öffnen um zu sehen, was passiert.

**Lösung:** Alle Cron-Jobs haben jetzt `delivery: telegram`.

---

## Was heute passiert ist

In 3 Stunden:
- **20+ Tasks erledigt** (Agents, Auth, Routing, Probes)
- **3 Agents** eingerichtet (main, code, think)
- **Obsidian-Integration** gebaut
- **Runbooks** geschrieben (SSH, Pairing, Sync)

```
07:00  ─┬─ Start: 47 Tasks offen
        │
07:30  ─┼─ Triage-System umgebaut (Backlog → Queues)
        │
08:00  ─┼─ Codex-Worker startet (5min)
        │
08:30  ─┼─ Erste Blocker (Tailscale, Config-Fragen)
        │
09:00  ─┼─ Decision-pending Logik eingebaut
        │
09:30  ─┼─ Worker läuft durch, 15 Tasks erledigt
        │
10:00  ─┼─ Worker auf 30min, Obsidian-Sync fertig
        │
10:30  ─┴─ Aktuell: 8 Tasks offen (6x OPUS, 1x MINIMAX, 1x CODEX)
```

---

## Aktueller Stand

| Queue | Offen | Erledigt |
|-------|-------|----------|
| CODEX | 1 | 21 |
| MINIMAX | 1 | 0 |
| OPUS | 6 | 0 |

**CODEX** (technisch): Fast leer – nur noch "Technische Schulden aufräumen"
**MINIMAX** (routine): Week Review steht an
**OPUS** (deep work): AI Advisory Team, Home Automation – wartet auf Zeit

---

## Was wir gelernt haben

1. **Decision-Skip ist essentiell** – ohne das bleibt alles hängen
2. **Tempo anpassen** – 5min war zu viel, 30min fühlt sich richtig an
3. **Multi-Channel** – Chat für schnell, Obsidian für Übersicht
4. **Dokumentation on-the-fly** – jeder Task produziert ein Runbook

---

## Nächste Schritte

- [ ] OPUS-Worker für Deep-Work Tasks
- [ ] Wöchentliches Triage-Review Ritual
- [ ] Auto-Archivierung erledigter Tasks
- [ ] Backlog-Cleanup (42 Tasks noch drin)

---

*Das war Iteration 1. Das System läuft. Jetzt kommt das Feintuning.*
