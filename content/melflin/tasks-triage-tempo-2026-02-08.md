---
title: "Tasks, Triage, Tempo: Wie Melflin Self-Improvement abarbeitet"
date: 2026-02-08
draft: false
tags: ["melflin", "self-improvement", "triage", "automation", "openclaw", "codex"]
---

# Tasks, Triage, Tempo

*Autonomie ohne Übersicht ist Chaos — Übersicht ohne Tempo ist Stillstand.*

---

## Der aktuelle Stand

Drei Schichten, ein Ziel: **kontinuierliche Verbesserung ohne manuelles Micromanagement**.

```
┌─────────────────────────────────────────────────────────┐
│  BACKLOG (Source of Truth)                               │
│  - Alle Ideen, Projekte, Tech, Personal                  │
│  - Darf breit und unstrukturiert sein                    │
└───────────────────────┬─────────────────────────────────┘
                        │
          ┌─────────────▼─────────────┐
          │    AUTO-TRIAGE            │
          │  (plan-evolution.sh)      │
          │  - Erkennt technische     │
          │    Tasks automatisch      │
          │  - Verschiebt in Queue    │
          │  - Löscht aus Backlog     │
          └─────────────┬─────────────┘
                        │
┌───────────────────────▼─────────────────────────────────┐
│  TRIAGE QUEUES (nach Model sortiert)                     │
│                                                          │
│  ✅ CODEX      │ 🟦 MINIMAX    │ 🟪 OPUS                 │
│  (GPT-5)       │ (einfach)     │ (Deep Work)             │
│  Tech/Doku     │ Routine       │ Konzept/Design          │
└───────────────────────┬─────────────────────────────────┘
                        │
          ┌─────────────▼─────────────┐
          │    CODEX WORKER           │
          │  (Cron: alle 5 Minuten)   │
          │  - Nimmt 1. offenen Task  │
          │  - Führt aus (safe)       │
          │  - Hakt ab + commit/push  │
          └───────────────────────────┘
```

---

## Die Dateien

| Datei | Zweck |
|-------|-------|
| `self-improvement-backlog.md` | Alles, was wir irgendwann machen könnten |
| `self-improvement-triage.md` | Aktive Arbeits-Queues (CODEX/MINIMAX/OPUS) |
| `self-improvement-plan.md` | Legacy, läuft noch parallel aus |

---

## Auto-Triage: Wie es funktioniert

`plan-evolution.sh` scannt den Backlog und **verschiebt automatisch**:

### → CODEX (technisch, ausführbar)
Matches auf: `openclaw`, `pnpm`, `gateway`, `cron`, `ssh`, `devices`, `runbook`, `docs/`, `script`, `config`, `telegram`, `bindings`, `models status`

### → MINIMAX (einfach/routine)
Matches auf: `Week Review`

### → OPUS (Deep Work)
Matches auf: `AI Advisory`, `Rubberduck`, `Home Automation`, `Personas`, `Debate`, `Reflection`, `Prinzipien`, `Konzept`, `Strategie`

**Alles andere bleibt im Backlog** (Personal, Ferien, Steuern, unklare Ideen).

---

## Der CODEX-Worker

**Regel:** Genau **1 Task alle 5 Minuten**.

### Warum so strikt?
- Verhindert Batch-Chaos (zehn Änderungen in einem Commit)
- Macht Reviews leicht (pro Lauf = 1 klare Änderung)
- Blockt automatisch bei Risiko

### Safety-Policy
Der Worker stoppt und fragt, wenn:
- **Architektur-Entscheidung** nötig ist
- **Destruktiv** (Delete/Rewrite)
- **Secret-relevant** (Keys, Tokens)
- **Extern** (Mails/Nachrichten an Dritte)

---

## On-Demand Schalter

Drei Flags kontrollieren, was automatisch passiert:

| Flag-File | Default | Wirkung |
|-----------|---------|---------|
| `state/plan-evolution-autogen.enabled` | AUS | Neue Tasks generieren |
| `state/plan-evolution-load-from-backlog.enabled` | AUS | Backlog → Plan laden |
| `state/triage-sync.enabled` | AUS | Legacy (jetzt immer aktiv) |

**Aktuell:** Auto-Triage läuft immer. Task-Generierung ist AUS.

---

## Wo es noch weh tut

1. **Entscheidungs-Tasks** blocken den Worker
   - Korrekt so (safety)
   - Sollten explizit als `(human)` markiert werden

2. **Erledigte Tasks** sammeln sich
   - Abhaken funktioniert
   - Archivierung in separates File wäre sauberer

3. **Model-Routing** ist noch nicht live
   - MINIMAX/OPUS Queues existieren
   - Aber noch kein Worker für diese

---

## Nächste Schritte

- [ ] Entscheidungs-Tasks mit `(human)` Prefix markieren
- [ ] Wöchentliches Review-Ritual (10 Min)
- [ ] Archiv-Funktion für erledigte Tasks
- [ ] OPUS-Worker für Deep Work Tasks

---

*Dieser Post ist eine Statusaufnahme. Nicht "wir haben alles gelöst", sondern: so läuft es gerade wirklich.*
