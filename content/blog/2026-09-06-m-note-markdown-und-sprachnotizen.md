+++
title = "M-Note: Markdown, Sprachnotizen und mehr Platz zum Schreiben"
date = 2026-09-06T14:10:00+02:00
slug = "m-note-markdown-und-sprachnotizen"
description = "Ein Blick auf M-Note: portable Notizen in iCloud Drive, native Leseansicht, Sprachnotizen und die Arbeit an einer ruhigeren Oberfläche."
[taxonomies]
tags = ["M-Note", "iOS", "SwiftUI", "Markdown", "AI"]
[extra]
lang = "de"
+++

Neben Fokusfuchs entsteht mit M-Note eine zweite native App. Hier stehen Notizen im Mittelpunkt: Gedanken festhalten, später wiederfinden und bei Bedarf aus einer Sprachaufnahme einen brauchbaren Entwurf machen.

M-Note befindet sich in TestFlight. Version 0.14.0 wurde verteilt und bereits verwendet. Der anschliessende Build 0.14.1 wurde am 5. September hochgeladen. Die öffentliche App-Store-Veröffentlichung steht noch aus.

![M-Note App-Icon mit einem M aus Papier und einer Füllfeder](/images/m-note/app-icon.png)

## Eine Notiz ist eine Datei

Die Grundlage ist bewusst einfach. Jede Notiz liegt als eigene Markdown-Datei in iCloud Drive. Ihr Dateiname ist der Titel. M-Note fügt weder eine zusätzliche Titelzeile noch einen vorgeschriebenen Metadatenblock ein.

Damit bleibt der Inhalt auch ausserhalb der App verständlich und bearbeitbar. Ordner organisieren die Dateien, die Suche berücksichtigt Titel und Inhalt. Bereits heruntergeladene Notizen bleiben offline bearbeitbar. iCloud Drive übernimmt die gemeinsame Ablage zwischen Geräten.

Das ist eine Produktentscheidung mit Folgen: Änderungen müssen sorgfältig gespeichert, Dateikonflikte sichtbar behandelt und noch nicht geladene Inhalte als solche erkennbar bleiben. Eine schöne Oberfläche ersetzt diese Arbeit nicht.

## Die Notiz bekommt den Platz

Die letzten Verbesserungen drehen sich um Liste, Editor und Leseansicht. Die Liste zeigt konkrete Inhaltsvorschauen statt austauschbarer Überschriften. Auf dem iPad bleibt sie neben der geöffneten Notiz erreichbar und lässt sich bei Bedarf ausblenden.

Titel, Text und Anhänge werden auf eine gemeinsame lesbare Breite ausgerichtet. Doppelte Aktionen in der Seitenleiste und ein zweiter Navigationstitel entfallen. Selten benötigte Funktionen liegen im Menü, Schreiben und Lesen bleiben direkt erreichbar.

Die getrennte Leseansicht stellt Markdown dar, ohne den ursprünglichen Text umzuschreiben. Nicht unterstützte Blöcke bleiben als Text sichtbar. So soll eine bequemere Anzeige nicht auf Kosten der eigenen Dateien gehen.

## Vom gesprochenen Gedanken zum Entwurf

M-Note unterstützt Audioaufnahmen und ihre Weiterverarbeitung. Auf der Apple Watch gehört eine Aufnahmeoberfläche zum aktuellen Entwicklungsstand. Die Aufnahme wird ans iPhone übertragen und kann dort transkribiert und strukturiert werden.

Je nach Aufgabe entsteht daraus eine freie Notiz, ein Besprechungsentwurf oder eine Aufgabenliste. Das Ergebnis lässt sich vor der Übernahme prüfen. AI kann falsch verstehen, Details auslassen oder unpassend zusammenfassen. Ein Entwurf bleibt deshalb ein Entwurf.

Die Verarbeitung benötigt eine Apple-Anmeldung und läuft über einen Cloudflare-Dienst mit OpenAI. Dabei verlassen die dafür verwendeten Inhalte das Gerät. Für Watch-Aufnahmen kann eine automatische Verarbeitung über eine eigene Einstellung gesteuert werden.

Davon zu unterscheiden ist die Texterkennung aus Bildern. Sie läuft lokal auf dem Gerät und zeigt den erkannten Text vor dem Einfügen zur Bearbeitung an.

## Was noch geprüft werden muss

Zum aktuellen Stand gehören ausserdem Bilder, PDFs, Skizzen, eine Teilen-Erweiterung und die Ausführung der iPad-App auf Macs mit Apple-Chip. Die jüngste Überarbeitung wurde mit Tests für die Notizlogik, zentrale Bedienungswege auf iPhone und iPad sowie den Verarbeitungsdienst geprüft.

Ein Simulator bestätigt aber keine echte iCloud-Synchronisation zwischen angemeldeten Geräten. Auch Watch-Übertragung, Wiedergabe und Audio-Routen brauchen Prüfungen mit gekoppelter Hardware. Diese Punkte bleiben vor einem öffentlichen Release wichtig.

M-Note setzt aktuell iOS beziehungsweise iPadOS 27 voraus. Die Verfügbarkeit des neueren Builds 0.14.1 auf Testergeräten ist noch nicht bestätigt. Der Projektstand und ein öffentlicher Download sind unterschiedliche Dinge.

[Mehr über M-Note und den aktuellen Stand](/m-note/) · [Alle Apps von Melfware](/apps/)
