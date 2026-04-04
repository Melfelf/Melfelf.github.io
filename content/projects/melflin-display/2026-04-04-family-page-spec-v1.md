+++
title = "Family Page Spec v1"
date = 2026-04-04T20:45:00+02:00
draft = false
[extra]
lang = "de"
+++

# Family Page Spec v1

Die Familienseite darf nicht einfach eine zweite Seite mit "mehr Kalender" sein. Wenn sie echten Nutzen bringen soll, muss sie eine andere Aufgabe erfüllen als die Hauptseite.

Die Hauptseite beantwortet:

> Was ist heute am wichtigsten?

Die Familienseite soll dagegen beantworten:

> Wie sieht der Familienkontext als Ganzes aus – heute, morgen und in den nächsten Tagen?

Dieses Dokument definiert dafür eine erste, V2-kompatible Spezifikation.

---

## Ziel

Die Familienseite soll:
- den Tageskontext verständlich machen
- Vorbereitung erleichtern
- Personenbezug klar machen
- nicht nur informieren, sondern koordinieren helfen

Sie ist damit bewusst:
- vollständiger als die Hauptseite
- weniger aggressiv kuratiert
- stärker auf Familienlogik als auf Einzel-Highlights ausgerichtet

---

# 1. Rolle der Familienseite

## 1.1 Nicht Konkurrenz zur Hauptseite

Die Familienseite ersetzt die Hauptseite nicht.

### Hauptseite
- kuratiert
- knapp
- stark priorisiert
- eher "Was jetzt wichtig ist"

### Familienseite
- kontextreicher
- strukturierter
- stärker vorbereitend
- eher "Was wir als Familie verstehen und im Blick behalten sollten"

## 1.2 Kein Vollkalender

Auch die Familienseite ist nicht einfach ein unendlicher Kalenderdump.

Sie bleibt eine gestaltete Ansicht.

---

# 2. Kernnutzen

Die Familienseite soll vor allem in vier Bereichen Nutzen stiften.

## 2.1 Tageskontext
Was gilt heute als Rahmen des Tages?

Beispiele:
- Schulfrei
- Ferienbeginn
- Prüfungstag
- Betreuungs-/Abholkontext
- Familienrelevanter Besuch / Termin

## 2.2 Morgen vorbereiten
Was ist morgen schon relevant genug, dass man es heute wissen sollte?

Beispiele:
- Ferienstart
- Packen
- Schule / Spezialtag
- Familienlogistik
- wichtige Purple-Termine mit Familienrelevanz

## 2.3 Personenbezug klären
Wen betrifft was?

Wichtige Gruppen:
- Arthur
- Sandra
- Familie
- Stefan

## 2.4 Offene Schlaufen sichtbar machen
Die Familienseite kann auch leichte Vorbereitungs- oder Organisationslogik tragen.

Nicht als Todo-App. Aber als kleiner Koordinationspuffer.

---

# 3. Inhaltliche Priorisierung

## 3.1 Reihenfolge der Relevanz

### A. Heute aktive Familienrealität
- heutige ganztägige Rahmenbedingungen
- heutige Familien-/Kindertermine
- heutige Uhrzeit-relevante Dinge

### B. Morgen vorbereitungsrelevante Dinge
- morgige Starts
- morgige Sondertage
- morgige Termine mit Vorbereitungsbedarf

### C. Kurzfristige Vorschau
- wichtige Dinge in den nächsten 2–5 Tagen

---

# 4. Blöcke für die Familienseite

Family Page Spec v1 empfiehlt folgende Kernblöcke.

## 4.1 `hero_date`

### Zweck
Klare zeitliche Verankerung der Seite.

### Inhalt
- Datum
- optional kleiner Subkontext wie Wochentag / Ferien / Wochenende

---

## 4.2 `today_family_context`

### Zweck
Zeigt die wichtigsten Dinge, die **heute** den Familienrahmen bilden.

### Inhalt
- ganztägige Family-/Arthur-/Sandra-Einträge
- heutige zentrale Familienrealität

### Beispiele
- `[Arthur] Schulfrei`
- `[Arthur] Start Frühlingsferien`
- `[Familie] Stefan für Arthur da`

### Wichtig
Ganztägige Einträge müssen hier prominent und nicht nur beiläufig erscheinen.

---

## 4.3 `today_schedule`

### Zweck
Zeigt zeitgebundene heutige Einträge in klarer zeitlicher Ordnung.

### Inhalt
- Uhrzeit-Termine heute
- mit Personenzuordnung

### Darstellung
- kompakt
- gut scanbar
- nicht zu viel Text pro Eintrag

---

## 4.4 `tomorrow_preview`

### Zweck
Zeigt Dinge von morgen, die heute schon relevant sind.

### Inhalt
- Ferienbeginn
- Prüfungen
- Schul-/Spezialtage
- Familienrelevante Purple-Einträge
- Pack-/Vorbereitungslogik

### Regel
Nicht alles von morgen. Nur das, was Vorbereitungswert hat.

---

## 4.5 `family_focus`

### Zweck
Verdichtet 1–3 relevante organisatorische Aussagen.

### Beispiele
- Arthur hat heute Schulfrei und morgen Ferienstart.
- Für morgen ist Vorbereitung sinnvoll.
- Heute kein dichter Zeitplan, aber Pack-/Ordnungslogik relevant.

### Charakter
Eher Koordination als Kalenderkopie.

---

## 4.6 `short_week_preview`

### Zweck
Sehr knappe Vorschau auf die nächsten Tage.

### Inhalt
- nur 3–5 wichtigste kommende Punkte
- keine Vollständigkeit

### Nutzen
Hilft, Tage nicht isoliert zu sehen.

---

## 4.7 `last_update`

### Zweck
Transparenz über Aktualität.

---

# 5. Was nicht auf die Familienseite gehört

## 5.1 Zu viele technische Statusdetails
Die Familienseite ist kein Debug-Panel.

## 5.2 Vollständige Langlisten
Wenn die Seite nur in Liste kippt, verliert sie ihren Nutzen.

## 5.3 Zu viel Wiederholung der Hauptseite
Die Familienseite darf Überschneidung haben, aber nicht nur eine aufgeblasene Kopie der Home-Seite sein.

---

# 6. Layout-Empfehlung v1

## Für das aktuelle 7.5" ePaper im Landscape-Format

### Empfohlene Struktur

#### Oben
- `hero_date`

#### Linke Spalte
- `today_family_context`
- `today_schedule`

#### Rechte Spalte
- `tomorrow_preview`
- `family_focus`
- `last_update`

### Optional
Wenn der Platz reicht:
- kleine `short_week_preview`

---

# 7. Selektionsregeln

## 7.1 Heute vor morgen
Heute aktive Familienrealität hat Vorrang.

## 7.2 Ganztägig darf prominent sein
Ganztägige Familien-/Kinderereignisse dürfen nicht versteckt werden.

## 7.3 Purple bleibt ergänzend
Purple-Einträge dürfen vorkommen, aber nur wenn sie Familienkontext wirklich stärken.

## 7.4 Personenzuordnung muss sofort lesbar sein
Jeder Eintrag soll schnell erkennbar machen, wen er betrifft.

---

# 8. Unterschied zur Priority Spec der Hauptseite

Die Hauptseite folgt stärker der Logik:
- Auswahl
- Begrenzung
- kuratierter Fokus

Die Familienseite folgt stärker der Logik:
- Kontext
- Gruppierung
- Vorbereitung
- Familienverständnis

Das ist ein absichtlicher Unterschied.

---

# 9. Erfolgskriterien

Family Page Spec v1 ist gut umgesetzt, wenn:

- heutige Familienrealität mit einem Blick verständlich wird
- morgige Vorbereitung sichtbar wird
- ganztägige Kinder-/Familieneinträge nicht verloren gehen
- Purple-Personal nicht dominiert
- die Seite nicht wie eine dumpfe Kalenderliste wirkt

---

# 10. Kurzfassung

Die Familienseite soll keine grössere Home-Seite sein.

Sie soll ein **Familien-Koordinationsboard** sein.

Darum ist v1:
- heute-orientiert
- morgen-vorbereitend
- personenbezogen
- ganztägig-freundlich
- kontextreicher als die Hauptseite

Damit bekommt sie eine klare eigene Rolle im Display-System.
