+++
title = "Fokusfuchs: Meine erste App im App Store"
date = 2026-08-23T22:13:00+02:00
description = "Vom ersten Commit bis zur Veröffentlichung in zwei Wochen: Was Fokusfuchs kann und was ich beim Weg meiner ersten App in den App Store gelernt habe."
draft = false

[taxonomies]
tags = ["Fokusfuchs", "iOS", "SwiftUI", "App Store"]

[extra]
lang = "de"
+++

Am 21. August 2026 ist [Fokusfuchs im App Store](https://apps.apple.com/ch/app/fokusfuchs/id6799122095) erschienen. Version 1.0, kostenlos für iPhone und iPad – und meine erste veröffentlichte App.

Zwischen dem ersten Commit und diesem Eintrag im Store lagen zwei Wochen. Kurz genug, um nach einem Sprint auszusehen. Lang genug, um zu lernen, dass «läuft auf meinem iPhone» und «ist bereit für den App Store» zwei sehr verschiedene Zustände sind.

![Das App-Icon von Fokusfuchs: ein orangefarbener Fuchs in einem Fokus-Ring.](/images/fokusfuchs/app-icon.png)

## Was Fokusfuchs ist

Fokusfuchs ist eine native SwiftUI-App mit kurzen, spielerischen Übungen rund um Aufmerksamkeit, Merkfähigkeit, Lesen und Alltagsorientierung.

Die öffentliche Version 1.0 enthält neun Übungen. Dazu gehören unter anderem Zahlen- und Buchstabenfolgen, Wortblitz, Einmaleins, Monate, Wochentage und analoge Uhrzeiten. Eine Tages-Challenge schafft einen klaren Einstieg; Serien, persönliche Bestzeiten und Abzeichen machen Fortschritt sichtbar, ohne jede Runde in einen Wettbewerb zu verwandeln.

Mehrere Personen können eigene lokale Profile verwenden. Die App braucht kein Konto, enthält keine Werbung und kein Analyse-Tracking. Profile, Einstellungen und Trainingsfortschritt bleiben auf dem Gerät und können dort wieder gelöscht werden.

Diese Einfachheit war nicht nur eine Produktentscheidung. Sie hat auch die technische Architektur geprägt: kein Backend, keine Anmeldung und keine Drittanbieter-Analyse, die erst erklärt oder abgesichert werden müsste.

## Die letzten zehn Prozent sind eine eigene Disziplin

Die Übungen zu bauen war nur ein Teil der Arbeit. Eine App zu veröffentlichen bedeutet zusätzlich:

- Metadaten und Screenshots für verschiedene Geräte vorbereiten,
- kleine Displays und iPads ernst nehmen,
- Dynamic Type und VoiceOver prüfen,
- Datenschutzangaben konsistent halten,
- Builds archivieren, hochladen und durch Apples Prüfungen bringen.

Einer der Builds kam mit `Invalid Binary` und dem Fehler `ITMS-90111` zurück. Das ist kein besonders poetischer Moment, aber ein nützlicher: Eine Release-Pipeline ist erst dann eine Pipeline, wenn sie nicht nur einmal zufällig funktioniert.

Danach wurde der Ablauf robuster, die Checkliste genauer und der nächste Build weniger optimistisch behandelt. Genau solche Details unterscheiden ein Xcode-Projekt von einem Produkt, das andere Menschen tatsächlich installieren können.

## Datenschutz als Ausgangspunkt

Fokusfuchs verarbeitet keine Diagnose- oder Gesundheitsdaten und gibt keine medizinischen Versprechen ab. Es ist eine Übungs-App, kein Medizinprodukt und kein Ersatz für Beratung oder Therapie.

Genauso bewusst ist die Datenseite klein gehalten. Es gibt keine Cloud-Synchronisation, keine Werbe-ID, keine Standort-, Kamera-, Mikrofon- oder Kontaktfreigabe. Die Eingaben und Ergebnisse gehören auf das Gerät, auf dem trainiert wird.

Weniger Infrastruktur ist hier kein Mangel. Es ist eine klare Produktgrenze – und eine, die gut zu einer App passt, in der Konzentration wichtiger sein soll als Kontoverwaltung.

## Veröffentlicht heisst nicht fertig

Im App Store steht aktuell Version 1.0. Parallel entwickelt sich Fokusfuchs bereits weiter. Version 1.2 befindet sich zum Zeitpunkt dieses Texts in TestFlight und ist **noch nicht öffentlich veröffentlicht**.

Der Entwicklungsstand erweitert die App um zwei klar getrennte Trainingswelten: «Schule» für Zahlen, Lesen, Merkfähigkeit, Uhrzeit und Orientierung sowie «Fokus» für geführte und interaktive Konzentrationsübungen. Dazu kommen mehr Übungen, ein neues dunkles Design, Level und Fortschrittsanzeigen sowie adaptive Empfehlungen.

Die Trennung ist mir wichtig: Was im Repo schon funktioniert, ist nicht automatisch das, was heute aus dem App Store geladen wird. Der öffentliche Stand bleibt Version 1.0, bis Apple ein Update freigegeben hat.

## Was von der ersten Veröffentlichung bleibt

Die offensichtlichste Erkenntnis ist: Eine kleine App kann erstaunlich viele Ränder haben. Geräteformate, Bedienungshilfen, Datenschutztexte, Store-Metadaten und Release-Prozesse sind keine Nebensache. Sie sind Teil des Produkts.

Die schönere Erkenntnis ist ebenso schlicht: Fokusfuchs ist jetzt nicht mehr nur ein Projektordner. Die App hat eine öffentliche Version, eine Support-Seite und einen echten Platz im App Store.

Das ist Version 1.0. Im wörtlichen und im übertragenen Sinn.

- [Fokusfuchs kostenlos im App Store](https://apps.apple.com/ch/app/fokusfuchs/id6799122095)
- [Produkt, Support und Datenschutz](/fokusfuchs-ios/)
- [Quellcode und Entwicklungsstand auf GitHub](https://github.com/Melfelf/fokusfuchs-ios)
