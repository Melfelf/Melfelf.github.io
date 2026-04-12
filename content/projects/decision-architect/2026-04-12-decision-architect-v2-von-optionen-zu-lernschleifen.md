+++
title = "Decision Architect V2: Von Optionen zu Lernschleifen"
date = 2026-04-12T16:38:00+02:00
draft = false
[extra]
lang = "de"
+++

# Decision Architect V2: Von Optionen zu Lernschleifen

Die erste Idee hinter dem **Decision Architect** war relativ einfach:

- drei brauchbare Optionen zeigen
- Details nur bei Bedarf öffnen
- Entscheidung nicht mit Analyse erschlagen

Das ist nach wie vor sinnvoll.
Aber je länger ich darüber nachdenke, desto klarer wird: **Eine gute Entscheidungsoberfläche allein reicht nicht.**

Wenn das System nur drei Optionen liefert und danach verschwindet, bleibt ein grosser Teil des eigentlichen Problems ungelöst.

Denn die interessante Frage ist nicht nur:

**Welche Option wurde gewählt?**

Sondern auch:

- wurde sie tatsächlich umgesetzt?
- war sie praktikabel?
- blieb sie liegen?
- war die Entscheidung im Alltag hilfreich?
- haben die Vorschläge überhaupt zur Realität gepasst?

Genau daraus entsteht die nächste Stufe der Idee.

## Von der Auswahloberfläche zum Entscheidungszyklus

Version 2 denkt den Decision Architect nicht mehr nur als Auswahl-UI, sondern als **lernenden Entscheidungszyklus**.

Das System soll nicht nur Optionen anzeigen, sondern eine komplette Schleife unterstützen:

1. Entscheidung vorbereiten
2. Optionen kuratieren
3. Entscheidung treffen
4. spätere Umsetzung rückmelden
5. Ergebnis auswerten
6. künftige Vorschläge verbessern

Damit verschiebt sich der Schwerpunkt.

V1 war vor allem ein gutes Interface.
V2 wird eher ein System, das über Zeit **bessere Entscheidungsvorbereitung** liefern soll.

## Das eigentliche Problem

Viele Alltags- und Projektentscheidungen sind nicht gross genug, um jedes Mal eine saubere Analyse zu rechtfertigen.

Aber sie sind auch nicht klein genug, um beliebig zu sein.

Genau dort entsteht Reibung.

Man merkt oft:
- eigentlich sollte ich kurz sauber überlegen
- eigentlich sollte ich Alternativen vergleichen
- eigentlich sollte ich kurz recherchieren
- eigentlich sollte ich die Konsequenzen mitdenken

Und dann macht man es trotzdem nicht, weil der Aufwand zu hoch ist.

Das führt dazu, dass viele scheinbar kleine Entscheidungen auf wackliger Grundlage getroffen werden.
Nicht aus Dummheit, sondern aus Ermüdung.

## Die Rolle des Agenten

Genau diesen anstrengenden Teil soll der Agent übernehmen.

Nicht die Verantwortung.
Nicht die letzte Entscheidung.
Sondern den kognitiv lästigen Unterbau:

- Optionen vorbereiten
- Annahmen sichtbar machen
- kleine Recherchen durchführen
- Tradeoffs sortieren
- schlechte Vorschläge aussortieren
- Widersprüche benennen
- die Vorschläge auf grösseren Gesamtnutzen prüfen

Das ist für mich die zentrale These hinter V2:

> Der Agent übernimmt den anstrengenden Teil des Hinterfragens, Recherchierens und Kuratierens, damit auch kleine Entscheidungen auf einer besseren Grundlage getroffen werden und über Zeit zu besseren Gesamtergebnissen führen.

## Warum drei Optionen trotzdem bleiben

Die kompakte Oberfläche aus V1 bleibt bestehen.

Der Nutzer soll weiterhin zuerst sehen:
- Vorschlag 1
- Vorschlag 2
- Vorschlag 3
- plus Freitext

Diese Ebene ist weiterhin wichtig, weil sie die kognitive Last klein hält.

Der Unterschied ist nur:
Die drei Vorschläge sollen in V2 nicht mehr einfach rohe Modellantworten sein.
Sie sollen **kuratiert** sein.

## Kuratierung statt roher Generierung

Jede der drei Entscheidungsoptionen soll vor der Anzeige durch eine kleine interne Agentenlogik verbessert werden.

Dafür bieten sich in meinem Setup besonders diese Rollen an:

### 1. Rubberduck+
Rubberduck+ hilft dabei,
- die eigentliche Frage zu schärfen
- versteckte Annahmen sichtbar zu machen
- Widersprüche zu erkennen
- unnötigen Denknebel wegzuschneiden

### 2. Advisory Team
Das Advisory-Team hilft dabei,
- Tradeoffs klarer zu machen
- grössere Zusammenhänge mitzudenken
- lokale Bequemlichkeit von echter Sinnhaftigkeit zu unterscheiden
- Optionen in einen grösseren Kontext einzuordnen

### 3. Recherche-Layer
Nicht jede Entscheidung braucht Recherche.
Aber wenn Fakten oder Vergleichsinfos fehlen, sollte der Agent sie gezielt nachziehen.

Zum Beispiel:
- Preise
- technische Unterschiede
- Fristen
- Kompatibilität
- Erfahrungswerte
- Vergleich von Varianten

Der Punkt ist nicht, jede Mikroentscheidung künstlich aufzublasen.
Sondern die nötige Tiefe genau dort zu liefern, wo sie den Unterschied macht.

## Outcome Tracking: Die Entscheidung endet nicht mit dem Klick

Ein besonders wichtiger Teil von V2 ist die Rückmeldung nach der Entscheidung.

Das System soll später abfragen können:
- erledigt
- teilweise erledigt
- liegen geblieben
- anders gelöst
- optional: warum

Das ist wichtig, weil sonst nur die **Auswahl** optimiert wird, nicht die **tatsächliche Wirkung**.

Ein Vorschlag kann auf dem Bildschirm plausibel wirken und im Alltag trotzdem regelmässig scheitern.
Zum Beispiel weil er:
- zu ambitioniert war
- nicht in den Tagesablauf passt
- zu viel Kontext voraussetzt
- zwar rational gut aussieht, aber praktisch nie umgesetzt wird

Wenn das System solche Muster erkennt, kann es mit der Zeit bessere Vorschläge machen.

## Von der Entscheidung zur Lernschleife

Damit wird aus dem Decision Architect eine Lernschleife:

- Welche Vorschläge werden oft gewählt?
- Welche werden tatsächlich umgesetzt?
- Welche bleiben regelmässig liegen?
- Welche Art von Begründung hilft?
- Wo sind Optionen theoretisch gut, aber praktisch untauglich?
- Welche Mikroentscheidungen zahlen langfristig wirklich auf grössere Ziele ein?

Das ist für mich einer der spannendsten Teile der ganzen Idee.

Denn gute Entscheidungsunterstützung sollte nicht nur im Moment der Auswahl gut aussehen.
Sie sollte über Zeit merken, **was tatsächlich trägt**.

## Was das für kleine Entscheidungen bedeutet

Gerade bei kleinen Entscheidungen wird das interessant.

Nicht bei den grossen, seltenen Grundsatzfragen.
Sondern bei den vielen kleinen Dingen wie:
- was heute wirklich Priorität haben sollte
- welche Erledigung zuerst sinnvoll ist
- ob etwas jetzt gemacht, verschoben oder bewusst ignoriert werden sollte
- welche von mehreren plausiblen kleinen Optionen wirklich den grösseren Nutzen hat

Genau dort ist die Reibung hoch und die Disziplin niedrig.
Und genau dort kann ein guter Agent enorm nützlich sein.

## Was ich bewusst nicht will

Auch in V2 will ich kein System, das:
- jede Entscheidung künstlich dramatisiert
- für alles eine Mini-Strategieberatung aufführt
- aus Kleinkram ein Analyse-Theater macht
- den Nutzer mit Reflexionspflicht nervt

Das Ziel ist nicht mehr Aufwand.
Das Ziel ist **mehr Qualität bei weniger mentalem Verschleiss**.

## Die Form, in der ich es momentan sehe

Wenn ich die V2-Idee in einen Satz giessen müsste, dann so:

> Decision Architect V2 erweitert die reine Auswahloberfläche zu einem lernenden Entscheidungszyklus: Optionen werden vorab durch Agenten kuratiert, mit Recherche angereichert und nach der Auswahl gegen die tatsächliche Umsetzung gespiegelt.

Oder noch einfacher:

> Nicht nur besser wählen. Auch besser daraus lernen.

## Warum mich das interessiert

Mich interessiert diese Richtung, weil sie zwei Welten verbindet, die oft getrennt gedacht werden:

- **ruhige, gute Interfaces**
- **agentische Tiefe im Hintergrund**

Vorne bleibt die Oberfläche knapp.
Hinten darf das System ruhig mehr Arbeit übernehmen.

Das ist für mich viel interessanter als entweder
- eine dumme Oberfläche mit zu wenig Substanz
- oder ein beeindruckend wirkender Agent, der zwar viel redet, aber schlechte Entscheidungsoberflächen baut

## Vorläufiges Fazit

V1 war die Idee eines guten Auswahlfensters.

V2 ist die Idee eines Systems, das:
- kleine Entscheidungen besser vorbereitet
- sie nicht nur anzeigt, sondern kuratiert
- die tatsächliche Umsetzung mitdenkt
- und aus diesem Feedback lernt

Wenn das gut gemacht ist, entsteht vielleicht etwas Seltenes:

Ein Assistent, der nicht nur Antworten liefert, sondern dazu beiträgt, dass auch kleine Entscheidungen im Alltag weniger zufällig und langfristig nützlicher werden.
