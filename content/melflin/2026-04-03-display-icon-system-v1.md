+++
title = "Display Icon System v1"
date = 2026-04-03T10:30:00+02:00
draft = false
[extra]
lang = "de"
+++

# Display Icon System v1

Nach Workflow-, Architektur-, Prioritäts- und Runbook-Doku bleibt noch ein sichtbares, aber wichtiges Thema offen:

**das Icon-System des Displays.**

Vor allem beim Wetter- und Mondbereich hat sich gezeigt, dass kleine Unterschiede in Form, Kontrast und Geometrie auf einem monochromen ePaper-Display sofort auffallen.

Dieses Dokument definiert deshalb **Icon System v1** als gestalterische und technische Basis.

---

## Ziel

Die Icons auf dem Display sollen:
- klar lesbar sein
- auch auf ePaper funktionieren
- nicht verspielt wirken
- nicht nach zusammengewürfeltem Symbolmix aussehen
- in Stil, Gewicht und Grösse zusammenpassen

---

# 1. Grundregeln

## 1.1 Monochrom first

Alle Icons werden für Schwarzweiss / ePaper gedacht.

Das bedeutet:
- kein Farbcode als Bedeutungsträger
- Form muss alleine funktionieren
- Kontrast muss ohne Grauverläufe lesbar bleiben

## 1.2 Weniger Detail, mehr Lesbarkeit

Zu feine Verzierungen funktionieren auf dem Zielmedium schlecht.

Bevorzugt werden:
- klare Konturen
- einfache Flächen
- robuste Silhouetten

## 1.3 Ein gemeinsamer Stil

Wetter- und Mondsymbole dürfen nicht aus völlig verschiedenen visuellen Familien stammen.

Regeln:
- ähnlicher Strichcharakter
- ähnliche visuelle Dichte
- ähnliche optische Grösse
- keine Mischung aus Cartoon + technischer Geometrie

---

# 2. Wetter-Icon-System

## Zustände, die unterstützt werden sollen

### Primäre Wetterzustände
- klar / sonnig
- bewölkt / bedeckt
- Regen / Niesel
- Schnee
- Gewitter
- Nebel

## Anforderungen

Ein Wettericon muss schon ohne Text grob lesbar sein.

Beispiele:
- Sonne: klar als Sonne erkennbar
- Wolke: robuste Wolkensilhouette
- Regen: Wolke + Regenlinien
- Schnee: Wolke + Schneemarkierung
- Gewitter: Wolke + Blitz

## Nicht-Ziel

Das Icon muss nicht jeden meteorologischen Spezialfall ausdrücken.

Es reicht, wenn die Hauptklasse visuell klar ist.

---

# 3. Mond-Icon-System

## Problem aus den bisherigen Iterationen

Die bisherigen Mondsymbole waren zu oft:
- zu geometrisch
- zu abstrakt
- zu kreisförmig
- nicht klar genug als „Mond“ lesbar

## Zielbild

Ein Mondicon soll als Mond erkennbar sein, nicht nur als Kreis mit Phase.

### Das bedeutet
- erkennbare Mond-Silhouette
- Phase visuell nachvollziehbar
- nicht zu technisch
- nicht zu verspielt

## Unterstützte Hauptzustände
Für das Display reichen fünf Zustände:
- Neumond
- zunehmende Sichel / zunehmender Mond
- Halbmond / Viertel
- abnehmender Mond
- Vollmond

Eine interne Berechnung kann feiner sein, aber die visuelle Ausgabe darf auf diese Kernzustände gemappt werden.

---

# 4. Größenregeln

## Wettericon
Soll das dominante Icon im Wetterkopf sein.

### Ziel
- sichtbar
- aber nicht dominant gegenüber Text
- nicht grösser als nötig

## Mondicon
Soll kleiner sein als das Wettericon.

### Ziel
- Ergänzung
- nicht Konkurrenz
- klar als zweites, sekundäres Symbol lesbar

## Verhältnis
Empfohlenes visuelles Verhältnis:
- Wettericon = 1.0
- Mondicon = ca. 0.65 bis 0.75

---

# 5. Platzierung

## Wetterbox
Die Icons sitzen rechts oben im Wetterblock.

### Regeln
- Wettericon links innerhalb des Icon-Clusters
- Mondicon rechts daneben
- beide auf einer ruhigen gemeinsamen Achse
- genügend Freiraum zum Titel

## Trennlinien
Wenn der Platz für das Icon-System knapp wird, hat Lesbarkeit Vorrang vor dekorativer Trennlinie.

Darum gilt:
- im Wetterblock darf eine obere Trennlinie entfallen, wenn sie den Iconbereich unnötig bedrängt

---

# 6. Quellstrategie für Icons

## Bevorzugt
- offene SVG-Quellen
- monochrom gut adaptierbar
- rechtlich sauber nutzbar

## Geeignete Kandidaten
- Wikimedia Commons
- andere offene SVG-Sets mit klarer Lizenz

## Wenn externe Sets übernommen werden
Dann soll dokumentiert werden:
- Quelle
- Lizenz
- welche Anpassungen gemacht wurden
- warum genau dieses Set gewählt wurde

---

# 7. Anpassungsregeln

Externe Icons dürfen angepasst werden, wenn nötig, um sie displaytauglich zu machen.

Zulässige Anpassungen:
- Strichstärke
- Grösse
- Ausschnitt / ViewBox
- Reduktion von Details
- Umstellung auf monochrom

Nicht sinnvoll:
- übermässiges manuelles Umformen, bis das Originalset nicht mehr erkennbar und nicht mehr konsistent ist

---

# 8. Akzeptanzkriterien

Ein finales Icon-System gilt als gut genug, wenn:

### Wetter
- man ohne Text grob erkennt, um welche Wetterlage es geht
- es auf ePaper sauber und ruhig wirkt
- es nicht wie ein Fremdkörper wirkt

### Mond
- man auf den ersten Blick erkennt: **das ist der Mond**
- die Phase grob verständlich bleibt
- das Symbol nicht wie ein Kreis/Diagramm verwechselt wird

### Gesamtbild
- Wetter- und Mondicon wirken wie Teil derselben Familie
- weder zu dominant noch zu klein
- keine visuelle Hektik im Wetterblock

---

# 9. Praktische Entscheidung für v1

Für Version 1 soll gelten:

1. ein festes kleines Icon-Set definieren
2. dieses nicht bei jeder Kleinigkeit wieder austauschen
3. danach erst wieder anfassen, wenn ein klar besserer Ersatz vorhanden ist

Wichtiger Grundsatz:

> Ein stabiles gutes Set ist wertvoller als dauernde kleine Symbol-Experimente.

---

# 10. Kurzfassung

Das Display braucht ein kleines, ruhiges, monochromes Icon-System.

Dafür gilt:
- ePaper-Lesbarkeit vor Detail
- Mond muss wie Mond aussehen
- Wettericon klar und robust
- Wetter grösser als Mond
- ein konsistenter Stil
- externe offene SVGs sind willkommen, wenn sie gut adaptierbar sind

Damit ist das Thema nicht mehr nur Geschmackssache, sondern hat jetzt eine klare Regelbasis.
