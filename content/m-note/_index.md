+++
title = "M-Note: Notizen als eigene Markdown-Dateien"
description = "M-Note verbindet native Notizen, iCloud Drive, Markdown und Sprachnotizen. Funktionen und aktueller TestFlight-Entwicklungsstand."
template = "prose.html"
[extra]
lang = "de"
+++

**Interne TestFlight-Beta · aktueller Stand: 0.52.2 (Build 99), 21. November 2026**

![M-Note App-Icon](/images/m-note/app-icon.png)

M-Note ist eine native Notiz-App für iPhone und iPad ab iOS 27. Jede Notiz bleibt eine eigene Markdown-Datei in iCloud Drive. Du kannst schreiben, lesen, suchen und deine Notizen in Ordnern ablegen.

## Deine Notizen bleiben Dateien

Der Dateiname ist der Titel. Im Dokument steht dein Markdown, ohne automatisch eingefügte Titelzeile oder vorgeschriebene Metadaten. Notizen und portable Anhänge bleiben über den M-Note-Ordner in iCloud Drive zugänglich. Bereits geladene Notizen lassen sich auch offline bearbeiten.

## Schreiben und Lesen mit Platz für den Inhalt

Die Notizliste zeigt Inhaltsvorschauen und bietet Suche und Sortierung. Bei einer Suche zeigt die Vorschau direkt die passende Stelle im Text. Auf dem iPad bleibt die Liste neben dem Dokument erreichbar. Die separate Leseansicht stellt Überschriften, Listen, Zitate und Code dar. Beim Wechsel zur Anzeige wird der Markdown-Quelltext nicht umgeschrieben.

Titel, Text und Anhänge stehen auf einer gemeinsamen lesbaren Breite. Light und Dark Mode folgen dem System. Wer es ruhiger mag, wählt das monochrome Erscheinungsbild «Graphit». Auf dem iPhone lässt sich die Tastatur im Editor per Taste ausblenden.

## Mehr als getippter Text

Zum Entwicklungsstand gehören Bilder, PDFs, Skizzen und Audioanhänge. Die Texterkennung aus Bildern läuft auf dem Gerät; der erkannte Text kann vor dem Einfügen geprüft werden. Die Teilen-Erweiterung übernimmt Inhalte aus anderen Apps. Auf der Apple Watch lassen sich Sprachaufnahmen erfassen und zur Weiterverarbeitung ans iPhone übertragen.

## Sprachnotizen mit optionaler AI

Audio kann transkribiert und als freie Notiz, Besprechungsnotiz oder Aufgabenliste strukturiert werden. Das Ergebnis erscheint als Entwurf zum Prüfen und Übernehmen. Diese Funktionen benötigen eine Apple-Anmeldung und eine Internetverbindung. Die Verarbeitung läuft über einen Cloudflare-Dienst und OpenAI. Für eine Aufnahme aktivierte automatische Verarbeitung wird durch die entsprechende Einstellung gesteuert.

Die AI-Verarbeitung erfolgt ausserhalb des Geräts. Sie ist damit eine andere Datenverarbeitung als die lokale Texterkennung. Ein Entwurf kann Fehler enthalten und sollte vor der Übernahme geprüft werden.

## Wo M-Note heute steht

M-Note ist in einer internen TestFlight-Beta. Der aktuelle Stand ist Version 0.52.2 (Build 99) vom 21. November 2026. M-Note ist noch nicht öffentlich im App Store erhältlich.

Neu in den letzten Builds:

- **Suche mit Fundstelle.** Die Vorschau in der Notizliste zeigt den Ausschnitt, in dem der Suchbegriff vorkommt.
- **Aufnahmequalität auf einen Blick.** Neben den Anhängen steht eine Einschätzung als «Gut», «Brauchbar» oder «Schlecht». Beim Antippen gibt es konkrete Hinweise.
- **Klarerer Einstieg.** Der erste Start funktioniert auch ohne iCloud Drive, die Schnellaktionen sind beschriftet.
- **Einstellungen auf allen Geräten.** Eigene Prompts, Vorlagen, Darstellung und weitere Einstellungen gleichen sich über iCloud ab.
- **Graphit und Tastatur.** Ein monochromes Erscheinungsbild und eine Taste zum Ausblenden der Tastatur auf dem iPhone.

Die iPad-App lässt sich auch auf Macs mit Apple-Chip ausführen. Vor einem öffentlichen Release stehen noch Prüfungen der iCloud-Synchronisation mit mehreren Geräten und der Übertragung von der Apple Watch aus.

[Früheren Produktbericht lesen](/blog/m-note-markdown-und-sprachnotizen/) · [Alle Apps](/apps/)

## Fragen und Feedback

Bei Fragen zu M-Note erreichst du mich unter [stefan@melf.ch](mailto:stefan@melf.ch?subject=M-Note%20Feedback). Hilfreich sind App-Version, Gerätemodell und eine Beschreibung des Problems. Vertrauliche Notizinhalte sind dafür nicht nötig.
