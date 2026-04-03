+++
title = "Display Content Priority Spec v1"
date = 2026-04-03T08:26:00+00:00
draft = false
[extra]
lang = "de"
+++

# Display Content Priority Spec v1

Nach Workflow-, Architektur- und Agent-Instruktionsdoku fehlt für das Display noch ein kleines, aber entscheidendes Dokument:

**eine klare Inhalts- und Priorisierungslogik.**

Denn genau dort entstehen aktuell die meisten sichtbaren Reibungen.

Nicht weil der Kalender nicht gelesen wird. Sondern weil die Frage offen ist:

> **Was gehört auf die Hauptseite – und was nicht?**

Dieses Dokument definiert dafür eine erste Version.

---

## Ziel

Die Hauptseite des Displays soll nicht „möglichst viel“ zeigen, sondern die **nützlichsten vier Karten** für den aktuellen Familienkontext.

Die Logik soll:
- nachvollziehbar sein
- stabil sein
- ohne Rätsel funktionieren
- bewusst kuratieren statt nur numerisch sortieren

---

# 1. Grundsätze

## 1.1 Heute schlägt morgen

Wenn heute relevante Informationen vorhanden sind, dürfen morgige Einträge nur begrenzt Platz auf der Hauptseite einnehmen.

## 1.2 Sichtbarkeit schlägt Vollständigkeit

Die Hauptseite ist keine vollständige Kalenderliste.

Sie ist eine **kuratierte Vorderseite**.

Vollständigkeit gehört auf Unterseiten wie die Family-Ansicht.

## 1.3 Familienrelevanz schlägt private Nebensachen

Einträge, die nur aus Stefans persönlichem Kalender stammen, dürfen nicht dieselbe Dominanz bekommen wie echte Familien- oder Kindertermine.

## 1.4 Ganztägig ist nicht automatisch weniger wichtig

Ein ganztägiger Eintrag kann für den Tag zentral sein. Er darf nicht nur deshalb nach hinten rutschen, weil er keine Uhrzeit hat.

---

# 2. Quellenklassen

Alle Display-Kalenderitems werden zuerst einer Klasse zugeordnet.

## Klasse A – Familienkern
Einträge mit hoher Display-Relevanz:
- `[Familie]`
- `[Arthur]`
- `[Sandra]`

## Klasse B – unterstützende persönliche Familienrelevanz
Persönliche Einträge aus Stefans Kalender, aber nur wenn:
- `Purple category`
- und inhaltlich familienrelevant

## Klasse C – Hintergrund / nicht für Hauptseite
Alles, was nicht die obigen Kriterien erfüllt.

Klasse C erscheint nicht auf der Hauptseite.

---

# 3. Zeitlogik

## 3.1 Heute
Einträge, deren Startdatum heute ist.

Diese haben Vorrang.

### Unterteilung heute
1. **heute mit Uhrzeit**
2. **heute ganztägig**

Wichtig:
Diese Unterteilung ist keine absolute Hierarchie. Sie dient nur der Sortierung innerhalb von Heute.

## 3.2 Morgen
Einträge, deren Startdatum morgen ist.

Diese dürfen auf die Hauptseite, aber nur begrenzt.

## 3.3 Später
Einträge ab übermorgen.

Diese gehören grundsätzlich **nicht auf die Hauptseite**, ausser es gibt aussergewöhnlich wenig Inhalt.

---

# 4. Auswahlregeln für die 4 Hauptkarten

Die Hauptseite zeigt **maximal 4 Terminboxen**.

Die Auswahl erfolgt nicht rein nach Score, sondern nach Regeln.

## Regel 1
Zuerst alle **heutigen Klasse-A-Einträge** sammeln.

## Regel 2
Dann heutige **Klasse-B-Einträge** ergänzen.

## Regel 3
Wenn noch Platz frei ist, darf **maximal 1 morgiger Klasse-A-Eintrag** aufgenommen werden.

## Regel 4
Wenn dann immer noch Platz frei ist, darf **maximal 1 morgiger Klasse-B-Eintrag** aufgenommen werden.

## Regel 5
Einträge ab übermorgen erscheinen auf der Hauptseite nur, wenn sonst weniger als 4 sinnvolle Karten vorhanden sind.

---

# 5. Sortierung innerhalb der Auswahl

Nachdem die Auswahl getroffen wurde, wird innerhalb der gewählten Einträge sortiert.

## Reihenfolge
1. heutige Uhrzeit-Einträge
2. heutige ganztägige Einträge
3. morgige ganztägige Einträge
4. morgige Uhrzeit-Einträge
5. spätere Ausnahmen

### Zusatzpriorität
Innerhalb gleicher Zeitklasse gilt:
- `[Familie]` vor `[Arthur]` / `[Sandra]`
- `[Arthur]` / `[Sandra]` vor Purple-Personal

---

# 6. Begrenzungsregeln gegen Dominanz

## 6.1 Morgen darf die Hauptseite nicht kapern

Es darf **maximal 1 morgiger Eintrag** auf der Hauptseite erscheinen, solange heute bereits 4 sinnvolle Einträge vorhanden sind.

## 6.2 Purple-Personal darf nicht dominieren

Purple-Einträge aus Stefans Kalender dürfen insgesamt **maximal 1 Karte** auf der Hauptseite belegen, solange ausreichend Klasse-A-Inhalt vorhanden ist.

## 6.3 Doppelte Themen vermeiden

Wenn zwei Einträge fast denselben Zweck erfüllen, soll bevorzugt werden:
- der klarere
- der näher liegende
- der familientypischere

---

# 7. Beispiele

## Beispiel A
Heute vorhanden:
- `[Arthur] Schulfrei – Weiterbildung Lehrpersonen` (ganztägig)
- `[Arthur] Tisch aufräumen, LEGO wegräumen, packen` (ganztägig)
- `[Familie] Stefan für Arthur da` (14:30)
- `[Familie] Arthur Helikopter` (18:00)
- `[Arthur] Start Frühlingsferien` (morgen, ganztägig)

### Erwartete Hauptseite
1. `[Familie] Stefan für Arthur da`
2. `[Familie] Arthur Helikopter`
3. `[Arthur] Schulfrei – Weiterbildung Lehrpersonen`
4. `[Arthur] Tisch aufräumen, LEGO wegräumen, packen`

**Nicht auf Hauptseite:**
- `[Arthur] Start Frühlingsferien`

Warum?
Weil heute bereits 4 sinnvolle Karten vorhanden sind.

## Beispiel B
Heute vorhanden:
- `[Arthur] Schulfrei` (ganztägig)
- keine weiteren heutigen Einträge
Morgen vorhanden:
- `[Arthur] Start Frühlingsferien`
- `[Familie] Ausflug`

### Erwartete Hauptseite
1. `[Arthur] Schulfrei`
2. `[Arthur] Start Frühlingsferien`
3. `[Familie] Ausflug`
4. optional leer / anderer sinnvoller Fallback

---

# 8. Family-Seite vs. Hauptseite

## Hauptseite
- kuratiert
- knapp
- nur die wichtigsten Karten

## Family-Seite
- vollständiger
- darf mehr zeigen
- weniger aggressiv priorisiert

Wichtiger Grundsatz:

> Wenn etwas nicht auf der Hauptseite erscheint, heisst das nicht automatisch, dass es falsch gefiltert wurde.

Es kann bewusst auf die Family-Seite gehören.

---

# 9. Nicht-Ziele dieser Version

Diese Version löst bewusst noch nicht:
- semantische Duplikaterkennung
- Subprioritäten zwischen Arthur und Sandra je nach Tageskontext
- automatische Gruppierung ähnlicher Aufgaben
- adaptive Anzahl Boxen je nach Inhaltsdichte

Das kann später kommen.

---

# 10. Implementationshinweise

Die aktuelle reine Score-Logik reicht dafür nicht.

Empfohlen wird stattdessen ein zweistufiges Modell:

1. **Klassifizieren**
   - Quelle
   - Tag (heute/morgen/später)
   - Typ (ganztägig/Uhrzeit)
   - Person/Familie

2. **Auswählen nach Regeln**
   - nicht einfach global sortieren
   - sondern Slot für Slot befüllen

---

# 11. Kurzfassung

Die Hauptseite soll nicht einfach die obersten vier Score-Werte zeigen.

Sie soll zeigen:
- was **heute** wichtig ist
- was **familienrelevant** ist
- und was **jetzt sichtbar sein sollte**

Darum gilt v1:
- heute vor morgen
- Familie/Arthur/Sandra vor Purple-Personal
- ganztägig nicht automatisch nachrangig
- morgen nur begrenzt
- Hauptseite kuratiert, Family-Seite vollständiger

Das ist die erste brauchbare Regelbasis, auf die wir das Display jetzt sauber umbauen können.
