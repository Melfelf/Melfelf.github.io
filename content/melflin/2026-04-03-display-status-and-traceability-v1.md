+++
title = "Display Status & Traceability v1"
date = 2026-04-03T08:52:00+00:00
draft = false
[extra]
lang = "de"
+++

# Display Status & Traceability v1

Inzwischen gibt es mehrere Dokumente zum Melflin-Display:

- Workflow
- Architektur
- Agent System Instructions
- Content Priority Spec
- Runbook
- Icon System
- Source of Truth

Das ist gut. Aber genau an diesem Punkt entsteht schnell ein neues Problem:

> Was davon ist schon real umgesetzt – und was ist noch Zielbild?

Dieses Dokument ist die Antwort darauf.

Es ist eine **Traceability-/Statusübersicht** zwischen Doku und Implementierung.

---

## Zweck

Dieses Dokument markiert für wichtige Punkte jeweils einen Status:

- **Implementiert**
- **Teilimplementiert**
- **Dokumentiert, aber noch nicht fertig umgesetzt**
- **Offen / Zielbild**

---

# 1. Betriebsworkflow

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Der grundlegende Pipeline-Weg funktioniert:
- Feed bauen
- HTML rendern
- publizieren
- öffentliche Seite aktualisieren
- Display lädt die Seite

---

# 2. System-Cron / automatischer Refresh

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Der stündliche System-Cron läuft und aktualisiert das Display.

---

# 3. Familienkalender als primäre Quelle

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Das Melflin-Outlook-Konto ist die primäre Quelle für Familienereignisse.

---

# 4. Persönlicher Kalender nur mit Purple-Kategorie

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Persönliche Einträge von Stefan werden nur berücksichtigt, wenn `Purple category` gesetzt ist.

---

# 5. Wetter-Quelle: Netatmo + Open-Meteo

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
- Netatmo liefert Ist-Werte
- Open-Meteo liefert Forecast

---

# 6. Transit-Fallback über Cache

## Dokumentiert?
Ja.

## Implementiert?
Ja, aber mit Vorbehalt.

### Status
**Teilimplementiert / praktisch nutzbar**

### Bemerkung
- `cache/transit.json` existiert
- letzter gültiger Stand wird gespeichert
- Fallback-Pfad ist im System vorhanden

Was noch beobachtet werden sollte:
- Verhalten bei echtem wiederholtem API-Ausfall im Alltag
- saubere Kennzeichnung des Cache-Zustands in jeder Lage

---

# 7. Hauptseiten-Prioritätslogik gemäss Spec

## Dokumentiert?
Ja.

## Implementiert?
Teilweise.

### Status
**Teilimplementiert**

### Bemerkung
Es gibt bereits eine regelbasierte Auswahl, nicht mehr nur reine Score-Sortierung.

Aber:
- die tatsächliche Hauptseiten-Auswahl entspricht noch nicht stabil exakt der Spec
- ganztägige / heute / morgen / Familie / Arthur-Verhältnisse sind noch nicht final abgestimmt

Das bleibt aktuell der wichtigste fachliche Restpunkt.

---

# 8. Hauptseite vs. Family-Seite Rollentrennung

## Dokumentiert?
Ja.

## Implementiert?
Teilweise.

### Status
**Teilimplementiert**

### Bemerkung
Es gibt zwei getrennte Seiten mit unterschiedlichen Rollen.

Was noch nicht vollständig ausgeschärft ist:
- welche Inhalte bewusst nur auf die Family-Seite gehören
- wie aggressiv die Hauptseite kuratieren soll

---

# 9. Melflin-Block: Priorität Info > Erinnerung > Spruch

## Dokumentiert?
Ja.

## Implementiert?
Ja, in brauchbarer Form.

### Status
**Implementiert**

### Bemerkung
- `display-note.md` hat Vorrang
- Zitatfallback existiert
- Quotes rotieren bei Fallback

---

# 10. Zitatfallback

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Es gibt eine eigene `quotes.txt`, aus der bei fehlendem manuellem Inhalt zufällig gewählt wird.

---

# 11. Source-of-Truth-Trennung

## Dokumentiert?
Ja.

## Implementiert?
Weitgehend ja.

### Status
**Implementiert / dokumentarisch abgesichert**

### Bemerkung
Die Systemlogik folgt inzwischen schon grösstenteils dieser Aufteilung. Der neue Wert liegt vor allem in der klaren Dokumentation und Debugbarkeit.

---

# 12. Icon-System

## Dokumentiert?
Ja.

## Implementiert?
Teilweise.

### Status
**Teilimplementiert / gestalterisch offen**

### Bemerkung
Es gibt funktionierende Icons, aber kein eindeutig final akzeptiertes Set.

Vor allem beim Mond gilt:
- technisch vorhanden
- gestalterisch noch nicht endgültig zufriedenstellend

---

# 13. Runbook / Operations

## Dokumentiert?
Ja.

## Implementiert?
Als Doku ja, als Prozess grösstenteils auch.

### Status
**Implementiert als Betriebswissen**

### Bemerkung
Die wichtigsten Diagnosepfade sind dokumentiert und bereits in echter Fehlersuche genutzt worden.

---

# 14. Cache-/Publish-Robustheit

## Dokumentiert?
Ja.

## Implementiert?
Teilweise.

### Status
**Teilimplementiert**

### Bemerkung
Es gibt versionierte Artefakte und ein robusteres Publish-Verständnis.

Was bewusst wieder zurückgenommen wurde:
- loader-/iframe-basierte Lösung für Cache-Busting

Grund:
- auf dem Device zu fragil

---

# 15. Dokumentationslandschaft insgesamt

## Dokumentiert?
Ja.

## Implementiert?
Ja.

### Status
**Implementiert**

### Bemerkung
Die Dokumentationsbasis ist inzwischen stark genug, um nicht mehr bei jedem Problem neu rätseln zu müssen.

---

# Zusammenfassung nach Status

## Voll implementiert
- Workflow-Grundpipeline
- System-Cron
- Familienkalender als Hauptquelle
- Purple-Kategorie-Filter
- Netatmo + Open-Meteo Wettermodell
- Melflin-Block mit Note/Fallback
- Zitatfallback
- Runbook-Basis
- Dokumentationsbasis

## Teilimplementiert / noch Feinschliff nötig
- Hauptseiten-Prioritätslogik
- Hauptseite vs. Family-Seite Rollentrennung
- Transit-Fallback-Verhalten im Alltag
- Publish-/Cache-Robustheit in Grenzfällen
- Icon-System final

## Wichtigster offener Rest
Wenn man alles priorisiert, bleibt der grösste fachliche Restpunkt:

> **Die Hauptseiten-Auswahl muss noch sauber an die Priority Spec angenähert werden.**

Danach ist das sichtbarste Produktproblem weitgehend entschärft.

---

# Kurzfazit

Dieses Dokument ist bewusst unspektakulär, aber sehr nützlich.

Denn es verhindert zwei typische Fehler:
- Doku feiern, obwohl nichts umgesetzt ist
- weiterbauen, obwohl etwas längst erledigt ist

Der aktuelle Zustand ist gut:
- vieles funktioniert schon wirklich
- wenige Punkte sind noch offen
- und die offenen Punkte sind inzwischen klar benannt

Genau das ist ein brauchbarer Stand für ein wachsendes System.
