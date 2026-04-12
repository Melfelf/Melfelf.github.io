+++
title = "Decision Architect: Drei Optionen statt Entscheidungsbrei"
date = 2026-04-12T15:50:00+02:00
draft = false
[extra]
lang = "de"
+++

# Decision Architect: Drei Optionen statt Entscheidungsbrei

Viele digitale Assistenten scheitern nicht daran, dass sie zu wenig wissen.

Sie scheitern daran, dass sie einem Menschen im falschen Moment **zu viel** geben:
- zu viel Analyse
- zu viele Nebenpfade
- zu viel Begründung vor der eigentlichen Entscheidung
- zu wenig klare, wählbare Handlungsmöglichkeiten

Genau daraus entsteht die Idee hinter einem kleinen Interface, das ich aktuell als **Decision Architect** denke.

Nicht als allwissende Entscheidungsmaschine.
Sondern als bewusst reduziertes Entscheidungs-Interface.

## Das Problem

Wenn man eine Frage an ein System stellt, bekommt man oft eine von zwei schlechten Formen zurück:

### Variante 1: Eine scheinbar perfekte Antwort
Das System tut so, als gäbe es eine klare richtige Lösung.

Das ist bequem, aber oft falsch.
Gerade bei echten Alltags- oder Projektentscheidungen gibt es selten nur einen sauberen Weg.

### Variante 2: Eine Textwand mit allem gleichzeitig
Das System liefert:
- Kontext
- Einordnung
- Tradeoffs
- Risiken
- Quellen
- Nebengedanken
- Absicherungen
- vielleicht noch eine Meta-Reflexion dazu

Das ist intellektuell manchmal nett, aber als Benutzeroberfläche oft unerquicklich.

Man will in diesem Moment nicht immer eine Abhandlung lesen.
Man will oft zuerst einfach sehen:

**Was sind meine drei besten Optionen?**

## Die Grundidee

Die Grundidee ist radikal unspektakulär:

> Zeige zuerst drei brauchbare Optionen. Mehr Tiefe nur dann, wenn sie wirklich gebraucht wird.

Das System soll also nicht sofort alles erklären, sondern zuerst die Entscheidungsfläche sauber machen.

## Wie die UI funktionieren soll

Die erste Ansicht ist bewusst knapp.

Es gibt einfach:
- **Vorschlag 1**
- **Vorschlag 2**
- **Vorschlag 3**
- plus ein **Freitext-Feld** darunter

Jeder Vorschlag ist eine kompakte Karte mit:
- Titel
- sehr kurzer Zusammenfassung
- Auswahlmöglichkeit
- einer kleinen Aktion wie „Mehr Infos"

Wichtig ist dabei: Die drei Vorschläge werden **nicht** in starre Typen eingeteilt.

Also nicht:
- schnellste Option
- sicherste Option
- strategisch beste Option

Das wäre manchmal nützlich, würde das System aber auch unnötig in eine feste Dramaturgie pressen.

Die drei Karten sollen einfach drei gute Möglichkeiten sein.
Nicht mehr, aber vor allem auch nicht weniger.

## Progressive Disclosure statt Textlawine

Der eigentliche Trick liegt nicht in den drei Optionen selbst, sondern in der **Informationsstaffelung**.

Standardmässig sieht man nur die kompakte Ebene.

Wenn man bei einem Vorschlag auf „Mehr Infos" klickt, öffnet sich die zweite Ebene:
- kurze Begründung
- relevante Annahmen
- Vor- und Nachteile
- Source / Grundlage

Die Details sind also vorhanden, aber sie liegen nicht sofort im Weg.

Das ist für mich der Kern des ganzen Konzepts:

**Kurz vorne, Tiefe hinten.**

Oder weniger freundlich formuliert:
Der Nutzer soll nicht durch gut gemeinte Analyse am Entscheiden gehindert werden.

## Warum nur drei Optionen?

Weil die meisten Interfaces beim Helfen scheitern, wenn sie zu viele Möglichkeiten gleichzeitig aufblasen.

Drei ist nicht magisch. Aber drei ist oft genug, um:
- echte Alternativen sichtbar zu machen
- keine Scheinsicherheit zu erzeugen
- und trotzdem nicht in Wahlparalyse zu kippen

Eine Option ist zu dogmatisch.
Fünf oder sieben sind in vielen Fällen schon wieder unnötiger Entscheidungsbrei.

Drei ist oft die richtige Menge, um das Denken offen zu halten und die Oberfläche trotzdem ruhig zu halten.

## Warum ein Freitext-Feld dazugehört

Weil kein System die Situation des Nutzers vollständig modelliert.

Das Freitext-Feld hat deshalb eine wichtige Aufgabe:
- eigene Präferenz einbringen
- Sonderfall ergänzen
- Vorschlag korrigieren
- zusätzliche Randbedingung liefern

Ohne dieses Feld wird das System schnell zu einem Auswahlautomaten.
Mit diesem Feld bleibt es ein echter Denkpartner.

## Was nach der Auswahl passiert

Sobald ein Vorschlag ausgewählt wurde, beginnt erst die zweite Phase.

Dann kann das System helfen bei:
- Verfeinerung
- Risikoabschätzung
- nächstem Schritt
- Umsetzungsplan
- Begründung der Entscheidung

Das heisst:

Der **Decision Architect** soll nicht nur beim Wählen helfen, sondern auch beim Übergang von **Option** zu **Handlung**.

## Wofür das nützlich wäre

Ich sehe dafür mehrere sinnvolle Einsatzfelder:

### 1. Alltagsentscheidungen
Zum Beispiel:
- Was soll ich heute priorisieren?
- Soll ich heute Büro, Rennen oder Erledigungen gewichten?
- Welche drei brauchbaren Wege gibt es für diesen Tag?

### 2. Projektentscheidungen
Zum Beispiel:
- Welche Architekturvariante nehmen wir?
- Sollen wir das Feature fixen, vereinfachen oder vertagen?
- Welche drei sinnvollen nächsten Schritte gibt es?

### 3. Advisory-Interface für Assistenten
Das ist für mich besonders spannend.

Viele Assistenten können heute schon viel begründen, viel zusammenfassen und viel strukturieren.
Aber die Übersetzung in eine **ruhige, gute Entscheidungsoberfläche** ist oft noch schwach.

Genau dort könnte so ein Interface sehr nützlich werden.

## Was ich daran bewusst nicht will

Ich will kein Dashboard-Monster.
Ich will keine Entscheidungstheater-Maschine.
Ich will keine Oberfläche, die ihre eigene Cleverness aufführt.

Ich will eher das Gegenteil:
- ruhig
- klar
- knapp
- hilfreich
- vertiefbar, aber nicht aufdringlich

Wenn das System smart ist, muss es das nicht schon im ersten Pixel beweisen.

## Der eigentliche Gedanke dahinter

Am Ende ist das keine rein technische Idee.
Es ist eine kleine Produktthese:

> Gute Entscheidungsunterstützung beginnt nicht mit maximaler Analyse, sondern mit gut kuratierten, auswählbaren Optionen.

Das ist ein Unterschied.

Nicht:
- „Hier sind alle Gedanken. Viel Glück."

Sondern:
- „Hier sind drei brauchbare Wege. Wenn du willst, gehen wir tiefer."

Das ist respektvoller gegenüber Aufmerksamkeit.
Und meistens auch praktischer.

## Wie ich es momentan formulieren würde

Wenn ich das Konzept auf einen Satz reduzieren müsste, wäre es dieser:

> Drei gute Optionen zuerst. Mehr Kontext nur dann, wenn er wirklich gebraucht wird.

Nicht revolutionär.
Aber vielleicht genau die Sorte Interface-Idee, die im Alltag mehr bringt als noch ein weiterer Chat, der alles weiss und trotzdem nicht gut beim Entscheiden hilft.
