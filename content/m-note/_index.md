+++
title = "M-Note: Notizen als eigene Markdown-Dateien"
description = "M-Note verbindet native Notizen, iCloud Drive, Markdown und Sprachnotizen. Funktionen und aktueller TestFlight-Entwicklungsstand."
template = "prose.html"
[extra]
lang = "de"
+++

**In TestFlight-Entwicklung · Stand 6. September 2026**

![M-Note App-Icon](/images/m-note/app-icon.png)

M-Note ist eine native Notiz-App für iPhone und iPad ab iOS 27. Jede Notiz bleibt eine eigene Markdown-Datei in iCloud Drive. Du kannst schreiben, lesen, suchen und deine Notizen in Ordnern ablegen.

## Deine Notizen bleiben Dateien

Der Dateiname ist der Titel. Im Dokument steht dein Markdown, ohne automatisch eingefügte Titelzeile oder vorgeschriebene Metadaten. Notizen und portable Anhänge bleiben über den M-Note-Ordner in iCloud Drive zugänglich. Bereits geladene Notizen lassen sich auch offline bearbeiten.

## Schreiben und Lesen mit Platz für den Inhalt

Die Notizliste zeigt Inhaltsvorschauen und bietet Suche und Sortierung. Auf dem iPad bleibt sie neben dem Dokument erreichbar. Die separate Leseansicht stellt Überschriften, Listen, Zitate und Code dar. Beim Wechsel zur Anzeige wird der Markdown-Quelltext nicht umgeschrieben.

Das aktuelle Refinement richtet Titel, Text und Anhänge auf eine gemeinsame lesbare Breite aus. Doppelte Aktionen in der Seitenleiste entfallen. Light und Dark Mode folgen dem System.

## Mehr als getippter Text

Zum Entwicklungsstand gehören Bilder, PDFs, Skizzen und Audioanhänge. Die Texterkennung aus Bildern läuft auf dem Gerät; der erkannte Text kann vor dem Einfügen geprüft werden. Die Teilen-Erweiterung übernimmt Inhalte aus anderen Apps. Auf der Apple Watch lassen sich Sprachaufnahmen erfassen und zur Weiterverarbeitung ans iPhone übertragen.

## Sprachnotizen mit optionaler AI

Audio kann transkribiert und als freie Notiz, Besprechungsnotiz oder Aufgabenliste strukturiert werden. Das Ergebnis erscheint als Entwurf zum Prüfen und Übernehmen. Diese Funktionen benötigen eine Apple-Anmeldung und eine Internetverbindung. Die Verarbeitung läuft über einen Cloudflare-Dienst und OpenAI. Für eine Aufnahme aktivierte automatische Verarbeitung wird durch die entsprechende Einstellung gesteuert.

Die AI-Verarbeitung erfolgt ausserhalb des Geräts. Sie ist damit eine andere Datenverarbeitung als die lokale Texterkennung. Ein Entwurf kann Fehler enthalten und sollte vor der Übernahme geprüft werden.

## Wo M-Note heute steht

Version 0.14.0 wurde über TestFlight verteilt. Der anschliessende Build 0.14.1 mit Verbesserungen an Liste, Editor und iPad-Darstellung wurde am 5. September hochgeladen. Die Verfügbarkeit dieses neueren Builds auf Testergeräten ist noch nicht bestätigt.

Die iPad-App lässt sich auch auf Macs mit Apple-Chip ausführen. Vor einem öffentlichen Release stehen zusätzliche Prüfungen der iCloud-Synchronisation, des Dateizugriffs und der Watch-Übertragung auf angemeldeten und gekoppelten Geräten an. M-Note ist noch nicht öffentlich im App Store erhältlich.

[Entwicklungsbericht lesen](/blog/m-note-markdown-und-sprachnotizen/) · [Alle Apps](/apps/)

## Fragen und Feedback

Bei Fragen zu M-Note erreichst du mich unter [stefan@melf.ch](mailto:stefan@melf.ch?subject=M-Note%20Feedback). Hilfreich sind App-Version, Gerätemodell und eine Beschreibung des Problems. Vertrauliche Notizinhalte sind dafür nicht nötig.
