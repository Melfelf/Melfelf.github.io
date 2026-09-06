+++
title = "Fokusfuchs 1.3: Mehr Ruhe und ein klarerer Einstieg"
date = 2026-09-06T14:00:00+02:00
slug = "fokusfuchs-1-3-klarer-fokus"
description = "Die nächste Fokusfuchs-Version verbessert Startseite, Kontraste, grosse Schrift und die Zuordnung des persönlichen Fortschritts."
[taxonomies]
tags = ["Fokusfuchs", "iOS", "SwiftUI", "App Store"]
[extra]
lang = "de"
+++

Seit der ersten Veröffentlichung ist Fokusfuchs gewachsen. Aus neun kurzen Übungen sind zwei Trainingswelten geworden: Schule und Fokus. Mit Version 1.3 geht es um die Oberfläche, die den täglichen Einstieg trägt, und um Details, die im Alltag verlässlich funktionieren müssen.

**Stand 6. September 2026:** Version 1.3 mit Build 35 ist bei Apple eingereicht und wartet auf die Prüfung. Die Freigabe für den App Store steht noch aus. Welche Version bereits erhältlich ist, zeigt der [App Store](https://apps.apple.com/ch/app/fokusfuchs/id6799122095).

## Weniger suchen, schneller anfangen

Die Startseite stellt den nächsten Schritt deutlicher heraus. Das Tagesziel braucht weniger Platz, Konzentrationsübungen sind früher erreichbar und die wichtigste Aktion hebt sich klar von den übrigen Informationen ab.

Die dunklen Flächen sind ruhiger und deckend. Warme Akzente markieren den Einstieg, während Karten und Rahmen zurückhaltender werden. Das betrifft die ganze App, von «Heute» über «Lernen» und «Fokus» bis zum Fortschritt.

![Die überarbeitete Fokusfuchs-Startseite in Version 1.3](/images/fokusfuchs/heute-1-3.png)

## Grosse Schrift ist Teil der Gestaltung

Eine Ansicht kann mit Standardschrift gut aussehen und bei grösserem Text trotzdem auseinanderfallen. Deshalb ordnet Version 1.3 einzelne Aktionen und Kennzahlen bei grossen Schriftgrössen untereinander an. Beschriftungen bekommen mehr Raum und bleiben lesbar.

Die Darstellung wurde zusätzlich auf einem kleineren iPhone und einem grossen iPad geprüft. Die App soll ihre Informationen dem verfügbaren Platz anpassen, statt überall dieselbe Anordnung zu erzwingen.

## Fortschritt muss beim richtigen Profil ankommen

Mehrere Personen können Fokusfuchs mit getrennten lokalen Profilen verwenden. Wenn ein Trainingsergebnis nachträglich einem anderen Profil zugeordnet wird, müssen auch die dafür tatsächlich vergebenen XP mitwandern.

Hier lag ein Fehler: Eine neu berechnete Belohnung konnte von den ursprünglich vergebenen Punkten abweichen. Neue Ergebnisse speichern deshalb die tatsächlich vergebenen XP. Bei einer Umzuordnung werden diese Punkte übertragen und die Abzeichen erneut berechnet. Für ältere Ergebnisse ohne diese Zusatzinformation bleibt eine kompatible Berechnung erhalten. Historische Bonuspunkte lassen sich daraus nicht nachträglich vollständig rekonstruieren.

Das ist keine auffällige neue Funktion. Es ist die Art Korrektur, die nötig ist, damit eine Fortschrittsanzeige glaubwürdig bleibt.

## Geprüft bis zum Cloud-Build

Für den finalen Stand liefen 53 Logiktests und 27 Bedienungstests erfolgreich. Der anschliessende Build in Xcode Cloud wurde erfolgreich archiviert und über TestFlight intern verteilt.

Beim Upload zeigte sich noch eine Release-Grenze: Für die bereits veröffentlichte Version 1.2 liess Apple den neuen Build nicht mehr zu. Das Update erhielt deshalb die neue Versionsnummer 1.3. Die technische Prüfung und die anschliessende App-Store-Prüfung sind weiterhin zwei getrennte Schritte.

## Was bleibt

Fokusfuchs ist kostenlos und benötigt kein Konto. Profile, Übungen und Trainingsfortschritt bleiben lokal auf dem Gerät. Werbung und Analyse-Tracking gehören weiterhin nicht zur App.

Die Übungen sind zum Trainieren und Ausprobieren gedacht. Fokusfuchs ist kein Medizinprodukt und gibt keine Diagnose- oder Heilversprechen ab.

[Mehr über Fokusfuchs](/fokusfuchs-ios/) · [Support](/fokusfuchs-ios/support/) · [Fokusfuchs im App Store](https://apps.apple.com/ch/app/fokusfuchs/id6799122095)
